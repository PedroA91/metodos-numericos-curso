import time
import numpy as np
import mn_AlgebraLineal

N = 4
a = np.random.rand(N,N)
b = np.random.rand(N,1)

t_ini = time.time()
P,L,U = mn_AlgebraLineal.PLU(a)
t_fin = time.time()

print("El tiempo de computacion fue de ",t_fin-t_ini)