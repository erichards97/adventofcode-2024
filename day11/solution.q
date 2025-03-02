blink: {$[x = 0;
        (),1;
    0 = (count string x) mod 2;
        (),"J"$ (2i;0Ni) # string x;
    (),x * 2024]};

p1: {count last 25 {raze blink peach x}\ "J"$" " vs first x};

p2: {exec sum cnt from last 75 {select sum cnt by stone from ungroup select stone: blink peach stone, cnt from x}\ update cnt: 1 from flip ([stone: "J"$" " vs first x])};