-- QTD Prefixos Distintos Globus
-- 08/08 = 1004
SELECT count(DISTINCT PREFIXO) AS QTDPrefixo    
FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00'