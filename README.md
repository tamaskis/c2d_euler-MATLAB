# `c2d_euler` [![View Euler c2d Transformation (c2d_euler) on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/90267-euler-c2d-transformation-c2d_euler)

Transforms a continuous transfer function to a discrete transfer function using the forward and backward Euler methods.


## Syntax

`Hz = c2d_euler(Hs,T,type)` \
`Hz = c2d_euler(Hs,T,type,output,normalize)`


## Inputs

- `Hs` (1×1 `'tf'` or `'zpk'`): continuous transfer function
- `T` (1×1 double): sampling period
- `type` (`char` array): `'forward'` or `'backward`
- `output` (OPTIONAL) (`char` array): specifies output type (`'tf'` or `'zpk'`) (defaults to `'tf'`)
- `normalize` (OPTIONAL) (1×1 `logical`) `true` if transfer function should be normalized, `false` otherwise (defaults to `false`)

## Outputs

- `Hz` (1×1 `tf` or `zpk`): discrete transfer function


## Examples and Additional Documentation

   -  See "EXAMPLES.mlx" or the "Examples" tab on the File Exchange page for examples.
   -  See ["Continuous_to_Discrete_Transfer_Function_Transformation_Using_the_Euler_Methods.pdf"](https://tamaskis.github.io/files/Continuous_to_Discrete_Transfer_Function_Transformation_Using_the_Euler_Methods.pdf) (also included with download) for the technical documentation.
