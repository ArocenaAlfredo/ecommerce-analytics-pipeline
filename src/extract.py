from typing import Dict
from pathlib import Path
import requests
import pandas as pd

PUBLIC_HOLIDAYS_URL = "https://date.nager.at/api/v3/PublicHolidays"

def get_public_holidays(public_holidays_url: str, year: str) -> pd.DataFrame:
    """Obtiene los feriados públicos de Brasil para un año dado.

    Args:
        public_holidays_url (str): URL de la API de feriados públicos.
        year (str): Año para el cual obtener los feriados.

    Raises:
        SystemExit: Si la solicitud a la API falla.

    Returns:
        pd.DataFrame: DataFrame con los feriados públicos.
    """
    url = f"{public_holidays_url}/{year}/BR"
    
    try:
        response = requests.get(url)
        response.raise_for_status()  # Lanza un error si la solicitud falla
        holidays = pd.DataFrame(response.json())

        # Eliminamos las columnas innecesarias
        holidays.drop(columns=["types", "counties"], inplace=True, errors="ignore")

        # Convertimos la columna "date" a tipo datetime
        holidays["date"] = pd.to_datetime(holidays["date"])

        return holidays

    except requests.RequestException as e:
        print(f"❌ Error al obtener feriados públicos: {e}")
        raise SystemExit(1)


def extract(csv_folder: str, csv_table_mapping: Dict[str, str], public_holidays_url: str) -> Dict[str, pd.DataFrame]:
    """Carga los datos desde archivos CSV y la API de feriados públicos.

    Args:
        csv_folder (str): Carpeta donde están los archivos CSV.
        csv_table_mapping (Dict[str, str]): Diccionario con los nombres de archivos y sus tablas.
        public_holidays_url (str): URL de la API de feriados públicos.

    Returns:
        Dict[str, pd.DataFrame]: Diccionario con los DataFrames cargados.
    """
    csv_folder = Path(csv_folder)
    dataframes = {}

    for file_name, table_name in csv_table_mapping.items():
        file_path = csv_folder / file_name
        dataframes[table_name] = pd.read_csv(file_path)

    # Extraemos los feriados de 2017 y los agregamos al diccionario
    dataframes["public_holidays"] = get_public_holidays(public_holidays_url, "2017")

    return dataframes
