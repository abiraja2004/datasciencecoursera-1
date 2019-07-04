outcome <- read.csv("C:/Users/Preethi's Laptop/Documents/R/datasciencecoursera/data_ProgAssignment3/outcome-of-care-measures.csv", colClasses = "character")
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])
