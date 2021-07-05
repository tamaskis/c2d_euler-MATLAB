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
% Contact: tamas.a.kis@outlook.com
% Last Update: 2021-07-05
%
%--------------------------------------------------------------------------
%
% MATLAB Central File Exchange: https://www.mathworks.com/matlabcentral/fileexchange/90267-euler-c2d-transformation-c2d_euler
% GitHub: https://github.com/tamaskis/c2d_euler-MATLAB
%
% See EXAMPLES.mlx for examples and "DOCUMENTATION.pdf" for additional 
% documentation. Both of these files are included with the download.
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   Hs      - (tf) continous transfer function
%   T       - (1×1) sampling period
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