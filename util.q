gridTbl: {update col: i mod count first x, row: floor i % count first x from ([] v: raze x)};
tblGrid: {(last x`row) cut (x: `row`col xasc `row`col`v # x)`v};