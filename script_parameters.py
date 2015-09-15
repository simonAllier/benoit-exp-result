import numpy as np
import os

os.chdir("/media/bgauzens/data/programmes/plantes/simu_interac/simus/simus/benoit-exp-result/")

rep = "exp/results"
#cp = np.arange(0.01, 0.08, 0.01)
cp  = np.arange(0.0, 0.04, 0.002)
dif = np.array([1, 1.2, 1.5, 2, 3, 5])

fic = open("exp", "w")
graine = 1
for d0 in range(4,17):
	for d1 in range(4,d0+1):
		for taille_patch in range(2,24,2):
			for c_p in cp:
				for d in dif:
					line = rep + ' ' + str(c_p) + ' ' + str(d0) + ' ' + str(d1) + ' ' + str(taille_patch) + ' ' + str(d) + ' ' + '5' + ' ' + str(graine) + '\n'
					fic.write(line)
					graine = graine +1
					if graine == 30000:
						graine = 1


fic.close()