-- Exibir linhas com Abastecimento Duplicado GT Frotas para HAS_QTD_LITROS

SELECT 
     EMPRESA AS Empresa, DATE(HAS_DATA) AS Data,  -- `Precisa colocar data para dia assim não precisa casar com horário exato
     VEI_IDENTIFICACAO_EMPRESA AS Prefixo , HAS_QTD_LITROS AS Litros, 
    COUNT(*) AS QTD
FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-01-01 00:00:00' AND HAS_QTD_LITROS >= 0.01
GROUP BY  EMPRESA, DATE(HAS_DATA), VEI_IDENTIFICACAO_EMPRESA, HAS_QTD_LITROS
HAVING QTD >= 2
ORDER BY HAS_QTD_LITROS DESC