`rotx3` <-
function( deg )
  {
    rad1 = deg * 0.0174532925199;
    r = diag(3)
    r[2, 2] = cos(rad1)
    r[2, 3] = sin(rad1)
    r[3, 3] = r[2, 2]
    r[3, 2] = -r[2, 3]
    return(r)

  }

