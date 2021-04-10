%% Copyright (c) 2021 Tamas Kis

% Examples for using the c2d_euler function.



%% SCRIPT SETUP

% clears variables and command window, closes all figures
clear;
clc;
close all;



%% EXAMPLES

% continuous transfer function
s = tf('s');
Hs = (s+1)/(0.1*s+1);

% sampling period
T = 0.25;

% discrete transfer function obtained via Euler transformations
Hz_forward = c2d_euler(Hs,T,'forward')
Hz_backward = c2d_euler(Hs,T,'backward')