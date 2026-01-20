* 1. Instalar el conector con el Banco Mundial (si no lo tienes)
ssc install wbopendata, replace

* 2. Jalar datos de panel reales (PIB per cápita y Gasto en I+D)
* Vamos a bajar datos de 2000 a 2022 para países de LATAM
wbopendata, indicator(NY.GDP.PCAP.KD; GB.XPD.RSDV.GD.ZS) country(LCN) year(2000:2022) clear

* 3. Limpieza y preparación (Data Wrangling al estilo Stata)
rename ny_gdp_pcap_kd gdp_per_capita
rename gb_xpd_rsdv_gd_zs research_spend
destring year, replace

* Definir la estructura de Panel (ID de país y tiempo)
* Esto es lo que "le vuela la cabeza" a los que usan solo Excel
encode countryname, gen(country_id)
xtset country_id year

* 4. Visualización rápida de la "película" (Panel Data Plot)
xtline gdp_per_capita, overlay legend(off) title("Evolución PIB per cápita en LATAM")

* 5. EL ANÁLISIS FUMADO: Modelo de Efectos Fijos (Fixed Effects)
* Queremos saber si invertir en ciencia sube el PIB, controlando por 
* las características invariantes de cada país (cultura, geografía, etc.)
xtreg gdp_per_capita research_spend, fe

* 6. Prueba de Hausman (Para decidir entre Efectos Fijos o Aleatorios)
* Esto es puro rigor estadístico
quietly xtreg gdp_per_capita research_spend, fe
estimates store fixed
quietly xtreg gdp_per_capita research_spend, re
estimates store random
hausman fixed random

* 7. Corrección de errores (Autocorrelación y Heterocedasticidad)
* Porque en el mundo real los datos tienen "ruido"
xtreg gdp_per_capita research_spend, fe vce(robust)
