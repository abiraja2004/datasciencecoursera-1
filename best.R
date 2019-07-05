best <- function(state, outcome) {

  init <- function() {
    setwd("C:/Users/Preethi's Laptop/Documents/R/datasciencecoursera/rprog_data_ProgAssignment3-data")
    readdata <- read.csv("outcome-of-care-measures.csv", 
                         header = TRUE, 
                         colClass = "character", 
                         na.strings = "Not Available")
    return(readdata)
  }
  
  validateparameters <- function(state, outcome, validstates) {
    if (!(state %in% validstates)) {
      stop (c("invalid state: ", state))
    }
    
    if (!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) {
      stop (c("invalid outcome: ", outcome))
    }
  }
  
  colnumFor <- function(outcome) {
    ## TODO: validate column header in CSV?
    if (outcome == "heart attack") {
      return(11)
    }
    if (outcome == "heart failure") {
      return(17)
    }
    if (outcome == "pneumonia") {
      return(23)
    }
    stop (c("invalid outcome: ", outcome))
  }

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

 

  

  