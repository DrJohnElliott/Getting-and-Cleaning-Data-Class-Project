# Getting-and-Cleaning-Data-Class-Project
This READ ME file was created for the class project and was created by modifying the original README file for the project: "Human Activity Recognition Using Smartphones Dataset" and is included below:
* Original README Source: www.smartlab.ws

==================================================================
Overview:
The script file "run_analysis.R" was created to process the raw data files and output a Tidy data set.
The script performs the following functions
* Checks to see if the required raw data files are in the working directory
* Reads the Raw data files into the Envioroment
* Pulls the original Varible and Activity names from the raw files and puts them into list form
* Modifies original varible names to make them TIDY so they are descriptive
* Combines Data sets from the raw data sets "Train" and "Test" into one data set
* Creates Tidy data names for the Activities by replacing the activity numbers with descriptive names
* Creates a subset of the main data consisting only of varibles represinting mean and standard deviation values
* Creates another data set based on the subset by taking the mean for each subject for each activity
* This final data set is written to a text file "Project_Data.txt" and stored in the working directory
* Creates a file with all of the varible names of the final data set called "Project_Data_Names.txt" and stores it in the working directory

==================================================================
# Original README file
## Human Activity Recognition Using Smartphones Dataset
## Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
See 'features_info.txt' for more details. 

### For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### The dataset includes the following files:
=========================================
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
 
#### The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. 
- The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
