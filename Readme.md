#Human Activity Recognition Using Smartphones Data Set
##UC Irvine Machine Learning Repository
##Code for cleaning dataset

run_analysis.R contains code that reads the data into R, assuming the individual files are all in the working directory:

1. It merges together the test and train datasets into a single dataframe
2. It sets the numeric variable names to the descriptive variable names used in the Human Activity Recognition Study. Descriptions of the variables are in the accompanying codebook.
3. It extracts only the variables representing the mean and standard deviation of the different measurements
4. It adds the subject ID and the type of activity as additional variables to the dataset, so individual observations can be identified, and labels activities with descriptive labels (e.g. "sitting", "walking", etc.)
5. It creates a new dataframe which contains the mean measurement on each variable for each combination of subject and activity type.
