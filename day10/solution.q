directions: (-1 0; 1 0; 0 -1; 0 1);

move: {[grid; pos]
    val: grid . pos;
    newPos: pos +/: directions;
    newVal: grid ./: newPos;
    newPos where newVal = val + 1
 };

move2: {[grid; trail]
    pos: -2 # trail;
    val: grid . pos;
    newPos: pos +/: directions;
    newVal: grid ./: newPos;
    newPos where newVal = val + 1
 };

p1: {
    grid: "J"$'' x;
    startingPos: flip ({floor y % x}; {y mod x}) .\: (count x; where 0 = raze grid);
    res: raze {y ,/: move[x; y]}[grid] each startingPos;
    res2: raze {y ,/: move2[x; y]}[grid] each res;
    'err;
 };