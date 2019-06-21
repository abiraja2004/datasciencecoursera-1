add2 <- function(x,y){
  x+y
}

aboveten <- function(x){
 use <- x >10
 x[use]
}


above <- function(x) {
  use <-x > n
  x[use]
}

columnmean <- function (x) {
  nc <- ncol(x)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(x[,i]), na.rm=removeNA)
  }
}