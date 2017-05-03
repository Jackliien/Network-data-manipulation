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


The Rcode will transform te relational data into an affiliation matrix as shown in the example below: 


             Tim   Rick    Linda   Jerry   Tom 
    Tim       0     0        0        0     0
    
    Rick      0     0        0        0     0
    
    Linda     0     0        0        0     0
    
    Jerry     0     0        0        0     0
    
    Tom       0     0        0        0     0
 
