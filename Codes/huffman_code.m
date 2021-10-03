function code_dictionary = huffman_code(sig,pmf)

    global CODE

    CODE = cell(length(pmf),2);

    symbols = cell(length(pmf),1);
    for i = 1:length(pmf)
        symbols{i} = i;
        CODE{symbols{i},1} = sig(i);
    end

    while(length(pmf)>2)
        [pmf,i] = sort(pmf);
        pmf(2) = pmf(1) + pmf(2);
        pmf(1) = [];
        symbols = symbols(i);
        symbols{2} = {symbols{1},symbols{2}};
        symbols(1) = [];
    end
    [pmf,i] = sort(pmf);
    symbols = symbols(i);
    
    makecode(symbols,[]);
    
    code_dictionary = CODE;
end