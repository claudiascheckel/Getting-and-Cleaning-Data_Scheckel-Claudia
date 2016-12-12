The Tidy.txt table was created using the following datasets. The transformations performed on the datasets are described below.

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Column 1 contains the Subject ID
Column 2 contains the activity that was measured
Column 3 contains information if the Subject was part of the test or training group.
Columns 4-89 contain the mean of each variable (see below) for each Subject for each activity.

======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time (t) and frequency (f) domain variables. 

The acceleration signal from the smartphone accelerometer X/Y and Z axes in standard gravity units 'g'.
The body acceleration signal was obtained by subtracting the gravity from the total acceleration.
The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

======================================

Using accelerometer and gyroscope embedded in the smartphone, a 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

##License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

##Transformations:

###Read in general tables and add column names whenever necessary:
label: links the Activity number with its Activity label
feat: contains the description of the measurements


###Read in training tables and add column names whenever necessary:
train_subj: contains which subject performed the activity that was measured
train_y: contains which activity number was measured
train_x: contains variables of each measurement for each subject for each activity number

I pasted the three train datasets next to each other to create train, which contains subject and activity number of each measurement, and each measurement for each subject for each activity number.

I merged the train dataset with the label dataset on Activity number to create train_lab, which includes the Activity label.

IÕve added a column, containing the information that the subjects where in the training group.


###Read in test tables and add column names whenever necessary:
test_subj: contains which subject performed the activity that was measured
test_y: contains which activity number was measured
test_x: contains variables of each measurement for each subject for each activity number

I pasted the three test datasets next to each other to create test, which contains subject and activity number of each measurement, and each measurement for each subject for each activity number.

I merged the test dataset with the label dataset on Activity number to create test_lab, which includes the Activity label.

IÕve added a column, containing the information that the subjects where in the test group.


###Merge training and test tables and subset/reshape the table:
Paste train_lab and test_lab below each other (using rbind) to create all.
Select only mean and standard deviation variables from the features table feat and write that to a new vector, subset.
Select general information columns from the table all (Activity number/label, Subject, Group)
Select columns with features present in the subset vector
Paste the two selections in to a new all table
Sort all by Subject number


###Calculate the the mean of each variable for each subject for each activity using two for loops:
Create an empty data frame data
The first for loop loops through every activity (1-6):
Subset data based on activity
Select only desired columns (subject and measurements)
Create the empty data frame new to which mean of each variable for every subject can be written
The second for loop loops through every subject (1-30) and calculates the mean of each variable per subject in the data frame new
Add subject ID to the data frame new
Append the data frame new to the data frame data

###Reshape the data:
Merge the data table data with the information on Group (test/training)
Place all columns with general information to the front of the table
Add column names and make them human readable
Write dataset




