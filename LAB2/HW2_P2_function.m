function [out] = HW2_P2_function(in)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    if  (in < 5) & (in >= -5)
        out = -2.*abs(in)+10;
    elseif (in < 10) & (in >= 5)
        out = 10;
    else
        out = 0;
    end
    
end

