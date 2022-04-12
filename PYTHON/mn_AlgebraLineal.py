import numpy as np

""" METODOS NUMERICOS PARA ALGEBRA LINEAL """

""" Algoritmo de sustitucion hacia atras:
    Se resuelve hasta un multisistema lineal 
    m sistemas de ecuaciones lineales con cada una n ecuaciones
    de n incognitas cada una.
"""

def SustiticionAtras(A):
    
    """ Se resuelve el sistema lineal
    
    UX = b
    U: matriz triangulada superior
    b: matriz de estimulos
    
"""

    # Dimensiones de la matriz aumentada
    N = np.shape(A)
    
    # Sustitucion hacia atras
    for k in range(N[0]-1,-1,-1):
        A[k,N[0]:(N[1]-1)] = (A[k,N[0]:(N[1]-1)]
        -np.matmul(A[k,(k+1):(N[0]-1)],A[(k+1):(N[0]-1),N[0]:(N[1]-1)]))/A[k,k]

    return A[:,N[0]:(N[1]-1)]


""" Algoritmo de Gauss con triangulacion hacia abajo:
    Se resuelve hasta un multisistema lineal 
    m sistemas de ecuaciones lineales con cada una n ecuaciones
    de n incognitas cada una.
"""

def DownGauss(a,b):
    
    """ Se resuelve el sistema lineal
    
    aX = b
    a: matriz de coeficientes
    b: matriz de estimulos
    
"""
    
    # Dimensiones de la entradas
    N = np.shape(a)
    L = np.shape(b)
    
    # Comprobacion de dimensiones adecuadas de las entradas
    if N[0] != N[1]:
        print("a no es una matriz cuadra")
    elif N[1] != L[0]:
        print("Dimensiones de a y b inadecuadas")
    
    
    # Matriz aumentada
    A = np.block([a,b])        
    
    # Calculo del maximo absoluto por filas de la matriz aumentada
    a_max = np.max(np.abs(A[:,0:(N[0]-1)]),1)
    
    # Numero de filas de la matriz aumentada
    f = N[0]+L[1]

    for k in range(0,N[0]-1):
#
#        #v = np.max(np.abs(a[k:(n-1),k])/a_max[k:(n-1)])
        p = np.argmax(np.abs(A[k:(N[0]-1),k])/a_max[k:(N[0]-1)])+k
#
        if p != k:
            A[[k, p],k:(f-1)] = A[[p, k],k:(f-1)]
#        
#        # Triangulacion
#
        for j in range(k+1,N[0]):
            if A[j,k] != 0.0:
                d = A[j,k]/A[k,k]
                A[j,k:(f-1)] = A[j,k:(f-1)]-d*A[k,k:(f-1)]
#
#    # Llamada del metodo de susticion hacia atras
    X = SustiticionAtras(A)
#
    return X

""" Algoritmo de Gauss para la facrorizacion LU:
    Se resuelve hasta un multisistema lineal 
    m sistemas de ecuaciones lineales con cada una n ecuaciones
    de n incognitas cada una.
"""

def PLU(a):
    
    """ Se resuelve el sistema lineal
    
    aX = b
    a: matriz de coeficientes
    b: matriz de estimulos
    
"""
    
    # Dimensiones de la entradas
    N = np.shape(a)
    
    # Comprobacion de dimensiones adecuadas de las entradas
    if N[0] != N[1]:
        print("a no es una matriz cuadra")    
    
    # Matriz aumentada
    A = np.copy(a)        
    
    # Calculo del maximo absoluto por filas de la matriz aumentada
    a_max = np.max(np.abs(A[:,0:(N[0]-1)]),1)
    
    # Numero de filas de la matriz aumentada
    f = N[0]

    for k in range(0,f-1):
        
        p = np.argmax(np.abs(A[k:(f-1),k])/a_max[k:(f-1)])+k
        
        if p != k:
            A[[k, p],0:(f-1)] = A[[p, k],0:(f-1)]
            
        # Triangulacion
        for j in range(k+1,f):
            if A[j,k] != 0.0:
                d = A[j,k]/A[k,k]
                A[j,(k+1):(f-1)] = A[j,(k+1):(f-1)]-d*A[k,(k+1):(f-1)]
                A[j,k] = d

    return A