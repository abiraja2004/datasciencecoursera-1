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

best <- function(state, outcome) {
  
  readdata <- init()
  ##reading the csv
  ##statedata <- unique(readdata$State) ##vector of  state data
  ##statedata <- c("heart attack", "heart failure", "pneumonia")## vector of outcomes data
  
  ##checking validity of state data inputted and outcome data income data inputted
  validateparameters(state, outcome, unique(readdata$State))

  # else "ok"
  
  statedata <- subset(readdata, readdata$State==state)
  ## print(statedata)
  
   ##subset data and get relevant data set
   ##if outcoome is heart attack
   ##if outcome is heartfailure
   ## if outcome is pneumonia
   ##if two or more hospitals with same data, sort alphebetically*
   
  ## relevantstate <- readdata[readdata$State == state, ]
  #print (relevantstate)
   ## if (outcome == "heart attack") {
  ##   colnum <- 10
   ##}
    
    ##y <- relevantstate[min(relevantstate[, 11], na.rm = TRUE), 2]
    ##print (y)
   
  #    final <- y[with(y, order(Hospital.Name)), ]
   #   final[1]
    #}
  
   ## else if (outcome == "heart failure") {
  ##    colnum <- 17
   ## }
    ##y <- relevantstate[min(relevantstate [,17], na.rm = TRUE), 2]
    ##print (y)
     #final <- y[with(y, order(Hospital.Name)), ]
      #      final[1]
  
      ## else (outcome == "pneumonia")
      ##  colnum <- 23
             ##y <- relevantstate[min(relevantstate [,23], na.rm=TRUE), 2]
             ##print (y)
          #       final <- y[with(y, order(Hospital.Name)), ]
           #     final[1]
        
  colnum <- colnumFor(outcome)
   
   ##which(as.numeric(statedata[, colnum])) ==
  min_outcome <- min(as.numeric(statedata[, colnum]), na.rm = TRUE)
  
  hospital_name <- statedata[statedata[,colnum] == min_outcome, 2]
  hospital_name <- na.omit(hospital_name)
  hospital_name <- sort(hospital_name)
  
  return(hospital_name[1])
}  

 

  

  