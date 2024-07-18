from fxpmath import Fxp
import numpy as np
import math

#%%
#Convirtiendo la constante A a punto fijo

# Vamos a representarlo como 1bits + 2bitsint . + 3bitsfrac = 6
a = Fxp(3.7, signed = True, n_word = 6, n_frac=3)
a.info(verbose=2)

#%%
### Obteniendo el coseno
time = np.linspace(0, 1, 16)
cos_ana = np.cos(2*math.pi*time)


cos_cuan = Fxp(cos_ana, signed=True, n_word=6, n_frac=5)
cos_cuan.info(verbose=2)

#%%
### Sumando A * B
acos_cuan = a * cos_cuan
acos_cuan.info(verbose=2)


acos_cuan.resize(True, 10, 5)
acos_cuan.info(verbose=2)
#%%
print("B :")
b = Fxp(13.2, signed = True, n_word = 10, n_frac=5)
b.info(verbose=2)

#%% Out
dataout = b + acos_cuan
dataout.info(verbose=2)

#%%

dataout.resize(False, 6, 2)
dataout.info(verbose=2)
#%% 
#Calculo de SQNR

#Px
v_out = cos_ana*3.7 + 13.2
p_x = 0
for i in range(len(v_out)):
    p_x = p_x + math.pow(abs(v_out[i]), 2)
p_x = p_x/len(v_out)

#Pn
v_diff = v_out - dataout

p_n = 0
for i in range(len(v_diff)):
    p_n = p_n + math.pow(abs(v_diff[i]), 2)
p_n = p_n/len(v_diff)

SQNR = 10*math.log(p_x / p_n, 10)
print(SQNR)