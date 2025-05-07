moves: (-1 0; 1 0; 0 -1; 0 1); / up, down, left, right

pre: {
    t: `row`col xkey update id: i from gridTbl `$ string x;
    t: update adjIdx: flip[(row; col)] +/:\: moves from t;
    t: update adjVal: t[; `v] each adjIdx from t;
    t: update adjMatch: v (=/:)' adjVal from t;
    t: update matchIdx: adjIdx @' where each adjMatch from t;
    ({[t] update id: (min each id,' t[; `id] peach matchIdx) from t}/) t
 };

p1: {
    exec sum area * per from 
        select area: count i, per: sum perimeter by id from 
            update perimeter: 4 - sum each adjMatch from x

 };

p2: {
    t: update colDif: (differ;v) fby col, rowDif: (differ;v) fby row from x;
    isSide: {[diff; adjMatch; idx] (not @'[adjMatch; idx]) & diff | @'[prev adjMatch; idx]};
    t: update upSide: isSide[rowDif;adjMatch;0], downSide: isSide[rowDif;adjMatch;1] by row from t;
    t: update leftSide: isSide[colDif;adjMatch;2], rightSide: isSide[colDif;adjMatch;3] by col from t;
    exec sum p from select p: cnt * sides from select cnt: count i, sides: (sum/) (upSide; downSide; leftSide; rightSide) by id from t
 };
