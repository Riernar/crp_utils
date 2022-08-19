Start
    = Template1<Template2<RuleA>, RuleB>
    / RuleB

Template1<T, U>
    = T U T

Template2<T>
    = T T

RuleA
    = "a"

RuleB
    = "b"