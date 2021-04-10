% c2d_euler  Transforms a continuous transfer function to a discrete 
% transfer function using the forward and backward Euler methods.
%
%   Hz = c2d_euler(Hs,T,'forward') returns the discrete transfer function
%   "Hz" obtained by applying the forward Euler (i.e. forward difference)
%   transformation to a continuous transfer function "Hs", where "T" is the
%   sampling period.
%
%   Hz = c2d_euler(Hs,T,'backward') returns the discrete transfer function
%   "Hz" obtained by applying the backward Euler (i.e. backward difference)
%   transformation to a continuous transfer function "Hs", where "T" is the
%   sampling period.
%
% See also c2d
%
% MATLAB Central File Exchange: 
% GitHub: https://github.com/tamaskis/c2d_euler-MATLAB
%
% See "DOCUMENTATION.pdf" for additional documentation and examples. 
% Examples can also be found in EXAMPLES.m. Both of these files are 
% included with the download.
%
% Copyright (c) 2021 Tamas Kis
% Last Update: 2021-04-10



%% FUNCTION

% INPUT: Hs - continuous transfer function
%        T - sampling period
%        type - 'forward' or 'backward'
% OUTPUT: Hz - discrete transfer function
function Hz = c2d_euler(Hs,T,type)
    
    % symbolic variable for z;
    z = sym('z');
    
    % specified Euler approximation of s
    if strcmp(type,'backward')
        s = (z-1)/(T*z);
    else
        s = (z-1)/T;
    end
    
    % converts transfer function object to symbolic function object
    [num,den] = tfdata(Hs);
    Hz = poly2sym(cell2mat(num),z)/poly2sym(cell2mat(den),z);
    
    % performs Euler transformation
    Hz = simplify(subs(Hz,s));
    
    % obtains numerator and denominator of symbolic expression in MATLAB's
    % "polynomial form"
    [sym_num,sym_den] = numden(Hz);
    num = sym2poly(sym_num);
    den = sym2poly(sym_den);

    % creates discrete transfer function object
    Hz = tf(num,den,T);
    
end