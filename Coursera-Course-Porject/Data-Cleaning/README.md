1. The program first reads in the data from the datasest and creates 8 variables: features, activity, xtrain, ytrain, strain, xtest, ytest, stest.
2. Combine train and test sets for x, y, and subject.
3. Assign names stored in features to the dataframes from step 2.
4. Extract the columns with mean and standard deviation with grep().
5. Combine the result from step 4 and y and subject to form a whole dataframe.
6. Substitute the activity labels with acutal names.
7. Melt the dataframe and cast it to calculate the average of each variable for each activity and subject.
8. Transform the 3-dimensional array from step 7 to a dataframe.
9. Write the result to a .txt file.
