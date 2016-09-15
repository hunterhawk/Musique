function [ count ] = histogram( data , category )

    result = LBP(data);
    result_vector = result(:);
    count = zeros(1,257);
    for i = 1:length(result_vector)
        x = result_vector(i);
        count(x+1) = count(x+1)+1;
    end
    if( category == 1)
        count(257) = 1;
    else
        count(257) = 0;
    end
    
end

