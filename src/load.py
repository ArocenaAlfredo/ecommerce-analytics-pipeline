from typing import Dict
import pandas as pd
from sqlalchemy.engine import Engine


def load(data_frames: Dict[str, pd.DataFrame], database: Engine):
    """Carga los dataframes en la base de datos SQLite.

    Args:
        data_frames (Dict[str, pd.DataFrame]): Diccionario con nombres de tabla como claves y DataFrames como valores.
        database (Engine): Objeto SQLAlchemy Engine que representa la base de datos.

    Returns:
        None
    """
    for table_name, df in data_frames.items():
        print(f"📤 Cargando tabla: {table_name} ({len(df)} filas)")
        df.to_sql(table_name, con=database, if_exists="replace", index=False)

    print("✅ Carga de datos en SQLite completada.")

