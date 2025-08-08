-- Contar a quantidade de prefixos distintos em fact_vwpbi_abast_gtfrota 
 SELECT COUNT(DISTINCT VEI_IDENTIFICACAO_EMPRESA) AS Prefixos 
 FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-01-01 00:00:00'
 
 /* 05/06 = 1027
	08/08 = 965 */