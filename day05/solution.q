p1: {
    rules: exec after by num from `num xgroup flip `num`after ! flip "J"$ "|" vs' (where 0 = count each x) # x; / Dict of num -> nums that must come after
    updates: "J"$ "," vs' 1 _ (first where 0 = count each x) _ x; / List of updates
    sum {[rules; u]
        before: (first each cascading) ! 1_' cascading: til[count u] _' count[u] # enlist reverse u; / Dict of nums -> nums that come before in the update
        $[any raze raze (rules key before) in' before; 0; u floor[count[u] % 2]] / If any num that comes before, is meant to come after
    }[rules] each updates
 };