best <- function(state,outcome) {

setwd("C:/Users/Preethi's Laptop/Documents/R/datasciencecoursera/data_ProgAssignment3") ##setting working directory
readdata <- read.csv("outcome-of-care-measures.csv", header = TRUE, stringsAsFactors = FALSE, na.strings = "Not Available")
##reading the csv
 statedata <- unique(readdata$State) ##vector of  state data
 outcomemeasure <- c("heart attack", "heart failure", "pneumonia")## vector of outcomes data

 ##checking validity of state data inputted and outcome data income data inputted
 
 if (!(state %in% statedata)) stop ("invalid state")
 if (!(outcome %in% outcomemeasure)) stop ("invalid outcome")
# else "ok"
 
 ##subset data and get relevant data set
 ##if outcoome is heart attack
 ##if outcome is heartfailure
 ## if outcome is pneumonia
 ##if two or more hospitals with same data, sort alphebetically*
 
 relevantstate <- readdata[readdata$State == state, ]
#print (relevantstate)
 if (outcome == outcomemeasure[1]) {
  y <- relevantstate[min(relevantstate [,11], na.rm = TRUE), 2]
  print (y)
 }
#    final <- y[with(y, order(Hospital.Name)), ]
 #   final[1]
  #}

 else if (outcome == outcomemeasure[2]) {
  y <- relevantstate[min(relevantstate [,17], na.rm = TRUE), 2]
  print (y)
   #final <- y[with(y, order(Hospital.Name)), ]
    #      final[1]
     }

      else (outcome == outcomemeasure[3]) 
           y <- relevantstate[min(relevantstate [,23], na.rm=TRUE), 2]
           print (y)
        #       final <- y[with(y, order(Hospital.Name)), ]
         #     final[1]
}  

 

  

  