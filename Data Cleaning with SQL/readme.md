![cleaning](https://user-images.githubusercontent.com/70868527/181845062-eef32ecf-9270-44d7-86c6-abc4cff9c4d5.png)
------------------------------
# Overview
This project focuses on cleaning data with SQL and presenting it in an appropriate form to be used for analysis later on.It is a follow-up project to the project made by [Alex Freberg](https://www.youtube.com/c/AlexTheAnalyst) on his [Youtube channel link](https://www.youtube.com/watch?v=8rO7ztF4NtU&list=PLUaB-1hjhk8H48Pj32z4GZgGWyylqv85f&index=3&t=1515s). 
As the first step, the data was downloaded from (url). It appears to be filled by some inconsistencies which renders the data to be inappropriate for better analysis.
In order to get the data imported for cleaning in Mysql Workbench, I created a database named "datacleaning_db". Following that, a table was created in the database named "Nashvillehousingdata". Then the data was imported into this table using the import wizard.

## Process
- The data cleaning process is divided into phases:
  - Understanding the Data.
  - Modifying the date column.
  - Splitted the "PropertyAddress" columns.
  - Replaced Inconsitent values in the "SalesVacant" column.
  - Removed duplicates in the dataset using the Common Table Expression.
  - Deleting unnessecary columns.
  
## STRUCTURE
- The repository contains the:
 - Data: It can be used for any data cleaning process if you wish to experiment your data cleaning skills.
 - MySql Script: It was wiritten in Mysql (another sql variation) you can follow. The interesting I encountered which renders my workprocess different from Alex's is      how we handled the date differently. The date seemed complex but the script I wrote simplified it.
 
## Concepts Required to follow the project

- SELECT STATEMENT
- ALTER STATEMENT
- UPDATE STATMENT
- Using the CASE...WHEN expression
- Common Table Expression
- DELETE STATEMENT
- SUBSTRING function

-----------------------------------------------------------------------------------------------------------------------------------------------------------
**Note:** This script can be used by anyone using any other sql variation (additional google search might be needed.)
