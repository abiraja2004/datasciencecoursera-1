best <- function(state,outcome) {

setwd("C:/Users/Preethi's Laptop/Documents/R/datasciencecoursera/data_ProgAssignment3") ##setting working directory
readdata <- read.csv("outcome-of-care-measures.csv", header = TRUE, stringsAsFactors = FALSE, na.strings = "Not Available")
##reading the csv
 statedata <- unique(readdata$State) ##vector of  state data
 outcomemeasure <- c("heart attack", "heart failure", "pneumonia")## vector of outcomes data
 
 if (!(state %in% statedata)) stop ("invalid state")
 if (!(outcome %in% outcomemeasure)) stop ("invalid outcome")
# else "ok"
 
 ##checking validity of state data inputted and outcome data income data inputted
 
 relevantstate <- readdata[readdata$State == state, ]
# print (relevantstate)
 if (outcome == outcomemeasure[1]) {
    y <- relevantstate[which(relevantstate[, 11] == min(relevantstate [,11])), 2]
    final <- y[with(y, order(Hospital.Name)), ]
    final[1]
  }

  else if (outcome == outcomemeasure[2]) {
    y <- relevantstate[which(relevantstate[, 17] == min(relevantstate [,17])), 2]
          final <- y[with(y, order(Hospital.Name)), ]
          final[1]
      }

          else (outcome == outcomemeasure[3]) 
               y <- relevantstate[which(relevantstate[, 23] == min(relevantstate [,23])), 2]
               final <- y[with(y, order(Hospital.Name)), ]
              final[1]
     
}
 ##subset data and get relevant data set
 ##if outcoome is heart attack
 ##if outcome is heartfailure
 ## if outcome is pneumonia
 ##if two or more hospitals with same data, sort alphebetically
 

  ## Read outcome data
  ## check the state and outcome are valid
  ##return hospital with lowest 30-day death rate
  

  