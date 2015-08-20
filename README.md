# Getting-and-Cleaning-Data-Project

The R script run_analysis does the following.But before that make sure you have the data in your working directory

1. Loads the activity and features info
2. Loads both train and test data sets, whose columns have either “mean” or “std” in their name
3. Loads the activity and subject data and column binds them with their respective train or test data set
4. Merges train and test data set by rbind and names the columns with appropriate names
5. Converts the subject and activity variables into factors
6. Creates a dataset which contains mean of the variables for each subject and activity 
