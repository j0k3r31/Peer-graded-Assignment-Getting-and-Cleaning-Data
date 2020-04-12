Cleaning Data Course Project:


The file "scripts.R" performs the  following:

1>Merging the given data
1.1>Reading trainings tables
1.2>Reading testing tables
1.3>Reading feature vector
1.4>Reading activity labels  
1.5>Assigning column names
1.6>Merging all data in one set -> my.data

2>Extracts only mean and standard deviation of the each measurement
2.1>Reading column names
2.2>Create vector for defining ID, mean and standard deviation
2.3>subseting my.data
2.4>create a subset activity.names.subset by merging mean.and.sd.subset & activityLabels

3>Creates a new tidy data set