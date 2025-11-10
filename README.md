# H1 Repository that contains a basic Data Engineering project <br />
The project my_database_dbt is a data warehouse performed with dbt-duckdb. It contains the basic data ingestion and transformations with DBT.

## H2 ARCHITECTURE <br />
![alt text](architecture_schematic.png)

The folder seeds contains the excel files being loaded to the database. It is basic data about customers, locations, orders and products.

The folder model contains 2 folders, one per each layer. Each of these folders contain the SQL script to create the tables and load the data into these layers. They also contain the schema.yml files that define each layer, table and attribute. There, basic tests are also defined (mostly to check if attributes are fully NULL or not).

The folder my_database_scheduler has been created thanks to dagster which is used as an scheduler. Library used is dagster-dbt.

The file dev.duckdb is the database itself that contains the data already loaded.

## H2 DATA MODEL <br />
The Star Schema comprises 2 dimensions (dim_customers and dim_locations) and 1 fact table (fact_orders) where the orders information is stored. The fact table joins the data from the dimensions, making it ready for consumption by any BI tool (see image below).
There is an extra dimension (dim_products). This dimension is created to have a unique list of products available from all the orders. A surrogate key is generated as a primary key.

![alt text](my_database_dbt/warehouse_layers.png)