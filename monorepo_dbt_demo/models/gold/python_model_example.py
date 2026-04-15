import pyspark.sql.functions as F
from python_helpers.helper import helper_function


def model(dbt, session):
    dbt.config(materialized="incremental")
    df = dbt.ref("Portal__product_component")

    if dbt.is_incremental:
        # only new rows compared to max in current table
        max_from_this = f"select max(updated_at) from {dbt.this}"
        df = df.filter(df.updated_at >= session.sql(max_from_this).collect()[0][0])

        # or only rows from the past 3 days
        df = df.filter(df.updated_at >= F.date_add(F.current_timestamp(), F.lit(-3)))

    """
    other transformation code here
    """
    df = df.withColumn("helper_used", F.lit(helper_function()))

    return df
