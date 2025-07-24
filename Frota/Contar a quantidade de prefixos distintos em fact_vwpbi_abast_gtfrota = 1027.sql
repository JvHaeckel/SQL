-- Contar a quantidade de prefixos distintos em fact_vwpbi_abast_gtfrota = 1027
 SELECT COUNT(DISTINCT VEI_IDENTIFICACAO_EMPRESA) AS Prefixos 
 FROM fact_vwpbi_abast_gtfrota;