interleave: {[x;y] (x,y) (-1 _ raze flip @[count[x] cut til count[x] + count[y]; 1; ,; 0N])};

p1: {
    x: .[.[":" vs' x; (::; 0); "J"$]; (::; 1); ("J"$ 1_ " " vs)];
    ops: (cross/) each (-1 + last flip .[x; (::; 1); count]) #\: enlist (+; *);
    stmts: interleave .' flip (raze ((count each ops) #' enlist each .[x; (::; 1)]); raze ops);
    answers: raze (count each ops) #' enlist each .[x; (::; 0)];
    results: (('[;])over (value;raze;string;reverse)) peach stmts;
    sum distinct answers where answers = results
 };

.q.concat: {[x;y] "J"$ string[y], string x};

check: {[ops; ans; nums]
    ops: (cross/) (-1 + count nums) # enlist ops;
    stmts: interleave .' flip (count[ops] # enlist nums; ops);
    results: value each " " sv' string reverse each stmts;
    $[any results=ans; ans; 0]
 };

p2: {
    x: .[.[":" vs' x; (::; 0); "J"$]; (::; 1); ("J"$ 1_ " " vs)];
    sum .[check[(+; *; `concat)]; ] peach x
 };