clc;close all;clear

fid = fopen('Y.txt', 'wt' );
a = [-11 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11];

res= 1./(1+exp(-1.*a));
fprintf('%s\n', res);
fp = vfp16(res);
bin = binary(fp);
plot(a, res);
fprintf('%s\n', bin);
fprintf(fid,'%s\n',  bin); 