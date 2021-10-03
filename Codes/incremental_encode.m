function [Tag,Bin_Tag,l_new,u_new] = incremental_encode(sequence,pdf)
    format long;
    cdf = zeros(1,length(pdf) + 1);
    msg_probability = 1;

    for i = 2:length(pdf) + 1
        cdf(i) = sum(pdf(1 : i - 1));
    end
    
    l_old = 0;
    u_old = 1;
    mScale = 0;
    Bin_Tag = '';
    for i = 1:length(sequence)
        l_new = l_old + vpa((u_old - l_old)*cdf(sequence(i)+1));
        u_new = l_old + vpa((u_old - l_old)*cdf(sequence(i)+2));
        while((u_new < 0.5) || (l_new >= 0.5) || ((l_new >= 0.25) && (u_new < 0.75)))
            if(u_new < 0.5)
                Bin_Tag = strcat(Bin_Tag,'0',repmat('1',1,mScale));
                l_new = vpa(2*l_new);
                u_new = vpa(2*u_new);
                mScale = 0;
            elseif(l_new >= 0.5)
                Bin_Tag = strcat(Bin_Tag,'1',repmat('0',1,mScale));
                l_new = vpa(2*(l_new - 0.5));
                u_new = vpa(2*(u_new - 0.5));
                mScale = 0;
            elseif((l_new >= 0.25) && (u_new < 0.75))
                while((l_new >= 0.25) && (u_new < 0.75))
                    mScale = mScale + 1;
                    l_new = vpa(2*(l_new - 0.25));
                    u_new = vpa(2*(u_new - 0.25));
                end
            end
        end
        l_old = l_new;
        u_old = u_new;
        msg_probability = msg_probability * pdf(sequence(i)+1);
    end
    
    truncate_value = ceil(-log2(msg_probability)) + 1;
    
    if(length(Bin_Tag) < truncate_value)
        Bin_Tag = strcat(Bin_Tag,'1',repmat('0',1,truncate_value - length(Bin_Tag) - 1));
    else
        Bin_Tag = Bin_Tag(1:truncate_value);
    end
    Tag_array = split(Bin_Tag,'');
    Tag = sum(vpa((2.^-[1:length(Bin_Tag)])*str2double(Tag_array(2:length(Tag_array)-1))));
    
end
    