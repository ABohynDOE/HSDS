tab <- xtabs(n_failures ~ comp_id + leg, data = piston)
tab

chisq.test(tab)
