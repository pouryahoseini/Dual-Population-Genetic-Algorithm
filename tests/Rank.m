% A simple script to rank the genetic algorithm variants in achieving better fitness values

rank=zeros(1,5);

for ii=1:19
    
    [a, b, c, d, e] = Compare_Averages(ii);
    [~,sort_index]=sort([a b c d e], 'descend');
    for jj=1:5 
        rank(jj)=rank(jj)+find(sort_index==jj); 
    end

end

rank=rank/19;

disp(rank);