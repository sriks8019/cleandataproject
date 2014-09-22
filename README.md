cleandataproject
================

Course Project Submission
The following transformations were applied on the raw data sets procured from Samsung on accelerometer experiment.
There are two types of subjects in the raw data set : 1) Test and 2) Training.

###Data Transformations:
1.	 The training and the test sets were merged to create one data set.
2.	Only the measurements on the mean and standard deviation for each measurement were extracted. Rest were excluded. 
3.	Descriptive activity names were assigned to name the activities in the data set
4.	The data set was labeled with appropriate descriptive variable names. 
5.	From the data set in step 4 a second, independent tidy data set was created, with the average of each variable for each activity and each subject.
The resultant data set is a data set with 68 variables and 180 observations.
It contains the data related to mean and standard deviation of measurements for the subjects who participated in the experiment of the accelerometers 

run_analysis.R contains the R code for the above transformations along with comments for each step.

codebook.txt, code book.doc contain the Codebook with details on transformations and variables. 
CodeBook cosists of list of variables with detailed description for a few variabled due to time constraints. 

