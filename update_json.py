import pandas as pd

# Ruta del archivo JSON corregido
json_path = "C:/Users/pc/Desktop/assignment/tests/query_results/orders_per_day_and_holidays_2017.json"

# Convertimos los datos a formato correcto
df = pd.read_json(json_path)

# Renombramos las columnas según la consulta SQL
df.rename(columns={"order_count": "total_orders", "date": "order_date", "holiday": "is_holiday"}, inplace=True)

# Convertimos timestamp a formato fecha YYYY-MM-DD
df["order_date"] = pd.to_datetime(df["order_date"], unit="ms").dt.strftime("%Y-%m-%d")

# Guardamos el JSON corregido
df.to_json(json_path, orient="records", indent=4)

print(f"✅ Archivo JSON actualizado en: {json_path}")

