clc
clear all
close all
c=1*10^-3;
A=[0,0,0;0,c,0;0,0,0];
B=-[-0.01,0.01,-1;0.01,-0.01,-0;-1,-0,-0];
J=@(t)[0;0;12+6sin(120pi(t))];
h=0.02;
V[0;0;0];
t=linspace(0,1,1000)
Y=zeros((3,1000);
for k=1:n-1
	gauss_elimina(A,B);
	Y=(:,k+1)=Y;
end
end


	 