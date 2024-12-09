p1: {
    tbl: update cA: -1 + (sums; i=i) fby rA from ungroup ([] vA: x; rA: til count x);
    tbl: select from (tbl cross `vB`rB`cB xcol tbl) where vA = vB, vA <> ".", (rA <> rB) and (cA <> cB);
    tbl: distinct select r: ((rB - rA - rB), (rA - rB - rA)), c: ((cB - cA - cB), (cA - cB - cA)) from tbl;
    count select from tbl where r within (0, -1 + count x), c within (0, -1 + count x)
 };

p2: {[inp]
    tbl: update cA: -1 + (sums; i=i) fby rA from ungroup ([] vA: inp; rA: til count inp);
    tbl: select from (tbl cross `vB`rB`cB xcol tbl) where vA = vB, vA <> ".", (rA <> rB) and (cA <> cB);
    t: select rM: rA + (neg[count inp] + til[2 * count inp]) */: rA-rB, cM: cA + (neg[count inp] + til[2 * count inp]) */: cA-cB from tbl;
    count distinct select from (ungroup ungroup t) where rM within (0; -1 + count inp), cM within (0; -1 + count inp)
 };