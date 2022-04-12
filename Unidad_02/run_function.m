clc
clear all
close all

n = 256;
a = rand(n,n);
b = ones(n,1);

tic
%x = gauss_eliminacion(a,b);
A = PLU(a);
toc
