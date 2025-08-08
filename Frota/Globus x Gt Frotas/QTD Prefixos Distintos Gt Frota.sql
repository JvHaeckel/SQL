-- QTD Prefixos Distintos Gt Frota
-- 08/08 = 965
SELECT
    count(DISTINCT VEI_IDENTIFICACAO_EMPRESA) AS QTDPrefixo    
    
FROM fact_vwpbi_abast_gtfrota
WHERE HAS_DATA >= '2025-01-01 00:00:00'
