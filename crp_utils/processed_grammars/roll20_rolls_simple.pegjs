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




Start
  = Expression

Addition
  = head:Multiplication ws* tail:(ws* "+"
  / "-" ws* Multiplication)+ {
          return makeBinaryOperator(head, tail, 1, 3);
      }
  / Multiplication

Multiplication
  = head:Exponentiation ws* tail:(ws* "*"
  / "/"
  / "%" ws* Exponentiation)+ {
          return makeBinaryOperator(head, tail, 1, 3);
      }
  / Exponentiation

Exponentiation
  = head:T tail:("**" T)+ {
          return makeBinaryOperator(head, tail);
      }
  / T

Expression
  = Addition

Term
  = LabelledTerm
  / UnlabelledTerm

LabelledTerm
  = term:UnlabelledTerm ws* label:Label {
          term["label"] = label;
          return term;
      }

Label "inline label"
  = "[" label:[^\[\]]* "]" {
          return label;
      }

UnlabelledTerm
  = DiceRoll
  / FunctionCall
  / Parens
  / Integer
  / Number

DiceRoll
  = .

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

DiceModifers
  = .

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
  = "r" once:"o"? cp:ComparePoint? {
          name = once ? "reroll_once" : "reroll";
          return makeDiceModifier(name, cp);
      }

DiceSelectionModifiers
  = keep:KeepModifier? drop:DropModifier? {
          return {keep:keep, drop:drop};
      }

KeepModifier
  = "k" param:"h"
  / "l"? amount:Integer {
          obj = makeDiceModifier("keep");
          obj.which = KEEP_DROP_WHICH[param ? param : "h"];
          obj.amount = amount;
          return obj;
      }

DropModifier
  = "d" param:"h"
  / "l" amount:Integer {
          obj = makeDiceModifier("drop");
          bj.which = KEEP_DROP_WHICH[param ? param : "l"];
          obj.amount = amount;
          return obj;
      }

DiceDisplayModifiers
  = sort:SortModifier? {
          return {sort: sort};
      }

SortModifier
  = "s" order:"a"
  / "d"? {
          obj = makeDiceModifier("sort");
          obj.order = SORT_ORDER[order ? order : "a"];
          return obj;
      }

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

MatchResultModifier
  = "m" result:"t"? group_size:Integer? {
          obj = makeDiceModifier("match_result");
          obj.change_result = result ? true : false;
          obj.group_size = group_size ? group_size : 2;
          return obj;
      }

ComparePoint
  = operator:"<"
  / "="
  / ">"? target:Integer {
          return {
              type: "compare_point",
              operator: operator ? operator : "=",
              target: target
          }
      }

FunctionCall
  = name:"floor"
  / "round"
  / "ceil"
  / "abs" "(" ws* expression:Expression ws* ")" {
          return makeFunctionCall(name, expression);
      }

Parens
  = "(" ws* expression:Expression ws* ")" {
          return expression
      }

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
  = [ \\t]
