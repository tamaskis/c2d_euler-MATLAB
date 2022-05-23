# `c2d_euler` [![View Euler c2d Transformation (c2d_euler) on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/90267-euler-c2d-transformation-c2d_euler)

Transforms a continuous transfer function to a discrete transfer function using the forward and backward Euler methods.



## Syntax

`Hz = c2d_euler(Hs,T,'forward')` \
`Hz = c2d_euler(Hs,T,'backward')`


## Description

`Hz = c2d_euler(Hs,T,'forward')` returns the discrete transfer function `Hz` obtained by applying the forward Euler (i.e. forward difference) transformation to a continuous transfer function `Hs`, where `T` is the sampling period.

`Hz = c2d_euler(Hs,T,'backward')` returns the discrete transfer function `Hz` obtained by applying the backward Euler (i.e. backward difference) transformation to a continuous transfer function `Hs`, where `T` is the sampling period.


## Technical Documentation

Consider a continuous transfer function $H(s)$ that we wish to transform to a discrete transfer function $H(z)$ using a sampling period of $T$ and some approximation method (i.e. some approximate transformation). Both the forward Euler and backward Euler are transformations based on evaluating $H(s)$ at some value of $s$ representing an approximate transformation between $s$ and $z$ [1].


### Forward Euler:

$$s\;\leftarrow\;\frac{z-1}{T}\quad\quad\therefore\;H(z)\;=\;H(s)\big\rvert_{s=\frac{z-1}{T}}$$


### Backward Euler:

$$s\;\leftarrow\;\frac{z-1}{Tz}\quad\quad\therefore\;H(z)\;=\;H(s)\big\rvert_{s=\frac{z-1}{Tz}}$$


## Examples and Additional Documentation

   -  See "EXAMPLES.mlx" or the "Examples" tab on the File Exchange page for examples.
   -  See ["Continuous_to_Discrete_Transfer_Function_Transformation_Using_the_Euler_Methods.pdf"](https://tamaskis.github.io/documentation/Continuous_to_Discrete_Transfer_Function_Transformation_Using_the_Euler_Methods.pdf) (also included with download) for the technical documentation.
