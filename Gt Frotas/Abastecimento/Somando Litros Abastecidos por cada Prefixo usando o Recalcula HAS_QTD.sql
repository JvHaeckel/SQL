-- Somando os valores de Litros Abastecidos por cada Prefixo até hoje usando o Recalcula HAS_QTD

SELECT VEI_IDENTIFICACAO_EMPRESA AS Prefixo , 
ROUND(SUM(HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES),2) AS RecalculaLitros

 FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-01-01 00:00:00' 
 
 GROUP BY VEI_IDENTIFICACAO_EMPRESA  -- Ao colocar GROUP BY já ajusta para somar a cada prefixo
 ORDER BY RecalculaLitros DESC
 
 /* Prefixo Mais Abastecido: 0063032 - 42157.24
    Prefixo Menos Abastecido: 
	NULL  - 0063798 0063802 1064607 0064644	
    56.21 - 0063016	
*/
