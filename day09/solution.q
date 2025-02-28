prse: {
    t: update isFile: not (til count first x) mod 2 from ([] size: "J"$' first x);
    t: update fileId: -1 + (sums;i=i) fby isFile from t;
    ungroup update block: size#' ?[isFile; fileId; 0N] from t
 }

p1: {
    t: prse x;
    / while[(maxI: exec max i from t where isFile) > minI: exec min i from t where not isFile;
    /     t: update isFile: 1b, block: (exec block from t where i = maxI) from t where i = minI;
    /     t: update isFile: 0b, block: 0N from t where i = maxI;
    / ];
    / sum exec i * block from t where isFile
    toMove: count[where not t`isFile] # reverse exec block from t where isFile;
    t: update block: toMove from t where not isFile;
    sum til[c] * (c: count[where t`isFile]) # t`block
 };

p2: {
    t: prse x;
    move: {[t; currentFileId]
        length: count select from t where block = currentFileId;
        start: exec min i from t where block = currentFileId;
        spaces: select isFile, x, blockSize: next[x] - x from (select chg: differ isFile, isFile, i from t) where chg;
        dest: exec min x from spaces where not isFile, blockSize >= length, x < start;
        if[not dest ~ 0W; 
            t: update isFile: 1b, block: currentFileId from t where i within (dest; dest + length - 1);
            t: update isFile: 0b, block: 0N from t where i within (start; start + length - 1);
        ];
        t
    };
    t: t move/ desc exec distinct fileId from t;
    sum exec i * block from t where isFile
 };