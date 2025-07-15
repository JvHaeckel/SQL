-- Km constante em vários abastecimentos
SELECT
    EMPRESA, PREFIXO,
    COUNT(*) AS Qtd_Abastecimentos,
    MIN(KMPERCORRIDO) AS KM_Percorrido,
    MAX(KMPERCORRIDO) AS KM_Percorrido_Max
FROM fact_vwpbi_abastecimento_detalhado  WHERE DATA >= '2025-01-01 00:00:00' 
GROUP BY EMPRESA, PREFIXO
HAVING 
    COUNT(DISTINCT KMPERCORRIDO) = 1 -- sempre o mesmo KM
    AND COUNT(*) > 1                 -- mais de um abastecimento