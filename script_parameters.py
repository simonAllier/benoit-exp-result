import numpy as np
import os

os.chdir("/media/bgauzens/data/programmes/plantes/simus_forag/essais spe/taille_4/simus/benoit-exp-result")

rep = "exp/results"
cp = np.arange(0.01, 0.08, 0.01)

fic = open("exp", "w")

for d0 in range(4,17):
	for d1 in range(4,17):
		for taille_patch in range(5,22):
			for c_p in cp:
				line = rep + ' ' + str(c_p) + ' ' + str(d0) + ' ' + str(d1) + ' ' + str(taille_patch) + '\n'
				fic.write(line)


fic.close()