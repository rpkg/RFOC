\name{imageSCALE}
\alias{imageSCALE}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{add scale on sice of image}
\description{
  add scale to side of an image plot
}
\usage{
imageSCALE(z, col, x, y = NULL, size = NULL, digits = 2, labels = c("breaks", "ranges"), nlab = 10)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{z}{elevation matrix }
  \item{col}{palette for plotting }
  \item{x}{x location on plot }
  \item{y}{y location on plot }
  \item{size}{length of scale }
  \item{digits}{digits on labels }
  \item{labels}{breaks to be plotted }
  \item{nlab}{ number of breaks to be plotted }
}

\value{
 Used for graphical side effect
}

\author{Jonathan M. Lees <jonathan.lees@unc.edu>}

\seealso{}
\examples{
data(volcano)
image(volcano, col=rainbow(100) )

imageSCALE(volcano, rainbow(100), 1.015983, y = 0.874668, size = .01, digits =
2, labels = "breaks", nlab = 20)




}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{aplot}