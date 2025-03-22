Project that contains the basic data ingestion and transformations with DBT.

The folder seeds contains the excel files that serve as data source. They are being loaded into the Staging Layer (first layer of the warehouse), and then to the Access Layer (where the Star Schema is created). 

The folder model contains 2 folders, one per each layer (Staging Layer and Access Layer). Each of these folders contain the SQL script to create the tables and load the data into these layers.

The Star Schema comprises 2 dimensions (customers and locations) and 1 fact table where the orders information is stored. The fact table joins the data from the dimensions, making it ready for consumption by any BI tool.

The folder my_database_scheduler has been created thanks to dagster which is used as an scheduler. Library used is dagster-dbt.

The file dev.duckdb is the database itself that contains the data already loaded.