source(here::here("assignment_3_utilities.R"))

rankhospital <- function(state, outcome, num="best") {
  readdata <- init()
  validateparameters(state, outcome, unique(readdata$State))
  
  statedata <- subset(readdata, readdata$State==state)
  colnum <- colnumFor(outcome)
  
  if (num=='best'){
    ## min_outcome <- min(as.numeric(statedata[, colnum]), na.rm = TRUE)
    ## hospital_name <- statedata[statedata[,colnum] == min_outcome, 2]
    ## hospital_name <- na.omit(hospital_name)
    ## hospital_name <- sort(hospital_name)
    ## return(hospital_name[1])
    
    num <- 1
  }
  
  if (num=='worst'){
    ## max_outcome <- max(as.numeric(statedata[, colnum]), na.rm = TRUE)
    ## hospital_name <- statedata[statedata[,colnum] == max_outcome, 2]
    ## hospital_name <- na.omit(hospital_name)
    ## hospital_name <- sort(hospital_name)
    ## return(hospital_name[1])
    
    ranked_outcome <- statedata[order(-as.numeric(statedata[, colnum]),
                                      statedata[,2],
                                      na.last=TRUE), ]
    hospital_name <- ranked_outcome[1, 2]
    return(hospital_name)
  }
  
  ranked_outcome <- statedata[order(as.numeric(statedata[, colnum]),
                                    statedata[,2],
                                    na.last=TRUE), ]
  hospital_name <- ranked_outcome[num, 2]
  return(hospital_name)
}    

  