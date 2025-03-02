move: {[grid; trail]
    pos: -2 # trail;
    val: grid . pos;
    newPos: pos +/: (-1 0; 1 0; 0 -1; 0 1);
    newVal: grid ./: newPos;
    newPos where newVal = val + 1
 };

moveAll: {[grid; trails] raze {y ,/: move[x; y]}[grid] peach trails};

getTrails: {
    grid: "J"$'' x;
    startingPos: flip ({floor y % x}; {y mod x}) .\: (count x; where 0 = raze grid);
    res: (moveAll[grid]\) startingPos;
    res: 2 cut' reverse[res] 1
 };

p1: {count distinct flip (first; last) (@')\: getTrails x};

p2: {count flip (first; last) (@')\: getTrails x};