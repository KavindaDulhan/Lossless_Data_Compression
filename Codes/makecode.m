function makecode(s,codeword)
    global CODE;
    if(length(s{1}) == 1)
        CODE{s{1},2} = strcat(codeword, '1');
    else
        makecode(s{1},strcat(codeword, '1'));
    end
   
    if(length(s{2}) == 1)
        CODE{s{2},2} = strcat(codeword, '0');
    else
        makecode(s{2},strcat(codeword, '0'));
    end
end