from src.extract import extract, PUBLIC_HOLIDAYS_URL

# Mapeo de archivos CSV a nombres de tablas
csv_table_mapping = {
    "olist_customers_dataset.csv": "customers",
    "olist_geolocation_dataset.csv": "geolocation",
    "olist_order_items_dataset.csv": "order_items",
    "olist_order_payments_dataset.csv": "order_payments",
    "olist_order_reviews_dataset.csv": "order_reviews",
    "olist_orders_dataset.csv": "orders",
    "olist_products_dataset.csv": "products",
    "olist_sellers_dataset.csv": "sellers",
    "product_category_name_translation.csv": "category_translation"
}

# Ejecutamos la función extract
DATASET_ROOT_PATH = "dataset/"
dataframes = extract(DATASET_ROOT_PATH, csv_table_mapping, PUBLIC_HOLIDAYS_URL)

# Mostramos los nombres de los DataFrames cargados
print("✅ DataFrames cargados:", dataframes.keys())

# Mostramos las primeras filas de los feriados públicos
print("\n📅 Feriados Públicos:")
print(dataframes["public_holidays"].head())

# Mostramos las primeras filas de la tabla de clientes
print("\n👥 Primeros clientes:")
print(dataframes["customers"].head())
