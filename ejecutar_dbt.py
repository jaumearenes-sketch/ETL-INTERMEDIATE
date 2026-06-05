from prefect import flow
from prefect_dbt.cloud import DbtCloudJob

@flow
def lanzar_mi_modelo_dbt():
    # Cargamos el bloque con el nombre correcto: "segonaprova"
    dbt_cloud_job = DbtCloudJob.load("segonaprova")
    
    print("Iniciando el trabajo en dbt Cloud...")
    # Lanzamos la ejecución del trabajo
    resultado = dbt_cloud_job.trigger()
    
    print("¡Trabajo de dbt completado con éxito!")
    return resultado

if __name__ == "__main__":
    lanzar_mi_modelo_dbt()