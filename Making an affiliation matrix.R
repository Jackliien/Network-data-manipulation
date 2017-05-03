# This code loads xml data (gathered via qualtrics) into R and translates this to an affiliation matrix. 

setwd("~/Downloads")

install.packages("XML") #Instal and load the required packages
library(XML)
library(stringr)
library(plyr)
library(xlsx)

data <- xmlParse("test.data.xml") # Transforming the data from xml format to a dataframe
data <- xmlTreeParse("test.data.xml")
class(data)
xmltop <- xmlRoot(data)
responses <- xmlSApply(xmltop, function(x) xmlSApply(x, xmlValue)) # This results in a dataframe where each row is a variable and each collum is a case. 

# Make a list of names which corresponds with the answer options in the questionnaire

actor.names <- c(1:23)
actor.names <- paste0("actor ", actor.names, sep = "")

# Create an emty affiliation matrix to which the data can be imported
Affiliaton.matrix <- data.frame(matrix(ncol = 23, nrow = ncol(responses))) 
Affiliaton.matrix[is.na(Affiliaton.matrix)] <- 0 # Fill in a zero in each cell
names <- unlist(responses[17,1:ncol(responses)]) # Select the names of the respondents from the dataframe (names are in row 17)
rownames(Affiliaton.matrix) <- names # enter the respondent's name to each row of the affiliation matrix
colnames(Affiliaton.matrix) <- actor.names # enter the list of names which correspond with the answer options (actors) in the questionnaire

# The loop below will transform relevant data from the data frame into the affilition matix

list <- c(1:ncol(responses))
for(i in list){
answers <- as.character(lapply(responses[18:40,i], function(x) ifelse(is.null(x), "0", x))) # The relevant data is in row 18 until 40
answers[] <- unlist(lapply(answers,function(x) replace(x,is.na(x),0)))
Affiliaton.matrix[i, ] <- as.numeric(answers)
}

write.xlsx(Affiliaton.matrix, "/Users/Jacklien/Desktop/matrix.xlsx") # Export the affiliation matrix to csv. 

