tab <- xtabs(n_failures ~ leg + compressor_no, data = piston)
tab
chisq.test(tab)
