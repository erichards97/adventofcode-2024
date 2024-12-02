safe: {raze (all each') x within/: ((-3; -1); (1; 3))};

p1: {sum safe 1_' deltas each  "J"$ " " vs' x};

combos: {{x (til count x) except y}[x] each til count x};

p2: {sum any each safe each 1_'' deltas each' combos each "J"$ " " vs' x};