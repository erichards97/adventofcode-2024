p1: {
    x: (1 _' x where "(" = first each x: "mul" vs raze x); / Split on "mul", filter where first char = "(", drop leading "("
    x: x where (first each x) in .Q.n; / Filter where first char is numeric
    x: (where each differ each x in\: .Q.n) cut' x; / Split on consecutive numeric / non-numeric
    x: x where all (all each .[x; (::; 0)] in .Q.n; .[x; (::; 1)] ~\: enlist ","; all each .[x; (::; 2)] in .Q.n; ")" = first each .[x; (::; 3)]); / Filter to: "n,m)"
    sum (*/) flip "J"$.[x; (::; 0 2)] / Multiply each stmt and sum the result
 };

/ Split on don't, split each block on do, keep everything after first occurrence of do within each block
p2: {sum p1 each x where 0 < count each x: 1_' "do()" vs/: "don't()" vs "do()", raze x};