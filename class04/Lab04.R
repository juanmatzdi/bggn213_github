source("http://thegrantlab.org/misc/cdc.R")

cdc

head(cdc$height)
help(tail)
#we identified the n argument (default = 6) that specifies the indices to be selected in the corresponding dimension. 
tail(cdc$weight, n=20)
tail(cdc$weight)

plot(cdc$height, cdc$weight)

#the cor() functions calculates the Pearson correlation
cor(cdc$height,cdc$weight)

#to built a histogram
hist(cdc$height)

#Creating new vectors 
height_m <- cdc$height * 0.0254
weight_kg <- cdc$weight* 0.454

#Creating bmi
bmi <- (weight_kg)/(height_m^2)

plot(cdc$height, bmi)

cor(cdc$height,bmi)

sum(bmi >= 30)
sum(bmi >= 30)/length(bmi)

plot(cdc[1:100, ]$height, cdc[1:100, ]$weight)

subset(cdc$gender, subset = bmi >=30)
help(table)

table(subset(cdc$gender, subset = bmi >=30))