clc
clear all
close all
A,b;
function x=gauss_elimina(A,b)
	Ab=[A,b];
	n=length(b);
	for k=1:n-1
		for i=k+1:n
			factor=Ab(i,k)/Ab(k,k);
			Ab=(i,k:n+1)=Ab(i,k:n+1)-factor*Ab(k,k:n+1);
			
  end
 end
	x=zeros(n,1);
	x(n)=Ab(n,n+1)/Ab(n,n);
	for i=n-1:-1:1
		x(i)=Ab(i,n+1)/Ab(i,i)-Ab(i,i+1:n)*x(i+1:n)/Ab(i,i);
 end
end
