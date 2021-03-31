function [out] = MySinc(in)
% MYSINC: This is the MySinc function for HW1P6
%   Outputs 1 when input is 0, otherwise outputs sin(x)/x
    if in == 0              
        out = 1;            % Outputs 1 when input is 0
    else
        out = sin(in)/in;   % Otherwise computes sin(x)/x
    end
end

