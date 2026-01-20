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
- Go to the "Query" Tab in BigQuery Studio and copy / Paste the following SQL code:
```
SELECT
  `Primary Fur Color` AS couleur,
  COUNT(*) AS total_ecureuils,
  -- Calcul du pourcentage de "bravoure" (ceux qui s'approchent)
  ROUND((COUNTIF(Approaches = true) / COUNT(*)) * 100, 2) AS pourcent_amicaux,
  -- Calcul du pourcentage d'hyperactivité (ceux qui courent ou grimpent)
  ROUND((COUNTIF(Running = true OR Climbing = true) / COUNT(*)) * 100, 2) AS pourcent_sportifs,
  -- Ceux qui mangent tranquillement
  ROUND((COUNTIF(Eating = true) / COUNT(*)) * 100, 2) AS pourcent_gourmands
FROM
  `<COPY_YOUR_PROJECT_NAME>.fun_data.squirrels_2018` -- <--- Change ceci avec ton nom de table
WHERE
  `Primary Fur Color` IS NOT NULL
GROUP BY
  1
ORDER BY
  pourcent_amicaux DESC;
```
- Click Run
- See the results at the bottom of the page
