fid = fopen('resultsX.txt', 'wt' );
fid2 = fopen('resultsW.txt', 'wt' );

for i = 1 : 10

        x = randi([-1 1],1,1);
        w = randi([-1 1],1,1);
        
        fprintf('x %d= %s\n',i, x);
        fprintf('w= %d=%s\n', i, w);
        
        if w == 1 || w == 0
            fprintf(fid2,'\t\t\t\t\t\t "%s",\n',  dec2bin(w,9)); 
        else
            fprintf(fid2,'\t\t\t\t\t\t "%s",\n',  "111111111"); 
        end
            
        if x == 1 || x == 0
            fprintf(fid,'\t\t\t\t\t\t "%s",\n',  dec2bin(x,8)); 
        else
            fprintf(fid,'\t\t\t\t\t\t "%s",\n',  "11111111"); 
        end
end


fclose(fid);
fclose(fid2);