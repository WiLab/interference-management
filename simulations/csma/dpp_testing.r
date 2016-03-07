dir = '/home/travis/Dropbox/PHD/rstats/'
setwd(dir)

# Read in mat file and extract CSMA enabled transmitter locations
f = readMat('matlab.mat')
g=f['transmitters']
g2=g[[1]]
plot(g2,type='p',main="CSMA Transmitters")

# Form PPP datatype from data
x = g2[,1]
y = g2[,2]
win = owin(c(-30,30),c(-30,30));#window dimensions
g2ppp=ppp(x,y,window=win)

# Fit data to DPP model
result = dppm(g2ppp ~ 1, dppGauss)
plot.dppm(result) # View K function

## Simulate Gauss DPP
#model <- dppGauss(lambda=100, alpha=.05, d=2)
#s = simulate(model, 2)
