-- Somando os valores de Litros Abastecidos por cada Prefixo até hoje

SELECT PREFIXO AS Prefixo, SUM(LITROS) AS Total_Litros

 FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00' 
 
 GROUP BY PREFIXO  -- Ao colocar GROUP BY já ajusta para somar a cada prefixo
 
 ORDER BY Total_Litros DESC
 /* Prefixo Mais Abastecido: 0063032
    Prefixo Menos Abastecido: 0006340
*/