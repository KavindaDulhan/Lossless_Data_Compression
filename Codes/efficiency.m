function [L,H,e] = efficiency(pmf,dictionary)
    L = 0;
    H = 0;
    for i = 1:length(pmf)
        L = L + length(dictionary{i,2}) * pmf(i);
    end
    
    for j = 1:length(pmf)
        H = H - pmf(j)*log2(pmf(j));
    end
    
    e = 100*(H/L);
end