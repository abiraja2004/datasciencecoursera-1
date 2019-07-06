source(here::here("assignment_3_utilities.R"))

rankhospital <- function(state, outcome, num="best") {
  readdata <- init()
  validateparameters(state, outcome, unique(readdata$State))
  
  statedata <- subset(readdata, readdata$State==state)
  colnum <- colnumFor(outcome)
  
  order_by <- as.numeric(statedata[, colnum])
  
  if (num=='best'){
    num <- 1
  }
  
  if (num=='worst'){
    num <- 1
    order_by <- -as.numeric(statedata[, colnum])
  }
  
  ranked_outcome <- statedata[order(order_by,
                                    statedata[,2],
                                    na.last=TRUE), ]
  hospital_name <- ranked_outcome[num, 2]
  return(hospital_name)
}    
