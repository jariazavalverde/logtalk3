(define (problem os-netbenefit-p22_1)
(:domain openstacks-netbenefit-numeric-ADL)
(:objects 
o1 o2 o3 o4 o5 o6 o7 o8 o9 o10 o11 o12 o13 o14 o15 o16 o17 o18 o19 o20 o21 o22  - order
p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22  - product

)

(:init
(= (stacks-in-use) 0)
(= (max-in-use) 0)

(waiting o1)
(includes o1 p9)

(waiting o2)
(includes o2 p19)

(waiting o3)
(includes o3 p7)(includes o3 p21)

(waiting o4)
(includes o4 p10)

(waiting o5)
(includes o5 p15)(includes o5 p19)

(waiting o6)
(includes o6 p12)

(waiting o7)
(includes o7 p12)

(waiting o8)
(includes o8 p8)(includes o8 p12)(includes o8 p15)

(waiting o9)
(includes o9 p3)(includes o9 p11)(includes o9 p18)

(waiting o10)
(includes o10 p4)

(waiting o11)
(includes o11 p14)

(waiting o12)
(includes o12 p3)

(waiting o13)
(includes o13 p3)(includes o13 p6)(includes o13 p7)(includes o13 p8)(includes o13 p9)(includes o13 p13)

(waiting o14)
(includes o14 p10)(includes o14 p22)

(waiting o15)
(includes o15 p1)(includes o15 p16)(includes o15 p17)

(waiting o16)
(includes o16 p11)

(waiting o17)
(includes o17 p15)

(waiting o18)
(includes o18 p17)

(waiting o19)
(includes o19 p20)

(waiting o20)
(includes o20 p2)(includes o20 p5)(includes o20 p8)

(waiting o21)
(includes o21 p14)

(waiting o22)
(includes o22 p14)

(= (total-cost) 0)

(= (stack-cost) 11)

)

(:goal
(and
(shipped o1)
(shipped o2)
(shipped o3)
(shipped o4)
(shipped o5)
(shipped o6)
(shipped o7)
(shipped o8)
(shipped o9)
(shipped o10)
(shipped o11)
(shipped o12)
(shipped o13)
(shipped o14)
(shipped o15)
(shipped o16)
(shipped o17)
(shipped o18)
(shipped o19)
(shipped o20)
(shipped o21)
(shipped o22)
(preference d-o1-p9 (delivered o1 p9))
(preference d-o2-p19 (delivered o2 p19))
(preference d-o3-p7 (delivered o3 p7))
(preference d-o3-p21 (delivered o3 p21))
(preference d-o4-p10 (delivered o4 p10))
(preference d-o5-p15 (delivered o5 p15))
(preference d-o5-p19 (delivered o5 p19))
(preference d-o6-p12 (delivered o6 p12))
(preference d-o7-p12 (delivered o7 p12))
(preference d-o8-p8 (delivered o8 p8))
(preference d-o8-p12 (delivered o8 p12))
(preference d-o8-p15 (delivered o8 p15))
(preference d-o9-p3 (delivered o9 p3))
(preference d-o9-p11 (delivered o9 p11))
(preference d-o9-p18 (delivered o9 p18))
(preference d-o10-p4 (delivered o10 p4))
(preference d-o11-p14 (delivered o11 p14))
(preference d-o12-p3 (delivered o12 p3))
(preference d-o13-p3 (delivered o13 p3))
(preference d-o13-p6 (delivered o13 p6))
(preference d-o13-p7 (delivered o13 p7))
(preference d-o13-p8 (delivered o13 p8))
(preference d-o13-p9 (delivered o13 p9))
(preference d-o13-p13 (delivered o13 p13))
(preference d-o14-p10 (delivered o14 p10))
(preference d-o14-p22 (delivered o14 p22))
(preference d-o15-p1 (delivered o15 p1))
(preference d-o15-p16 (delivered o15 p16))
(preference d-o15-p17 (delivered o15 p17))
(preference d-o16-p11 (delivered o16 p11))
(preference d-o17-p15 (delivered o17 p15))
(preference d-o18-p17 (delivered o18 p17))
(preference d-o19-p20 (delivered o19 p20))
(preference d-o20-p2 (delivered o20 p2))
(preference d-o20-p5 (delivered o20 p5))
(preference d-o20-p8 (delivered o20 p8))
(preference d-o21-p14 (delivered o21 p14))
(preference d-o22-p14 (delivered o22 p14))
))

(:metric maximize (- 242 (+
(total-cost)
(* (is-violated d-o1-p9) 1)
(* (is-violated d-o2-p19) 1)
(* (is-violated d-o3-p7) 1)
(* (is-violated d-o3-p21) 1)
(* (is-violated d-o4-p10) 1)
(* (is-violated d-o5-p15) 1)
(* (is-violated d-o5-p19) 1)
(* (is-violated d-o6-p12) 1)
(* (is-violated d-o7-p12) 1)
(* (is-violated d-o8-p8) 1)
(* (is-violated d-o8-p12) 1)
(* (is-violated d-o8-p15) 1)
(* (is-violated d-o9-p3) 1)
(* (is-violated d-o9-p11) 1)
(* (is-violated d-o9-p18) 1)
(* (is-violated d-o10-p4) 1)
(* (is-violated d-o11-p14) 1)
(* (is-violated d-o12-p3) 1)
(* (is-violated d-o13-p3) 1)
(* (is-violated d-o13-p6) 1)
(* (is-violated d-o13-p7) 1)
(* (is-violated d-o13-p8) 1)
(* (is-violated d-o13-p9) 1)
(* (is-violated d-o13-p13) 1)
(* (is-violated d-o14-p10) 1)
(* (is-violated d-o14-p22) 1)
(* (is-violated d-o15-p1) 1)
(* (is-violated d-o15-p16) 1)
(* (is-violated d-o15-p17) 1)
(* (is-violated d-o16-p11) 1)
(* (is-violated d-o17-p15) 1)
(* (is-violated d-o18-p17) 1)
(* (is-violated d-o19-p20) 1)
(* (is-violated d-o20-p2) 1)
(* (is-violated d-o20-p5) 1)
(* (is-violated d-o20-p8) 1)
(* (is-violated d-o21-p14) 1)
(* (is-violated d-o22-p14) 1)
)))
)
