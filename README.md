# Network-data-manipulation
This repository contains Rcode which translates relational data from Qualtrics into an affiliation matrix.

In qualtrics the relational data should be gathered in a matrix table as in the following example: 

      To which of the persons beneath do you give advice?

                  I give advice to:
                  
       Tim               ()
       Rick              ()
       Linda             ()
       Jerry             ()
       Tom               ()



Note: In qualtrics the question display option 'matrix table' must be selected otherwise the code does not work. 

The Rcode will transform te relational data into an affiliation matrix as shown in the example below: 


             Tim   Rick    Linda   Jerry   Tom 
             
    Tim       0     0        0        0     0
    
    Rick      0     0        0        0     0
    
    Linda     0     0        0        0     0
    
    Jerry     0     0        0        0     0
    
    Tom       0     0        0        0     0
 

When the data is gather via qualtrics, it must be exported and saved in XML format (select the option "use numeric values")

The Code in this repository can be used to transform this XML data into an affiliation matrix by edditing the following variables: 

- The working directory in line 3
- The name of your xml document in line 11 and 12 
- Replace line 19 and 20 by the list 'actor.names' which contains the names of the choice options in the questionaires
- Insert the number of actors in line 23
- Check in the dataframe 'responses' which row number contains the respondents' names and insert this in line 25
- Check in the dataframe which row numbers contain the relational data of interest and insert this range in line 33

The affiliation matrix can now be exported in csv format and used for further analysis. 
