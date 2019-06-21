require(stringr)
corr <- function(directory, threshold =0){
  
  id <- 1:332
  
  ##directory is a character vector of length 1 indicating the location of the csv files
  ##threshold is a numeric vector of length 1 indicating the number of completely
  ##observed observations (on all variables) required to compute the correlation
  ##between nitrate and sulfate (default is set to 0)
  ## return a numeric vector of correlation
  
  path <- paste0(getwd(), "/", directory, "/") #setting the working directory
  
 ## data <- data.frame() #create an empty data frame
  
  for (i in id) {
    filenumber <- str_pad(i, width=3, side="left", pad="0")
    filename <- paste0(path, filenumber, ".csv")
    casefile <- read.csv(file=filename, header=TRUE)
    casefile1 <- na.omit (casefile)
    print(casefile1)
    nobs <- nrow(casefile1)
    print(nobs)
  
  if (nobs > threshold) {
  
      addcorr <- cor(x=casefile1$nitrates,y=casefile1$sulfates, use ="complete.obs")
  
      print(addcorr)
      return(addcorr)
    }
  #  else {
      
   #   return (0)
  #}
}
}