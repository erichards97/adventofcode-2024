p1: {
    tbl: update column: (sums; i=i) fby row from ungroup ([] letter: x; row: til count x);
    Xs: select from tbl where letter = "X";
    vertical: {([] row: x + til 4; column: y; letter: "XMAS")} .' flip value exec row, column from Xs;
    verticalRev: {([] row: x - til 4; column: y; letter: "XMAS")} .' flip value exec row, column from Xs;
    horizontal: {([] row: x; column: y + til 4; letter: "XMAS")} .' flip value exec row, column from Xs;
    horizontalRev: {([] row: x; column: y - til 4; letter: "XMAS")} .' flip value exec row, column from Xs;
    diagonalRD: {([] row: x + til 4; column: y - til 4; letter: "XMAS")} .' flip value exec row, column from Xs;
    diagonalRA: {([] row: x + til 4; column: y + til 4; letter: "XMAS")} .' flip value exec row, column from Xs;
    diagonalLD: {([] row: x - til 4; column: y - til 4; letter: "XMAS")} .' flip value exec row, column from Xs;
    diagonalLA: {([] row: x - til 4; column: y + til 4; letter: "XMAS")} .' flip value exec row, column from Xs;
    count where all each raze[(vertical; verticalRev; horizontal; horizontalRev; diagonalRD; diagonalRA; diagonalLD; diagonalLA)] in\: tbl
 };

p2: {
    tbl: update column: (sums; i=i) fby row from ungroup ([] letter: x; row: til count x);
    sum {[t; x; y]
        topLeft: first exec letter from t where row = (x-1), column = (y-1);
        topRight: first exec letter from t where row = (x-1), column = (y+1);
        bottomLeft: first exec letter from t where row = (x+1), column = (y-1);
        bottomRight: first exec letter from t where row = (x+1), column = (y+1);
        all all each "MS" in/: ((topLeft; bottomRight); (topRight; bottomLeft))
    }[tbl] .' flip exec (row; column) from tbl where letter = "A"
 };