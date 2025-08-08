-- Selecionar os Prefixos Distintos do Globus
SELECT 
    EMPRESA,
    CASE WHEN EMPRESA = 27 THEN 'Pernambuco' ELSE 'São Paulo' END AS Empresa,
    PREFIXO AS Prefixo, 

    MAX(LITROS) AS Litros
FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00' 
GROUP BY EMPRESA, PREFIXO
ORDER BY Prefixo;