SamsungGalaxyS2MotionData
=========================

Samsung Galaxy S2 Motion Data from the UCI Machine Learning Repository as of 12/10/12


Overview of Repository:

This repository is created to complete a project for the Coursera Getting and Cleaning Data course, as part of the Data Science Certificate sequence in conjunction with Johns Hopkins University. The data used for this project comes from the UCI Machine Learning Repository. The description and the data are below (respectively):

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Description of Files:

  1. README.md - gives an overview (which is this same exact file)
  2. run_analysis.R - this is an R script that cleans data from the UCI Repository and creates two text files as output to R's working directory. In order to run correctly, the UCI data located above must be extracted into the working directory such that the working directory contains the folder "UCI HAR Dataset" completely unaltered (not in .zip format).
  3. codebook.txt - this describes all the inputs, variables, transformations, and outputs from the run_analysis.R file
  4. mean_std_data.txt - this is the first output from run_analysis.R that consolidates both test and training data and outputs only the columns with means or standard deviations already calculated.
  5. mean_data.txt - this is the second output from run_analysis.R that consolidates both test and training data and outputs the mean of all columns, organized by Subject (person being tested) and Activity (six options).



     
     
