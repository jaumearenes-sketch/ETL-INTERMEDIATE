from prefect import flow
from prefect_dbt.cloud import DbtCloudJob

@flow
def lanzar_primer_job():
    job = DbtCloudJob.load("job-staging")
    print("Lanzando el primer trabajo de dbt job-staging")
    job.trigger()

@flow
def lanzar_segundo_job():
    job = DbtCloudJob.load("job-transformation")
    print("Lanzando el segundo trabajo de dbt job-transformation")
    job.trigger()

@flow
def lanzar_tercer_job():
    job = DbtCloudJob.load("job-business")
    print("Lanzando el tercer trabajo de dbt job-business")
    job.trigger()