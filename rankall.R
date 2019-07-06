source(here::here("assignment_3_utilities.R"))

rankall <- function(outcome, num="best") {
  readdata <- init()
  validateparameters(state, outcome, unique(readdata$State))
  colnum <- colnumFor(outcome)
  
  rankone <- function(statedata, colnum, num) {
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
    return (hospital_name)
  }
  
  
  ## start looping over states here
  df <- data.frame(hospital=character(),state=character())
  for (state in unique(readdata$State)) {
    statedata <- subset(readdata, readdata$State==state)
    one <- rankone(statedata, colnum, num)
    df_one <- data.frame(one,state)
    df <- rbind(df,df_one)
  }
  return (df)
}    
