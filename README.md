# LATAM Economic Insights: GDP & R&D Panel Data Analysis

![Stata](https://img.shields.io/badge/Stata-v16%2B-blue.svg)
![Analysis](https://img.shields.io/badge/Focus-Inferencia%20Causal-orange.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Data](https://img.shields.io/badge/Source-World%20Bank-lightgrey.svg)

Este programa realiza un análisis avanzado de **Datos de Panel** utilizando la API del Banco Mundial para explorar la relación causal entre el gasto en Investigación y Desarrollo (I+D) y el crecimiento del PIB per cápita en América Latina (2000-2022).

## Características del Script
* **Data Ingestion:** Conexión directa vía API (`wbopendata`).
* **Econometría:** Implementación de modelos de **Efectos Fijos (FE)** y **Efectos Aleatorios (RE)**.
* **Validación:** Ejecución del **Test de Hausman** para selección de modelo óptimo.
* **Robustez:** Errores estándar robustos para corregir heterocedasticidad.

## 🛠 Requisitos Previos

Antes de correr el script, asegúrate de tener instalado el paquete `wbopendata` en tu consola de Stata:

```stata
ssc install wbopendata, replace

```

## Metodología Estadística

El análisis se basa en la especificación de efectos fijos para controlar la heterogeneidad no observada de los países de LATAM:

Donde:

* : PIB per cápita del país  en el año .
* : Gasto en I+D como % del PIB.
* : Efectos fijos por país (cultura, geografía, instituciones).

## Estructura del Código

1. **Extract:** Obtención de indicadores `NY.GDP.PCAP.KD` y `GB.XPD.RSDV.GD.ZS`.
2. **Transform:** Limpieza de strings, encoding de IDs de país y configuración del panel (`xtset`).
3. **Analyze:** Ejecución de regresiones longitudinales y pruebas de hipótesis.

## Uso

1. Copia el contenido del script en un archivo `.do`.
2. Ejecuta `do analysis_latam.do` en Stata.
3. Los resultados del Test de Hausman se mostrarán en la consola para validar la consistencia de los estimadores.

---

**Desarrollado con fines de análisis económico y científico.**
