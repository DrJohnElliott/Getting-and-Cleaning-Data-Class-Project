#Code Book for Class Project 
This code book was created for Getting and Cleaning Data Class Project.
It is a modified version of an original code book created for the project: "Human Activity Recognition Using Smartphones Dataset" and is included below:
* Original Code Book Source: www.smartlab.ws

####Project Data
The file Project_Data contains the data calculated from a combination of two raw data sets.
The Varibles are the mean of group of observations for each activity for each subject.
The Activity observations were modified from the original data set to be more discriptive.
The original varibles are described below in the feature section from the original CodeBook.
A complete list of the varible names are found in the file "Project_Data_Names" and is created from the script file run_anaylisis.R

* "Activity"
* "Subject"
* "Subject Average of time domain for BodyAcc-mean()-X"
* "Subject Average of time domain for BodyAcc-mean()-Y"
* "Subject Average of time domain for BodyAcc-mean()-Z"
* "Subject Average of time domain for BodyAcc-std()-X"
* "Subject Average of time domain for BodyAcc-std()-Y"
* "Subject Average of time domain for BodyAcc-std()-Z"
* "Subject Average of time domain for GravityAcc-mean()-X"
* "Subject Average of time domain for GravityAcc-mean()-Y"
* "Subject Average of time domain for GravityAcc-mean()-Z"
* ...
* "Subject Average of frequency domain for BodyAccJerk-mean()-X"
* "Subject Average of frequency domain for BodyAccJerk-mean()-Y"
* "Subject Average of frequency domain for BodyAccJerk-mean()-Z"


Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.

Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
 * tBodyAcc-XYZ 
 * tGravityAcc-XYZ 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
* tBodyAccJerk-XYZ
* tBodyGyroJerk-XYZ

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing (Note the 'f' to indicate frequency domain signals).
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag. 
 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 


mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
