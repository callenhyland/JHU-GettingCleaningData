### Getting and Cleaning Data Course Project  
Johns Hopkins University, Data Science Specialization  
Created by: Callen Hyland, March 4, 2022  

This repository contains code and data files for analyzing the output of accelerometers in Samsung Galaxy 5 smartphones. The run_analysis.R script combines test and training datasets, calculates summaries for each subject and activity, and saves a the result as a tidy data set.

**Files in this repository:**  

"codebook.txt"  
Information on the contents and structure of tidy data set output from run_analysis.R, and description of each variable. 

"README.md"  
This file

"run_analysis.R"  
This R script does the following operations:  
- Reads the test and training dataset  
- Merges them into one table  
- Selects just mean and standard deviation measurements for each variable  - Labels each observation by subject and activity 
- For each subject doing each activity, calculates the mean for each variable  
- Saves a text file with the tidy dataset containing means of each variable (just mean and std measurements) for each subject doing each activity 

"tidy\_table\_output.txt"  
Text file output from run_analysis.R

"./UCI HAR Dataset/"  
Original files from the Human Activity Recognition Using Smartphones Data Set, which can be [downloaded](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the UCI Machine Learning Repository. For more details on this data set, please see ./UCI HAR Dataset/README.txt

**Reference:**  
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.