-- Km Constante Igual a Tabela Km constante Globus
SELECT  EMPRESA,PREFIXO,
    COUNT(*) AS Qtd_Abastecimentos,
    ROUND (SUM(LITROS),2) AS Total_Litros_Abastecidos,
	MAX(HODFINALVELOC) - MIN(HODINICIALVELOC) AS Km_Total_Recalculado
    
FROM fact_vwpbi_abastecimento_detalhado  WHERE DATA >= '2025-01-01 00:00:00'
GROUP BY EMPRESA, PREFIXO
HAVING 
    COUNT(*) > 1
    AND (MAX(HODFINALVELOC) - MIN(HODINICIALVELOC) ) < 0.019  /* Coloquei para ficar igual ao power query*/
ORDER BY Total_Litros_Abastecidos DESC;
