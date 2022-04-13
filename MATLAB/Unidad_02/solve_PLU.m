function X = solve_PLU(A,b)
% Solucion de un sistema de ecuaciones lineales
% utilizando factorizacion PLU
% A: Matriz de coeficientes factorizada
% b: Matriz de estimulos  

  n = length(A(:,1));
  L = tril(A(:,1:n),-1)+eye(n);
  U = triu(A(:,1:n));
  Z = SustitucionAdelante([L b(A(:,end),:)]);
  X = SustitucionAtras([U Z]);
  
end
