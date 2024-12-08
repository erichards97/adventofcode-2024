allPos: ();

move: {[line; pos] / Moves the guard left (as far as possible) along a 2D line
    wall: max walls where (walls: where "#" = line) < pos;
    wall: $[wall ~ -0W; -1; wall];
    line[wall + 1 + til pos - wall]: "X";
    (line; wall+1)
 };

iter: {[input]
    grid: input 0; 
    guard: input 1; 
    x: input 2; 
    y: input 3;
    if[any (0; count[grid]-1) in\: (x; y); :input];
    allPos,: enlist (guard; x; y);
    if[count[allPos] <> count distinct allPos; :(grid; guard; x; y; 1b)]

    i: $[guard in "^v"; ::; y];
    j: $[guard in "^v"; x; ::];
    pos: $[guard in ">v"; (count[grid]-1)-; (::)] $[guard in "^v"; y; x];
    transform: $[guard in ">v"; reverse; (::)];

    res: move[transform .[grid; (i; j)]; pos];
    resPos: $[transform ~ reverse; (count[grid]-1)-; (::)] res 1;
    
    (
        .[grid; (i; j); :; transform res 0]; / Updated grid
        $[guard = "^"; ">"; guard = ">"; "v"; guard = "v"; "<"; guard = "<"; "^"]; / Next guard direction
        $[guard in "^v"; x; resPos]; / Next x
        $[guard in "^v"; resPos; y]; / Next y
        0b / Loop detected
    )
 };

p1: {[grid]
    startX: first[where any "^<>v" =\: raze grid] mod count grid;
    startY: floor first[where any "^<>v" =\: raze grid] % count grid;
    sum "X" = raze first last (iter\) (grid; .[grid; (startY; startX)]; startX; startY)
 };

p2: {[grid]
    `allPos set ();
    startX: first[where any "^<>v" =\: raze grid] mod count grid;
    startY: floor first[where any "^<>v" =\: raze grid] % count grid;
    res: raze first last (iter\) (grid; .[grid; (startY; startX)]; startX; startY);

    visited: flip ((where "X" = res) mod count grid; floor (where "X" = res) % count grid);

    sum {[grid; startX; startY; obsX; obsY]
        `allPos set ();
        last last (iter\) (.[grid; (obsY; obsX); :; "#"]; .[grid; (startY; startX)]; startX; startY)
    }[grid; startX; startY] .' visited except enlist (startX; startY)
 };