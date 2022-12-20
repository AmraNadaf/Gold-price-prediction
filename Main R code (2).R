#importing the dataset
gld_price_data <- read.csv("C:/Users/Amra/Desktop/gld_price_data.csv")
View(gld_price_data)
#creating subset
X<- subset(gld_price_data, select = -c(Date) )
View(X)
#calling randomforest library
library(randomForest)
#splitting training & testing dataset
X_set_size = floor(nrow(X) *0.80)
index <- sample(1:nrow(X), size = X_set_size)
training <-X[index,]
testing <-X[-index,]
#applying regressor to dataset
rf <- randomForest(GLD ~ ., data = training, mtry= 4, ntree= 2001, importance= TRUE)
rf
plot(rf)
#result variable for applying rf/ random forest to specified rows
result <- data.frame(testing$GLD, predict(rf, testing[1:458, ], type= "response"))
#taking input from user
v1 = readline("Enter SPX:");
v2 = readline("Enter USO:");
v3 = readline("Enter SLV:");
v4 = readline("Enter EUR.USD:");
#converting them into integers
v1 = as.integer(v1);
v2 = as.integer(v2);
v3 = as.integer(v3);
v4 = as.integer(v4);
#converting inputs into values for new dataframe
SPX<- c(v1)
USO<- c(v2)
SLV<- c(v3)
EUR.USD<- c(v4)
#creating new dataframe using users entered inputs
df <- data.frame(SPX, USO, SLV, EUR.USD)
print(df)
#using our declared prediction model to predict output of users entered values
p1 <- predict(rf, df)
#printing out the end result
print(p1)
