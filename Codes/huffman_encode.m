function encode_signal = huffman_encode(signal,symbols,dictionary)
    encode_signal = '';
    for i = 1:length(signal)
        [~,index] = ismember(signal(i), symbols);
        encode_signal = strcat(encode_signal,dictionary(index,2));
    end
    encode_signal = encode_signal{1};
end