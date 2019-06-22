require(stringr)
corr <- function(directory, threshold =0){
  
  id <- 1:332
  addcorr <-vector(mode = "numeric", length = 0)
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
    casefile1 <- casefile[complete.cases(casefile),]
    #casefile1 <- na.omit (casefile)
    nobs <- nrow(casefile1)
  
  if (nobs > threshold) {
    
    #for that file you find the correlation between nitrate and sulfate
    #To combine each correlation for each file in vector format using the concatenate function 
    #since this is not a data frame we cannot use rbind or cbind
    
      addcorr <- c(addcorr, cor(casefile1$nitrate, casefile1$sulfate))
  
    }

    return(addcorr)
}
}