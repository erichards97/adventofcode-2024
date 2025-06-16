pre: {
    x: " " vs' x @' where each x in\: (.Q.n, " ");
    flip each "J"$-2#'' 3 cut x where 0 < (count raze ::) each x
 };

cost: {[eqn]
    e2: @[eqn; 0; eqn[1;0]*]; / multiply through by A co-efficient
    e2: @[e2; 1; eqn[0;0]*];
    bEqn: last (-) prior e2; / subtract one eqn from the other, removing the A term
    b: last[bEqn] % bEqn 1; / divide through by B co-efficient to get B
    a: ((last eqn 0) - b * first[eqn] 1) % first first eqn; / now find A
    $[all 0 = (a; b) mod 1; b + 3 * a; 0Nj] / if integer soln, return costs
 };

p1: {sum costs where not null costs: cost peach x};

p2: {sum costs where not null costs: cost peach .[x; (::; ::; 2); 10000000000000+]};