import time
import numpy as np
import mn_AlgebraLineal

N = 512
a = np.random.rand(N,N)
b = np.random.rand(N,1)

t_ini = time.time()
A = mn_AlgebraLineal.PLU(a)
t_fin = time.time()

print("El tiempo de computacion fue de ",t_fin-t_ini)