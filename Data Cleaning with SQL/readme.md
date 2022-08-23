# Data Cleaning with SQL
![cleaning](https://user-images.githubusercontent.com/70868527/181845062-eef32ecf-9270-44d7-86c6-abc4cff9c4d5.png)
------------------------------
# Overview
This project focuses on cleaning data with SQL and presenting it in an appropriate form to be used for analysis later on. It is a follow-up project to the project made by [Alex Freberg](https://www.youtube.com/c/AlexTheAnalyst) on his [Data Cleaning with SQL](https://www.youtube.com/watch?v=8rO7ztF4NtU&list=PLUaB-1hjhk8H48Pj32z4GZgGWyylqv85f&index=3&t=1515s).

**Note that this project was written in Mysql and additional scripts were written to Alex's tutorial**

As the first step, the data was downloaded from this [url](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbWdPampoN2VBR0FwcjlNdW9oLTJCRUctbVY3d3xBQ3Jtc0tuLU9oYTNBTjNGODhfSm5DUTJaSll5TXQ1N3BZaV9zaUh1cDY0ZTR5R0Y5d0QtNUpqcE80NmczQS1vN1M3SkNGU21yNlRXcnREdXY1Sncwdl9Bcmw2eU1lYXZYdnpCeWVNVkZyWXVRcWVscnVhMWFVTQ&q=https%3A%2F%2Fgithub.com%2FAlexTheAnalyst%2FPortfolioProjects%2Fblob%2Fmain%2FNashville%2520Housing%2520Data%2520for%2520Data%2520Cleaning.xlsx&v=8rO7ztF4NtU). It appears to be filled with some inconsistencies which renders the data to be inappropriate for better analysis.
In order to get the data imported for cleaning in Mysql Workbench, I created a database named "datacleaning_db". Following that, a table was created in the database named "Nashvillehousingdata". Then the data was imported into this table using the import wizard.

## Process
- The data cleaning process is divided into phases:
  - Understanding the Data.
  - Modifying the date column.
  - Splitted the "PropertyAddress" columns.
  - Replaced Inconsitent values in the "SalesVacant" column.
  - Removed duplicates in the dataset using the Common Table Expression.
  - Deleting unnessecary columns.
  
## Structure
- The repository contains the:
    - Data: It can be used for any data cleaning process if you wish to experiment your data cleaning skills.
    - MySql Script: It was wiritten in Mysql (another sql variation) you can follow. The interesting I encountered which renders my workprocess different from Alex's    is how we handled the date column differently. The date seemed complex but the script I wrote simplified it.
 
## Concepts Required to follow the project

- SELECT STATEMENT
- ALTER STATEMENT
- UPDATE STATMENT
- Using the CASE...WHEN expression
- Common Table Expression
- DELETE STATEMENT
- SUBSTRING function

-----------------------------------------------------------------------------------------------------------------------------------------------------------
**NOTE:** This script can be used by anyone using any other sql variation (additional google search might be needed.)
