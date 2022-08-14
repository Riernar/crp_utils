// Roll20 mathematical formula grammar
// ===================================
//
// Grammar for parsing Roll20 (https://roll20.net/) roll expressions as returned by
// Custom Roll Parsing (https://wiki.roll20.net/Custom_Roll_Parsing) in the "expression"
// part. This expression doesn't contain any attribute, ability, macro or roll queries, as
// this are resolved before.
// If you want to take into account those things, see the roll20_rolls_complex.pegjs grammar
//
// Thanks to https://stackoverflow.com/questions/19390084/parsing-complete-mathematical-expressions-with-peg-js
// for helping with associativity and precedence issues
//
// This grammar contains template rules, that look like C++ templates. To produce a valid
// peggy grammar, it must be preprocessed by the grammar found in ../preprocessor/metagrammar.pegjs
// See the Makefile for the proper commands to run to produce a corrected grammar

// Global initialization
{{

    const KEEP_DROP_WHICH = {"h": "high", "l": "low"};
    const SORT_ORDER = {"a": "ascending", "d": "descending"};

    function makeBinaryOperator(head, tail, operatorIndex=0, rightIndex=1) {
        return tail.reduce(
            function (left, array) {
                return {
                    type: "binary_operator",
                    operator: array[operatorIndex],
                    left: left,
                    right: array[rightIndex]
                };
            },
            head
        );
    }

    function makeFunctionCall(name, expression) {
        return {
            type: "function_call",
            name: name,
            argument: expression
        };
    }

    function makeDiceModifier(name, compare_point=null) {
        obj = {
            type: "modifier",
            name: name
        };
        if (compare_point) {
            obj.compare_point = compare_point.operator;
        }
        return obj;
    }
}}

// In the following grammar, rules are nested into each other
// The most-deeply nested rules have precedence other the less-nested
// rules, e.g. below, multiplication has priority over addition,
//
// Lesf-associativity is handled by the eager consuming of all operators
// of the same priority, and then using a left-reduce on the resulting array

Addition<T>
    = head:Multiplication<T> ws* tail:( ws* ("+" / "-" ) ws* Multiplication<T>)+ {
        return makeBinaryOperator(head, tail, 1, 3);
    }
    / Multiplication<T>

Start =
    Expression

// 0. Template rules

//Addition<T>
//    = head:Multiplication<T> ws* tail:( ws* ("+" / "-" ) ws* Multiplication<T>)+ {
//        return makeBinaryOperator(head, tail, 1, 3);
//    }
//    / Multiplication<T>

Multiplication<T>
    = head:Exponentiation<T> ws* tail:(ws* ("*" / "/" / "%") ws* Exponentiation<T>)+ {
        return makeBinaryOperator(head, tail, 1, 3);
    }
    / Exponentiation<T>

Exponentiation<T>
    = head:T tail:(("**") T)+ {
        return makeBinaryOperator(head, tail);
    }
    / T

// 1. Arithemtic operators

Expression
    = Addition<Term>



// 2. Inline Labels
//    Those bind more tightly than any arithemtic operator, you need
//    parens to bind a label to a whole expression

Term
    = LabelledTerm
    / UnlabelledTerm

LabelledTerm
    = term:UnlabelledTerm ws* label:Label {
        term["label"] = label;
        return term;
    }

Label "inline label"
    = "[" label:[^[\]]* "]" {
        return label;
    }

// 3. Terms, i.e. dice or simpler things (primaries)
//    Basic elements that may be part of arithemtics operations (labelled or not)
//    Dice come up first, because they can consumed parenthesized expression so need to be
//    before

UnlabelledTerm
    = DiceRoll
    / FunctionCall
    / Parens
    / Integer
    / Number

// 3.1 Dice

DiceRoll
    = .


// 3.1.1 base dice

Dice "dice"
    = FateDice
    / NumericDice

FateDice
    = amount:DieNumber "dF" {
        return {
            type: "dice",
            amount: amount,
            sides: "F"
        };
    }

NumericDice
    = amount:DieNumber "d" sides:DieNumber {
        return {
            type: "dice",
            amount: amount,
            sides: sides
        };
    }

DieNumber
    = FunctionCall
    / Parens
    / Integer

// 3.1.2 Modifiers

DiceModifers
    // TODO
    = .

