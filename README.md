###Read in general tables and add column names whenever necessary:
label: links the Activity number with its Activity label
feat: contains the description of the measurements


###Read in training tables and add column names whenever necessary:
train_subj: contains which subject performed the activity that was measured
train_y: contains which activity number was measured
train_x: contains variables of each measurement for each subject for each activity number

I pasted the three train datasets next to each other to create train, which contains subject and activity number of each measurement, and each measurement for each subject for each activity number.

I merged the train dataset with the label dataset on Activity number to create train_lab, which includes the Activity label.

I’ve added a column, containing the information that the subjects where in the training group.


###Read in test tables and add column names whenever necessary:
test_subj: contains which subject performed the activity that was measured
test_y: contains which activity number was measured
test_x: contains variables of each measurement for each subject for each activity number

I pasted the three test datasets next to each other to create test, which contains subject and activity number of each measurement, and each measurement for each subject for each activity number.

I merged the test dataset with the label dataset on Activity number to create test_lab, which includes the Activity label.

I’ve added a column, containing the information that the subjects where in the test group.


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





