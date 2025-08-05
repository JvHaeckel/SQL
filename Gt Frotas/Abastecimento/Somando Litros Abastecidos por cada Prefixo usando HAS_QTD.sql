-- Somando os valores de Litros Abastecidos por cada Prefixo até hoje usando o  HAS_QTD

SELECT VEI_IDENTIFICACAO_EMPRESA AS Prefixo , 
ROUND(SUM(HAS_QTD_LITROS),2 )AS RecalculaLitros

 FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-01-01 00:00:00' 
 
 GROUP BY VEI_IDENTIFICACAO_EMPRESA  -- Ao colocar GROUP BY já ajusta para somar a cada prefixo
 ORDER BY RecalculaLitros DESC
 
 /* Prefixo Mais Abastecido: 0063032 - 42202.94
    Prefixo Menos Abastecido: 
	0 -   0063798 0063802 0063569 1064607 0064644 0063016
   98.31 - 0006340	
*/