// 3.1.2.1 Roll modifiers
//         Those modifiers change how die are rolled

DiceRollModifiers
    = explode:ExplodingModifier compound:CompoundingModifier penetrating:PenetratingModifier reroll:RerollModifier {
        return {
            expoding: exploding,
            compound: compound,
            penetrating: penetrating,
            reroll:reroll
        };
    }

ExplodingModifier
    = "!" cp:ComparePoint? {
        return makeDiceModifier("exploding", cp);
    }

CompoundingModifier
    = "!!" cp:ComparePoint? {
        return makeDiceModifier("compounding", cp);
    }

PenetratingModifier
    = "!p" cp:ComparePoint? {
        return makeDiceModifier("penetrating", cp);
    }

RerollModifier
    = rerolls:SimpleRerollModifier+ {
        // TODO!!
    }

SimpleRerollModifier
    = "r" once:"o" ? cp:ComparePoint? {
        name = once ? "reroll_once" : "reroll";
        return makeDiceModifier(name, cp);
    }

// 3.1.2.2 Dice selection modifiers
//         Those modifiers change which dice are kept for further computations

DiceSelectionModifiers
    = keep:KeepModifier? drop:DropModifier? {
        return {keep:keep, drop:drop};
    }

KeepModifier
    = "k" param:("h" / "l")? amount:Integer {
        obj = makeDiceModifier("keep");
        obj.which = KEEP_DROP_WHICH[param ? param : "h"];
        obj.amount = amount;
        return obj;
    }

DropModifier
    = "d" param:("h" / "l") amount:Integer {
        obj = makeDiceModifier("drop");
        bj.which = KEEP_DROP_WHICH[param ? param : "l"];
        obj.amount = amount;
        return obj;
    }

// 3.1.2.3 Display Modifiers
//         Those modifiers only change how dices are displayed
DiceDisplayModifiers
    = sort:SortModifier? {
        return {sort: sort};
    }

SortModifier
    = "s" order:("a" / "d")? {
        obj = makeDiceModifier("sort");
        obj.order = SORT_ORDER[order ? order : "a"];
        return obj;
    }

// 3.1.2.3 Success modifiers
//         Those modifiers change the die result to a success computation

DiceSuccessModifiers
    = success:SuccessModifier failure:FailureModifier? {
        return {
            success: success,
            failure: failure
        };
    }

SuccessModifier
    = cp:ComparePoint {
        return makeDiceModifier("success", cp);
    }

FailureModifier
    = "f" cp:ComparePoint {
        return makeDiceModifier("failure", cp);
    }

// 3.1.2.4 Match Modifier
//         This modifier change the roll to a match roll

MatchResultModifier
    = "m" result:"t"? group_size:Integer? {
        obj = makeDiceModifier("match_result");
        obj.change_result = result ? true : false;
        obj.group_size = group_size ? group_size : 2;
        return obj;
    }



// 3.1.3.3 Modifiers helpers

ComparePoint
    = operator:("<" / "=" / ">" )? target:Integer {
        return {
            type: "compare_point",
            operator: operator ? operator : "=",
            target: target
        }
    }


// 3.2 Function calls
//     Roll20 only supports a reduced number of function, make it explicit

FunctionCall
    = name:("floor" / "round" / "ceil" / "abs") "(" ws* expression:Expression ws* ")" {
        return makeFunctionCall(name, expression);
    }

// 3.3 Parenthesised expressions

Parens
    = "(" ws* expression:Expression ws* ")" {
        return expression
    }

// 3.4 Numbers

Integer "integer"
    = DecimalIntegerLiteral {
        return parseInt(text());
    }

Number "number"
    = DecimalIntegerLiteral "." DecimalDigit* ExponentPart? {
        return parseFloat(text());
    }

    / "." DecimalDigit+ ExponentPart? {
        return parseFloat(text());
    }
    / DecimalIntegerLiteral ExponentPart? {
        return parseFloat(text());
    }

DecimalIntegerLiteral
    = "0"
    / NonZeroDigit DecimalDigit*

DecimalDigit
    = [0-9]

NonZeroDigit
    = [1-9]

ExponentPart
    = ExponentIndicator SignedInteger

ExponentIndicator
    = "e"i

SignedInteger
    = [+-]? DecimalDigit+

ws "whitespace"
    = [ \t]