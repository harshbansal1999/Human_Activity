#Data PreProcessing

#Importing the data
x_train=read.table( "X_train.txt",  sep = "", fill=TRUE)
y_train=read.table( "y_train.txt",  sep = "", fill=TRUE)
x_test=read.table( "X_test.txt",  sep = "", fill=TRUE)
y_test=read.table( "y_test.txt",  sep = "", fill=TRUE)

#Performing operation to final the training and testing data
y_train$V1=as.numeric(y_train$V1)
x_train$Output=y_train$V1
train=x_train
y_test$V1=as.numeric(y_test$V1)
test=x_test

#Feature Scaling
train[-562] = scale(train[-562])
test = scale(test)


#Fitting SVM to the Training set
# install.packages('e1071')
library(e1071)
classifier = svm(formula = Output ~ .,
                data = train,
                type = 'C-classification',
                kernel = 'linear')

# Predicting the Test set results
y_pred = predict(classifier, newdata = test)
avector <- as.vector(y_test$V1)

# Making the Confusion Matrix
cm = table(avector, y_pred)

