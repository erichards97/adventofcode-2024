/ Example: q run.q -day 01 [-example] [-verify]
args: .Q.opt .z.x;

pth: .Q.dd hsym `$ "day", first args`day;
system "l ", 1 _ string pth `solution.q;
input: read0 pth $[`example in key args; `example.txt; `full.txt];

run: {
    show "Part ", string x;
    start: .z.p;
    r: (value `$ "p", string x) input;
    end: .z.p;

    show "Result: ", string r;
    if[`verify in key args; show "Expected: ", @[;x-1] read0 pth `answers.txt];
    show "Time taken: ", string end - start;
 };

run 1;
if[`p2 in key `.; show "---"; run 2];

exit 0;