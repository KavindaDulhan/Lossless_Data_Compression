function code = float_to_binary(number,msg_probability)
    truncate_value = ceil(-log2(msg_probability)) + 1;
    number_temp = number;
    code = '';
    i = 0;
    while(number_temp*2 ~= 0 && i < truncate_value)
        number_temp = number_temp*2;
        code = strcat(code, sim2str(floor(number_temp)));
        number_temp = number_temp - floor(number_temp);
        i = i + 1;
    end
end
    