# 📊 RetailPro — Proyecto de Business Intelligence & Análisis de Ventas

![Estado del Proyecto](https://img.shields.io/badge/Estado-Completado-success)
![Herramientas](https://img.shields.io/badge/Stack-SQL%20%7C%20Power%20BI%20%7C%20DAX-blue)

## 📝 Descripción General del Proyecto
**RetailPro** es una solución integral de Business Intelligence diseñada para transformar los datos transaccionales de ventas minoristas de tecnología en información estratégica para la toma de decisiones. 

A lo largo del flujo de trabajo, se estructuró la base de datos relacional, se construyeron vistas consolidadas en SQL, se diseñó un modelo dimensional en esquema estrella y se desarrollaron tableros interactivos con métricas clave de negocio (KPIs), análisis de rotación de inventario y segmentación de clientes.

---

## 🛠️ Stack Tecnológico y Herramientas Utilizadas
* **SQL (SQL Server):** Extracción, limpieza, transformación (ETL) y creación de vistas base consolidando ventas, clientes, productos y categorías.
* **Modelado Dimensional:** Implementación de un esquema estrella (*Star Schema*) bajo estándares de nomenclatura (`Dim_` para dimensiones y `Fact_` para tablas de hechos) con relaciones unidireccionales ($1:N$).
* **Power BI Desktop:** Conexión a fuentes de datos, modelado relacional y visualización interactiva de reportes ejecutivos.
* **DAX (Data Analysis Expressions):** Creación de una tabla dedicada de medidas (`_Medidas`) con cálculos dinámicos de facturación, ticket promedio, unidades vendidas e inteligencia de tiempo (`SAMEPERIODLASTYEAR`).

---

## 📂 Estructura del Repositorio
```text
Ventas_Tech_DB_Trabajo/
│
├── 📁 scripts_sql/
│   ├── 01_creacion_tablas.sql       # DDL de la base de datos transaccional
│   ├── 02_insercion_datos.sql       # Carga inicial de registros
│   └── 03_vistas_y_consultas.sql    # Vistas base y consultas analíticas
│
├── 📁 power_bi/
│   └── RetailPro_Dashboard.pbix     # Archivo principal del modelo y reporte
│
└── README.md                        # Documentación general del proyecto
```

---

## 🚀 Guía Paso a Paso: Ejecución y Despliegue

### Paso 1: Configuración de la Base de Datos en SQL
1. Clona este repositorio en tu equipo local:
   ```bash
   git clone https://github.com/AntoM51/Ventas_Tech_DB_Trabajo.git
   ```
2. Abre tu gestor de base de datos (ej. **SQL Server Management Studio - SSMS**).
3. Ejecuta el script `01_creacion_tablas.sql` para generar la estructura de la base de datos y sus relaciones.
4. Ejecuta `02_insercion_datos.sql` para poblar las tablas con los datos transaccionales de prueba.
5. Corre `03_vistas_y_consultas.sql` para generar la vista consolidada (`vw_detalle_ventas`) que alimentará el modelo analítico.

### Paso 2: Apertura y Actualización en Power BI Desktop
1. Abre **Power BI Desktop** (asegúrate de tener instalada una versión reciente).
2. Navega a la carpeta `/power_bi` y abre el archivo `RetailPro_Dashboard.pbix`.
3. Si el origen de datos apunta a un servidor local distinto al tuyo, dirígete a **Transformar datos > Configuración de origen de datos** y actualiza el nombre de tu servidor SQL local.
4. Haz clic en **Actualizar** en la cinta de opciones principal para cargar los datos frescos y recalcular las medidas DAX.

---

## 📈 Principales Insights Obtenidos
* **Polarización de Cartera:** Identificación clara entre artículos *Premium* de alto margen unitario y productos de alta rotación que impulsan el volumen operativo.
* **Comportamiento del Cliente:** Alta tasa de recurrencia temprana en la base de clientes registrada, permitiendo diseñar estrategias de fidelización y venta cruzada (*cross-selling*).

---
*Proyecto desarrollado como parte del portafolio de análisis de datos.*