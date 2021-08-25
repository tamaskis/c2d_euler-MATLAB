%==========================================================================
%
% c2d_euler  Transforms a continuous transfer function to a discrete 
% transfer function using the forward and backward Euler methods.
%
%   Hz = c2d_euler(Hs,T,'forward')
%   Hz = c2d_euler(Hs,T,'backward')
%
% See also c2d.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-08-24
% Website: tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Continuous_to_Discrete_Transfer_Function_Transformation_Using_the_Euler_Methods.pdf
%
% REFERENCES:
%   [1] Franklin et. al., "Digital Control of Dynamic Systems", 3rd Ed.
%   [2] https://www.mathworks.com/matlabcentral/answers/96275-how-can-i-convert-a-transfer-function-object-from-the-control-system-toolbox-into-a-symbolic-object
%   [3] https://gist.github.com/maruta/1035254
%   [4] https://www.mathworks.com/matlabcentral/fileexchange/27302-syms-to-tf-conversion
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   Hs      - (tf) continous transfer function
%   T       - (1×1 double) sampling period
%   type    - (char) 'forward' or 'backward'
%
% -------
% OUTPUT:
% -------
%   Hz      - (tf) discrete transfer function
%
%==========================================================================
function Hz = c2d_euler(Hs,T,type)
    
    % symbolic variable for z;
    z = sym('z');
    
    % specified Euler approximation of s
    if strcmpi(type,'backward')
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