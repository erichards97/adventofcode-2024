/ Example: q run.q -day 01 [-example] [-verify]
\l util.q
args: .Q.opt .z.x;

pth: .Q.dd hsym `$ "day", first args`day;
system "l ", 1 _ string pth `solution.q;
start: .z.p;
input: $[`pre in key `.; pre; ::] read0 pth $[`example in key args; `example.txt; `full.txt];
show "Parsing time taken: ", string .z.p - start;

run: {
    show "Part ", string x;
    start: .z.p;
    r: (value `$ "p", string x) input;
    show "Time taken: ", string .z.p - start;

    show "Result: ", string r;
    if[`verify in key args; show "Expected: ", @[;x-1] read0 pth `answers.txt];
 };

run 1;
if[`p2 in key `.; show "---"; run 2];

if[not `debug in key args; exit 0];
