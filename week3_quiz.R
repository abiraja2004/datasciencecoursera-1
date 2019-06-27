library(datasets)
data(iris)
mean(iris[iris$Species=="virginica",]$Sepal.Length)

apply(iris[,1:4],2,mean)

library(datasets)
data(mtcars)

with(mtcars,tapply(mpg,cyl,mean))

sapply(split(mtcars$mpg,mtcars$cyl),mean)

tapply(mtcars$mpg,mtcars$cyl,mean)

sapply(split(mtcars$hp,mtcars$cyl),mean)

