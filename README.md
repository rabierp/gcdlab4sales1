# GCD-Lab-4-Sales-1
An introductory lab to GCD

## UI discovery
- Connect to the Console.
- Click on the burger menu on the top left of the UI. See what services are available
- Pick your project in the list selector

## Launch your own VM
- Select the Compute Engine service in the Services Menu
- Click 'Create an instance'
- discover the menu and follow your instructor's guidelines
- Click 'Create'
- when the VM has started (checkbox is green), click on 'SSH' on the right of the VM row
- in the teminal window, type:
```
sudo apt update
sudo apt install git
git clone https://github.com/rabierp/gcdlab4sales1
cd gcdlab4sales1
```
## 2 Ways to run a DB
### Run a DB on your own instance
#### Install PostgreSQL

#### Upload Data

#### Query your local DB

### Run Cloud SQL

#### Deploy a Cloud SQL Postgres Instance

#### Upload Data

#### Query your Cloud DB

## Query the Big Query!
### Upload Data
- Download the '2018_Central_Park_Squirrel_Census_-_Squirrel_Data.csv' file from this GitHub repository
- Go to BigQuery in the burger menu
- In your BQ project, click on the 3 vertical dots and select 'Create a Dataset' and name it 'fun_data'
- Then, click on the 3 vertical dots of this dataset and select 'Create a Table' 
- Source: Import, then select the Squirrels file
- Table: squirrels_2018
- Click Autodetect
- In Advanced Options, set 'headlines to ignore'to '1'
- Click 'Create Table'
** OR **
- type this command to upload the NYC Squirrels CSV file to a table in BigQuery:
```
bq load --autodetect --skip_leading_rows=1 --source_format=CSV fun_data.squirrels_2018 ./2018_Central_Park_Squirrel_Census_-_Squirrel_Data.csv
``` 
### Run a query
