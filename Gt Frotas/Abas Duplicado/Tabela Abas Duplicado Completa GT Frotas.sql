-- Exibir todas as linhas completas com Abastecimento Duplicado no GT Frotas para HAS_QTD_LITROS

-- Etapa 1: Identifica combinações duplicadas
WITH duplicados AS (
    SELECT 
        EMPRESA, 
        DATE(HAS_DATA) AS DATA_DIA, 
        VEI_IDENTIFICACAO_EMPRESA AS PREFIXO, 
        ROUND(HAS_QTD_LITROS, 2) AS LITROS
    FROM fact_vwpbi_abast_gtfrota
    WHERE 
        HAS_DATA >= '2025-01-01 00:00:00' 
        AND HAS_QTD_LITROS >= 0.01
    GROUP BY 
        EMPRESA, 
        DATE(HAS_DATA), 
        VEI_IDENTIFICACAO_EMPRESA, 
        ROUND(HAS_QTD_LITROS, 2)
    HAVING 
        COUNT(*) >= 2
)
-- Etapa 2: Retorna todas as linhas completas que fazem parte dos duplicados
SELECT 
    f.EMPRESA, f.HAS_DATA, f.VEI_IDENTIFICACAO_EMPRESA AS PREFIXO, 
    f.HAS_QTD_LITROS AS LITROS
FROM fact_vwpbi_abast_gtfrota f
JOIN duplicados d
    ON f.EMPRESA = d.EMPRESA
    AND DATE(f.HAS_DATA) = d.DATA_DIA
    AND f.VEI_IDENTIFICACAO_EMPRESA = d.PREFIXO
    AND ROUND(f.HAS_QTD_LITROS, 2) = d.LITROS
WHERE 
    f.HAS_DATA >= '2025-01-01 00:00:00' AND f.HAS_QTD_LITROS >= 0.01
ORDER BY 
    f.HAS_QTD_LITROS DESC;
