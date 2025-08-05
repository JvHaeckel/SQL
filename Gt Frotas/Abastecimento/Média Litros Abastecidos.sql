-- Média Litros Abastecidos Gt Frotas 
SELECT ROUND(AVG(HAS_QTD_LITROS),3) AS Media

 FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-01-01 00:00:00' ;
