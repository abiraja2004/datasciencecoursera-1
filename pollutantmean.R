require(stringr)
pollutantmean <- function(directory, pollutant, id=1:332) {
  
  path <- paste0(getwd(), "/", directory, "/") #setting the working directory
  # files <- list.files(path="C:/Users/Preethi's Laptop/Documents/R/datasciencecoursera/specdata/specdata", pattern="csv", full.names=TRUE) #create a list of files

  data <- data.frame() #create an empty data frame
  
  for (i in id) {
    filenumber <- str_pad(i, width=3, side="left", pad="0")
    filename <- paste0(path, filenumber, ".csv")
    temp <- read.csv(file=filename, header=TRUE)
    print(temp)
    data <- rbind(data, temp) #add files to main data frame
  }
  
  return(mean(data[pollutant], rm.na=TRUE))
}
