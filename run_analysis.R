# R programing script file for Getting and Cleaning Data class project
# Created by John Elliott, 3/27/2016
#Script assumes data files are in working directory

#setwd("C:/Users/John/Desktop/R-Code/Coursera/Clean Data/Week 4/Class project")

# List of required files
        required_files <- c("X_test.txt","y_test.txt","X_train.txt","y_train.txt", "subject_test.txt", "subject_train.txt", "features.txt", "activity_labels.txt" )

# Checks working directory for files
        if(!all(lapply(required_files,file.exists)==TRUE)){ 
                print("Required Data Files Not Found!")
                print("Place the following files into Working directory")
                print(required_files)
         }
              
library(dplyr)
library(stringr)
        
# Read Data Into R
        set_x_test <- read.table("X_test.txt")
        set_y_test <- read.table("y_test.txt")

        set_x_train <- read.table("X_train.txt")
        set_y_train <- read.table("y_train.txt")

        set_subject_test <- read.table("subject_test.txt")
        set_subject_train <- read.table("subject_train.txt")

        features_list <- read.delim("features.txt", sep = "\t", header = FALSE)
        activity_list <-  read.delim("activity_labels.txt", sep = "\t", header = FALSE)    

#Pull Varible names from text files
        temp1 <- strsplit(as.character(features_list$V1[])," ")
        temp2 <- strsplit(as.character(activity_list$V1[])," ") 
                #Seperate name from numbers
                myFun <- function(x){y <- x[[2]]}
     
                my_list <-  lapply(temp1, myFun)
                activity_list <- lapply(temp2, myFun)
# Set Column Names        
        colnames(set_y_test) <- c("Activity")
        colnames(set_y_train) <- c("Activity")

        colnames(set_subject_test) <- c("Subject")
        colnames(set_subject_train) <- c("Subject")

        colnames(set_x_test) <- my_list
        colnames(set_x_train) <- my_list

#Combine Data Sets
        set_x_test <- cbind(set_y_test, set_subject_test, set_x_test )
        set_x_train <- cbind(set_y_train, set_subject_train, set_x_train )
        
        # Complete data set "my_data"
        my_data <- rbind(set_x_test,set_x_train)
        
# Clean up Envioroment  
        rm( "myFun" , "features_list" , "my_list", "required_files",
            "temp1", "temp2","set_y_test", "set_x_test", "set_x_train", 
            "set_y_train", "set_subject_test", "set_subject_train" )
       
        
#Make List of Column Names with Activity, Subject, Mean and Standard Deveation Data 
        my_names <- names(my_data)
        substring="mean|std"
        my_filter_list <-  grepl(substring,my_names)
        final_names1 <- my_names[my_filter_list]


        final_names <- (c( "Activity", "Subject", final_names1) )
        
#Create Final Data Set
        final_data_set <- my_data[,final_names] 
        rm("my_data")
#Arrange set by activity 
        final_data_set <- arrange(final_data_set,Activity)
        
#Function to replace activity number with desciption from text file
myFun2 <- function(x){
        if(x == 1)      final_data_set$Activity<- activity_list[[1]]
        else if( x==2 ) final_data_set$Activity<- activity_list[[2]]
        else if( x==3)  final_data_set$Activity<- activity_list[[3]]
        else if( x==4)  final_data_set$Activity<- activity_list[[4]]
        else if( x==5)  final_data_set$Activity<- activity_list[[5]]
        else if( x==6)  final_data_set$Activity<- activity_list[[6]]
}

#Call function and apply to data frame
        final_data_set$Activity <-lapply(final_data_set$Activity,myFun2)


# Function to update varible names, making them Tidy and more discriptive to the user        
        tidy_names <- function(x){
                
                if (identical(substring(colnames(final_data_set[x]),1,1),"f") )        paste(c("frequency", substring(colnames(final_data_set[x]),2)), sep = "", collapse = " ")
                else if (identical(substring(colnames(final_data_set[x]),1,1),"t"))    paste(c("time", substring(colnames(final_data_set[x]),2)), sep = "", collapse = " ")
                else colnames(final_data_set[x])
        }
        
# Call function to Tidy up vaible names
        for(i in 1:length(names(final_data_set))) {
                names(final_data_set)[i]<-  tidy_names(i)
        }     
#########################################################        

# Clean up Envioroment  
        rm( "myFun2","final_names1", "final_names", "my_names","my_filter_list","substring", "activity_list")

# Arrange table by Subject
        final_data_set <- arrange(final_data_set,Subject)

#Change Activity data from list to factor so dplyr can use it for "group_by"
        final_data_set$Activity <- as.factor(unlist(final_data_set$Activity)) 

# Function that creates data for each subject        
        make_data <-function(num){
                final_data_set %>%
                filter(Subject == num) %>%
                group_by(Activity) %>%
                summarize_each(funs(mean))
}

#Initialize blank data table for second data set
        second_set <- final_data_set[0,]
        
# Determine number of subjects for creating Second Data Set
        unique<- n_distinct(final_data_set$Subject)

#Create Second Data Set       
        for(i in 1:unique) {
                second_set<- rbind(make_data(i), second_set)
}

#Arrange vaibles by Subject then Activity
        second_set <- arrange(second_set,Subject,Activity)

# Clean up Envioroment     
        rm("i","unique","make_data")

# Save Data file as "Project_Data.txt"
        write.table(second_set, file = "Project_Data.txt", row.names = FALSE)
        
# Read Data Table back into R and view it
        data <- read.table("Project_Data.txt", header = TRUE)
        View(data)
        












