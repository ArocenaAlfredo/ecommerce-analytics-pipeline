from sqlalchemy import create_engine
from src.extract import extract
from src.load import load
from src.config import DATASET_ROOT_PATH, PUBLIC_HOLIDAYS_URL, get_csv_to_table_mapping

# Crear la base de datos en memoria para pruebas
engine = create_engine("sqlite://")

# Extraer los datos
csv_folder = DATASET_ROOT_PATH
csv_table_mapping = get_csv_to_table_mapping()
data_frames = extract(csv_folder, csv_table_mapping, PUBLIC_HOLIDAYS_URL)

# Cargar los datos en SQLite
load(data_frames, engine)

# Mostrar tablas cargadas
print("\n📂 Tablas en la base de datos SQLite:")
from sqlalchemy import inspect

inspector = inspect(engine)
print(inspector.get_table_names())

