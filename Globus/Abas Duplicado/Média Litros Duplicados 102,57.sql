-- Média Litros Duplicados 102,57

SELECT 
    AVG(LITROS) AS MEDIA_LITROS_DUPLICADOS
FROM (
    SELECT 
        EMPRESA,
        DATE(DATA) AS DATA_SEM_HORA,
        PREFIXO,
        LITROS
    FROM fact_vwpbi_abastecimento_detalhado
    WHERE DATA >= '2025-01-01 00:00:00' AND LITROS >= 0.01
    GROUP BY EMPRESA, DATE(DATA), PREFIXO, LITROS
    HAVING COUNT(*) >= 2
) AS Duplicados;
