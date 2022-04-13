import numpy as np

""" 
    
    METODOS NUMERICOS PARA ALGEBRA LINEAL 

    CONTIENE:
    
    1. Sustitución hacia atrás
    2. Sustitución hacia adelante
    3. Triangulación superior
    4. Triangulación inferior
    5. PLU
    6. Determinantes
    7. Metodos de las potencias
    8. Gauss-Seidel
    
    """
    
""" 
    
    1. Sustitución hacia atrás:
    
    Se resuelve el sistema
    UX = B
    
    """

def SustiticionAtras(A):
    
    """ 
    
    Se resuelve el sistema lineal
    
    UX = b
    U: matriz triangulada superior
    b: matriz de estimulos        

    U = [u11, u12, ..., u1n; 
        0, u22..., u2n; 
        ...;
        0, 0, ..., unn]

    """
    
    # Dimensiones de la matriz aumentada
    N = np.shape(A)
    n = N[0]
    m = N[1]
    
    # Sustitucion hacia atras
    for k in range(n-1,-1,-1):
        A[k,n:m] = (A[k,n:m]
        -np.matmul(A[k,(k+1):n],A[(k+1):n,n:m]))/A[k,k]

    return A[:,n:m]

""" 
    
    2. Sustitución hacia adelante:
    
    Se resuelve el sistema
    LX = B
    
    """

def SustiticionAdelante(A):
    
    """ 
    
    Se resuelve el sistema lineal
    
    LX = b
    L: matriz triangulada inferior
    b: matriz de estimulos        

    L = [l11, 0, ..., 0; 
        l21, l22..., 0; 
        ...;
        ln1, ln2, ..., lnn]

    """
    
    # Dimensiones de la matriz aumentada
    N = np.shape(A)
    n = N[0]
    m = N[1]
        
    # Sustitucion hacia adelante
    for k in range(0,n-1):
        A[k,n:m] = (A[k,n:m]
        -np.matmul(A[k,0:(k-1)],A[0:(k-1),n:m]))/A[k,k]

    return A[:,n:m]


""" 
    
    3. Triangulación inferior:
    
        Se triangula la matriz aumentada del multisistema
        aX = B
    
    """

def DownGauss(a,b):
    
    """ 
    
    Se resuelve el sistema lineal   
    aX = b
    donde:
    
    a: matriz de coeficientes
    b: matriz de estimulos
    
    Se utiliza el procedimiento de triangulación hacia 
    abajo desde la izquierda.
    
    """
    
    # Dimensiones de la entradas
    N = np.shape(a)
    L = np.shape(b)
    
    # Comprobacion de dimensiones adecuadas de las entradas
    if N[0] != N[1]:
        # Comprobacion matriz de coeficientes
        print("a no es una matriz cuadra")
    elif N[1] != L[0]:
        # Comprobacion matriz de estimulos
        print("Dimensiones de a y b inadecuadas")
    else:
        # Construyendo matriz aumentada
        A = np.block([a,b])
        # Calculo del maximo absoluto por filas de la matriz aumentada
        a_max = np.max(np.abs(A[:,0:(N[0]-1)]),1)
        # f: Numero de filas de la matriz aumentada
        # n: Numero de filas de la matriz aumentada
        n = N[0]
        f = N[0]+L[1]

    for k in range(0,n-1):  
        # Localizando el indice del absoluto mas grande
        p = np.argmax(np.abs(A[k:n,k])/a_max[k:n])+k

        # Intercambio de filas cuando el indice anterior
        # no esta en la diagonal
        if p != k:
            A[[k, p],k:f] = A[[p, k],k:f]
            
        # Proceso de Triangulacion
        for j in range(k+1,n):
            if A[j,k] != 0.0:
                d = A[j,k]/A[k,k]
                A[j,k:f] = A[j,k:f]-d*A[k,k:f]

    # Llamada del metodo de susticion hacia atras
    X = SustiticionAtras(A)

    return X