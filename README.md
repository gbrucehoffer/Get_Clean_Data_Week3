=============================================================

**# Human Activity Recognition Using Smartphones Dataset #**
## Version 1.0 ##
==================================================================
#### GBH ####
==================================================================

This repository includes an R script, run analysis.R that prepares a consolidated tidy data set of Smartphones Inertial Sensors data (Smartphones.inertial.sensors.csv) that includes 10,299 records for 63 variables, and presents means and standard deviations of inertial sensor measurements taken during the six activities, on the x-, y-, and z- axes for time and frequency domains.  The script also produces a second tidy data set (Activity.means.csv) that summarizes the means for each measure by subject ID and activity.

Source data used to build the data set were obtained from the UCI Machine Learning Repository "Human Activity Recognition Using Smartphones Data Set" (UCI MLR, 2012) (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The source data zip file is at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  To run the script, the zip file must be unloaded and contents saved to the active working directory.

=========================================

The Human Activity Recognition database is built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. 

As described by UCI MRL (2012):
	"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

The consolidated tidy data set consolidates means and standard devations of the measurements reported in the UCI MRL (2012) data files for the 30 subjects, and is constructed from the following UCI MRL (2012) files:

	'activity_labels.txt'
	'features.txt'
	'features_info.txt'

	test:
		'subject_test.txt'
		'X_test.txt'
		'y_test.txt'

	train:
		'subject_train.txt
		'X_train.txt
		'y_train.txt

=========================================

Additional details on the construction of the datasets and a data dictionary are included in the CODEBOOK.



