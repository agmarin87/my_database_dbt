from setuptools import find_packages, setup

setup(
    name="my_database_scheduler",
    version="0.0.1",
    packages=find_packages(),
    package_data={
        "my_database_scheduler": [
            "dbt-project/**/*",
        ],
    },
    install_requires=[
        "dagster",
        "dagster-cloud",
        "dagster-dbt",
        "dbt-duckdb<1.9",
        "dbt-duckdb<1.9",
    ],
    extras_require={
        "dev": [
            "dagster-webserver",
        ]
    },
)