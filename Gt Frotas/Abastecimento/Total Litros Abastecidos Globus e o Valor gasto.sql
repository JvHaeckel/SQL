-- Total Litros Abastecidos Globus e  Valores gastos em Real
SELECT SUM(LITROS) AS Total_Litros_Consumidos_Globus, SUM(Valor) AS Valor
 FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00';
