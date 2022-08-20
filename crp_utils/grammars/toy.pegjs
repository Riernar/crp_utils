
Template1<T, U>
    = T U T

Template2<T>
    = T T

Start
    = Template1<Template2<RuleA>, RuleB>
    / RuleB

RuleA
    = "a"

RuleB
    = "b"



