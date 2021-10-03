function [Tag,msg_probability,cdf,l_new,u_new] = arithmetic_encode(sequence,pdf)
    format long;
    cdf = zeros(1,length(pdf) + 1);
    msg_probability = 1;

    for i = 2:length(pdf) + 1
        cdf(i) = sum(pdf(1 : i - 1));
    end
    
    l_old = 0;
    u_old = 1;
    for i = 1:length(sequence)
        l_new = l_old + (u_old - l_old)*cdf(sequence(i)+1);
        u_new = l_old + (u_old - l_old)*cdf(sequence(i)+2);
        l_old = l_new;
        u_old = u_new;
        msg_probability = msg_probability * pdf(sequence(i)+1);
    end
    
    Tag = (l_new + u_new)/2;
end
    