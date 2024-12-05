parseInput: {[x]
    rules: exec after by num from flip `num`after!flip "J"$ "|" vs' (where 0 = count each x) # x; / Dict: num -> nums that should come afterwards
    updates: "J"$ "," vs' 1 _ (first where 0 = count each x) _ x; / List: updates
    (rules; updates)
 };

isSorted: {[rules; upd]
    before: (first each cascading)!1_' cascading: til[count upd] _' count[upd] # enlist reverse upd; / Dict: nums -> nums that appear before in the update
    not any raze raze (rules key before) in' before / Check whether any num that comes before, is meant to come after
 };

checkUpdates: {[rules; updates] raze {[rules; u] enlist `upd`correct!(u; isSorted[rules; u])}[rules] each updates}; / Table containing updates and whether they are sorted

p1: {sum exec {x floor count[x] % 2} each upd from (checkUpdates . parseInput x) where correct};

sort: {[rules; u]
    u {[rules; lst; i]
        parts: (0; i) cut lst; / Split list in two
        n: last first parts; / Pick the last element of the first part
        (first[parts] except rules n), (first[parts] inter rules n), last[parts] / Shift any numbers in the first part that should come after n, immediately after n
    }[rules]/ 1 + til count u / Iterate over each position in the list, passing through the updated list
 };

p2: {
    rules: parseInput[x][0]; updates: parseInput[x][1];
    result: sort[rules] each updates where not isSorted[rules] each updates;
    sum {x floor count[x] % 2} each result
 };