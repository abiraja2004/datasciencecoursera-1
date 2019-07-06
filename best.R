## Utility functions have been extracted into another file for reuse across 
## the multiple files in this assignment. Please see the following utility 
## R file to explore their contents.
source(here::here("assignment_3_utilities.R"))

best <- function(state, outcome) {

  readdata <- init()
  validateparameters(state, outcome, unique(readdata$State))

  statedata <- subset(readdata, readdata$State==state)
  colnum <- colnumFor(outcome)
  
  min_outcome <- min(as.numeric(statedata[, colnum]), na.rm = TRUE)
  hospital_name <- statedata[statedata[,colnum] == min_outcome, 2]
  hospital_name <- na.omit(hospital_name)
  hospital_name <- sort(hospital_name)
  
  return(hospital_name[1])
}

 

  

  