Project that contains the basic data ingestion and transformations with DBT.

The folder seeds contains the excel files that serve as data source. They are being loaded into the Staging Layer (first layer of the warehouse), and then to the Access Layer (where the Star Schema is created).

The Star Schema comprises 2 dimensions (customers and locations) and 1 fact table where the orders information is stored. The fact table joins the data from the dimensions, making it ready for consumption by any BI tool.

The folder my_database_scheduler has been created thanks to dagster which is used as an scheduler. Library used is dagster-dbt.