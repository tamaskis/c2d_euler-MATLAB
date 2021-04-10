# `c2d_euler` [![View Euler c2d Transformation (c2d_euler) on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/90267-euler-c2d-transformation-c2d_euler)

Transforms a continuous transfer function to a discrete transfer function using the forward and backward Euler methods.



## Syntax

`Hz = c2d_euler(Hs,T,'forward')` \
`Hz = c2d_euler(Hs,T,'backward')`


## Description

`Hz = c2d_euler(Hs,T,'forward')` returns the discrete transfer function `Hz` obtained by applying the forward Euler (i.e. forward difference) transformation to a continuous transfer function `Hs`, where `T` is the sampling period.

`Hz = c2d_euler(Hs,T,'backward')` returns the discrete transfer function `Hz` obtained by applying the backward Euler (i.e. backward difference) transformation to a continuous transfer function `Hs`, where `T` is the sampling period.


## Additional Documentation and Examples

See "DOCUMENTATION.pdf" for additional documentation and examples.
