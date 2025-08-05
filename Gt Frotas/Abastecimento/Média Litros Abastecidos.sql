-- Média Litros Abastecidos Globus 
SELECT ROUND(AVG(LITROS),3) AS Media

 FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00' ;
