rankhospital <- function(state, outcome, num="best") {
  ##read outcome data
  setwd("C:/Users/Preethi's Laptop/Documents/R/datasciencecoursera/data_ProgAssignment3") ##setting working directory
  readdata <- read.csv("outcome-of-care-measures.csv", header = TRUE, stringsAsFactors = FALSE, na.strings = "Not Available")
  ##reading the csv
  statedata <- unique(readdata$State) ##vector of  state data
  outcomemeasure <- c("heart attack", "heart failure", "pneumonia")## vector of outcomes data
  
  ##checking validity of state data inputted and outcome data income data inputted
  
  if (!(state %in% statedata)) stop ("invalid state")
  if (!(outcome %in% outcomemeasure)) stop ("invalid outcome")
  # else "ok"
  relevantstate <- readdata[readdata$State == state, ]
  #print (relevantstate)
  
  if (outcome == outcomemeasure[1]) {
    
      if (num == 'best'){
      y <- relevantstate[min(relevantstate [,11], na.rm = TRUE), 2]
      print (y)
     }
      if (num == 'worst'){
      y <- relevantstate[max(relevantstate [,11], na.rm = TRUE), 2]
      print (y)
      }
    y <- relevantstate[rank(relevantstate [,11], na.last = TRUE), 2]
    final <- y[num]
    print (final)
  }
    if (outcome == outcomemeasure[2]) {
      if (num == 'best'){
        y <- relevantstate[min(relevantstate [,17], na.rm = TRUE), 2]
        print (y)
      }
      if (num == 'worst'){
        y <- relevantstate[max(relevantstate [,17], na.rm = TRUE), 2]
        print (y)
      }
      y <- relevantstate[rank(relevantstate [,17], na.last = TRUE), 2]
      final <- y[num]
      print (final)
    }  
  if (outcome == outcomemeasure[3]) {
    if (num == 'best'){
      y <- relevantstate[min(relevantstate [,23], na.rm = TRUE), 2]
      print (y)
    }
    if (num == 'worst'){
      y <- relevantstate[max(relevantstate [,23], na.rm = TRUE), 2]
      print (y)
    }
    y <- relevantstate[rank(relevantstate [,23], na.last = TRUE), 2]
    final <- y[num]
    print (final)
  }  
  }  
  
  
  ##return hospitalname with given rank for 30 day rate
  