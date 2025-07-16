# E-commerce Analytics Pipeline

This project implements an end-to-end ELT (Extract, Load, Transform) data pipeline to analyze e-commerce transactions and delivery performance in Brazil between 2016 and 2018. The goal is to provide actionable insights on revenue generation and logistics efficiency for a major e-commerce platform in Latam.

## 🚀 Project Overview

The business team requested the Data Science department to analyze two key aspects:

- **Revenue**: total income per year, top and bottom product categories, revenue by state.
- **Delivery**: delays, differences between estimated vs. actual delivery dates, correlation with public holidays.

This project integrates real-world datasets from multiple sources, processes them using Python and SQL, stores them in SQLite, and visualizes results with Python libraries.

## 📊 Data Sources

- **E-commerce dataset**: Public dataset from Olist Store with over 100k anonymized orders made in Brazil (2016–2018).
- **Public Holidays API**: [`https://date.nager.at`](https://date.nager.at) — used to analyze delivery delays during holidays.

## 🛠️ Technologies Used

- **Python**: Main programming language
- **Pandas**: Data manipulation from CSVs
- **Requests**: API consumption
- **SQLite**: Local database engine
- **SQL**: Data loading and querying
- **Matplotlib / Seaborn**: Data visualization
- **Jupyter Notebooks**: Interactive reporting
- **Black**: Code formatting
- **Pytest**: Unit testing

##  Project Structure
.
├── dataset/ # CSV files from Olist
├── notebooks/ # Jupyter notebooks with analysis
├── src/ # Python scripts for ETL pipeline
├── tests/ # Unit tests
├── requirements.txt
├── README.md
└── images/ # ER diagram and figures

bash
Copiar
Editar

##  Installation

It is recommended to use a virtual environment:

```bash
python -m venv venv
source venv/bin/activate  # or venv\Scripts\activate on Windows
pip install -r requirements.txt
🧪 Running Tests
To verify the integrity of the code, run:

bash
Copiar
Editar
pytest tests/
Running the Pipeline
Place the unzipped dataset in the dataset/ directory.

Launch the main notebook or run the scripts in src/ to extract, load, and transform the data.

Visualizations and insights are available in the notebooks/ section.

Code Style
This project uses Black for code formatting:

bash
Copiar
Editar
black --line-length=88 .
📈 Sample Insights
Revenue trends by year and state

Top/bottom product categories

Delivery delay patterns and holiday impact
