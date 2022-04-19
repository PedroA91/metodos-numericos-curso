RUTINAS PRINCIPALES DE ÁLGEBRA LINEAL NÚMERICA

Esta dirección contiene los siguientes archivos:

- gauss_eliminacion.m
- gauss_eliminacion_v2.m (versión vectorizada)

    %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %
    %
    % FUNCION QUE IMPLEMENTA LAS ELIMINACIONES GAUSSIANAS 
    % CON INTERCAMBIO DE FILAS SIGUIENDO 
    % EL ESQUEMA PIVOTEO PARCIAL Y ESCALAMIENTO
    %
    % Considere el sistema multilineal:
    % aX=b
    % 
    % a: matriz de coeficientes, matriz cuadrada invertible
    % b: matriz de estimulos, por cada sistema de ecuaciones
    % esta matriz tiene una columna
    %
    %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  % 

- SustitucionAdelante.m
  
    %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %
    %
    % IMPLEMENTACIÓN COMPUTACIONAL DEL PROCEDIMIENTO 
    % DE SOLUCIÓN DE MATRICES TRIANGULADAS INFERIORES
    % 
    % Considere el sistema:
    % aX = b
    % donde a es una matriz triangulada superior
    % a: [a11, 0, ..., 0; a21, 0, ..., 0; ...; an1, an2, ..., 0]
    % b: [b11 b12 ... b1m; b21 ... b2n; ...; bn1 bn2 ... bnm]
    % La matriz A está relacionada con las anteriores, mediante
    % A: [a b]
    %
    %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  % 

- SustitucionAtras.m

    %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %
    %
    % IMPLEMENTACIÓN COMPUTACIONAL DEL PROCEDIMIENTO 
    % DE SOLUCIÓN DE MATRICES TRIANGULADAS SUPERIORES
    % 
    % Considere el sistema:
    % aX = b
    % donde a es una matriz triangulada superior
    % a: [a11, a12, ..., a1n; 0, a21, ..., a2n; ...; 0, 0, ..., ann]
    % b: [b11 b12 ... b1m; b21 ... b2n; ...; bn1 bn2 ... bnm]
    % La matriz A está relacionada con las anteriores, mediante
    % A: [a b]
    %
    %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %

- PLU.m
- PLU_v2.m (versión vectorizada)

    %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  % 
    %
    % FUNCION QUE IMPLEMENTA LA FACTORIZACION PLU
    % MEDIANTE LAS ELIMINACIONES GAUSSIANAS 
    % CON INTERCAMBIO DE FILAS SIGUIENDO 
    % EL ESQUEMA PIVOTEO PARCIAL Y ESCALAMIENTO
    %
    % Considere el sistema aX=b
    % a: matriz de coeficientes, matriz cuadrada invertible
    % esta matriz tiene una columna
    % 
    % Se utilizan las funciones:
    % 
    % - SustitucionAdelante.m
    % - SustitucionAtras.m
    %
    %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %

- solve_PLU.m

    %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %
    %
    % SOLUCION DE UN SISTEMA DE ECUACIONES LINEALES
    % UTILIZANDO FACTORIZACION PLU
    %
    % A: Matriz de coeficientes factorizada obtenida de PLU.m
    % b: Matriz de estimulos, por cada sistema hay una columna
    %
    %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %

- determinante.m

    %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %
    % FUNCIÓN PARA CALCULAR EL DETERMINANTE
    % 
    % a: es la matriz con determinante por calcular
    %
    %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %