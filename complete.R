require(stringr)
require(stats)

complete <- function(directory, id = 1:332) {
  
  path <- paste0(getwd(), "/", directory, "/") #setting the working directory
  
  data <- data.frame() #create an empty data frame
  
  for (i in id) {
    # 1. Read in the CSV
    filenumber <- str_pad(i, width=3, side="left", pad="0")
    filename <- paste0(path, filenumber, ".csv")
    casefile <- read.csv(file=filename, header=TRUE)
    casefile1 <- na.omit (casefile)
    nobs <- nrow(casefile1)
   # nobs <- sum (complete.cases(read.csv(file=filename, header=TRUE)))
    # 2. Calculate complete cases in file 
    # 3. Compile data frame (matrix)set.seed(42)
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    data <- rbind(data, data.frame(filenumber, nobs)) #add files to main data frame
  }
  return(data)
}