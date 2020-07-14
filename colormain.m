function[Sa] = colormain(filename,picnumber)

for peo = 1:5
    Filename = strcat(filename,num2str(picnumber),'-',num2str(peo),'.jpg');
    [sonspace] = colorhist(Filename);
    sonset(:,:,peo) = sonspace;
end

S = zeros(5,1);
for i = 1:5
    for m = 1:7
        for n = 1:5
            if sonset(m,n,i) == 0 && sonset(m,n,1) == 0
                Sa = 1/35;
            else
                Sa = (1 - abs(sonset(m,n,i) - sonset(m,n,1))/max(sonset(m,n,i),sonset(m,n,1)))/35;
            end
            S(i) = S(i) + Sa;
        end
    end
end

Sa = 0;
for i = 2:5
	Sa = abs(S(1) - S(i))  + Sa;
end


