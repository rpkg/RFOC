nipXY <-
function(MEC, x=x, y=y, focsiz=1, fcol=gray(0.90), nipcol="black", cex=.4)
  {
    if(missing(fcol)) { fcol = gray(0.90) }
    if(missing(nipcol)) { nipcol =  fcol  }
    if(is.null(MEC$UP)) MEC$UP = TRUE
    if(missing(cex)) { cex=.4  }

###############  use this to set plotting region for symbols
    
    vadj=0.5
    hadj=0.5

    xy <- xy.coords(x,y,recycle=TRUE)

    pin <- par('pin')
    usr <- par('usr')
    usr.x <- usr[2] - usr[1]
    usr.y <- usr[4] - usr[3]

    tmp <- list()
    tmp$x <- grconvertX(xy$x, to='npc')
    tmp$y <- grconvertY(xy$y, to='npc')

    tmp.xlen <- length(tmp$x)


    focsiz <- rep(focsiz, length.out=tmp.xlen)
    x.low  <- tmp$x -    hadj *focsiz/pin[1]
    x.high <- tmp$x + (1-hadj)*focsiz/pin[1]
    y.low  <- tmp$y -    vadj *focsiz/pin[2]
    y.high <- tmp$y + (1-vadj)*focsiz/pin[2]


    xy.low <- list()
    xy.low$x <- grconvertX(x.low, from='npc', to='nfc')
    xy.low$y <- grconvertY(y.low, from='npc', to='nfc')

    xy.high <- list()
    xy.high$x <- grconvertX(x.high, from='npc', to='nfc')
    xy.high$y <- grconvertY(y.high, from='npc', to='nfc')

    op <- par(c('plt','usr','xpd'))
    on.exit(par(op))
    par(xpd=TRUE)
    par(plt=c(xy.low$x,xy.high$x,xy.low$y,xy.high$y), new=TRUE)
    par(usr=c(-1,1,-1,1))
######################

    LP1 = lowplane( MEC$az1, MEC$dip1, col=1, UP=MEC$UP, PLOT=FALSE)

    lines(LP1$x, LP1$y, col=fcol, xpd=TRUE )

    A1 = RSEIS::TOCART(MEC$U$az, 90-MEC$U$dip)
    A2 = RSEIS::TOCART(MEC$V$az,  90-MEC$V$dip)
    N = CROSSL(A1, A2)
    Q = qpoint(N$az, N$dip , lab="N", UP=MEC$UP, PLOT=FALSE)
    points(Q$x, Q$y, pch=16, col=nipcol, cex=cex, xpd=TRUE)

    invisible(list(Q=Q, N=N) )
  }
