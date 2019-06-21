require(stringr)
pollutantmean <- function(directory, pollutant, id=1:332) {
  
  path <- paste0(getwd(), "/", directory, "/") #setting the working directory

  data <- data.frame() #create an empty data frame
  
  for (i in id) {
    filenumber <- str_pad(i, width=3, side="left", pad="0")
    filename <- paste0(path, filenumber, ".csv")
    temp <- read.csv(file=filename, header=TRUE)
    data <- rbind(data, temp) #add files to main data frame
  }
  
  pMean <- mean(data[, pollutant], trim=0, na.rm=TRUE)
  
  return(pMean)
 
}
