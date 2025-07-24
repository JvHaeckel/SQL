-- Comparar a união das tabelas com os prefixos que tem em Frotas
SELECT COUNT(*) AS Prefixos_Encontrados_Na_Frota
FROM (
    SELECT DISTINCT PREFIXO AS Prefixo FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00'
    UNION
    SELECT DISTINCT VEI_IDENTIFICACAO_EMPRESA AS Prefixo FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-01-01 00:00:00'
    
    INTERSECT
    SELECT DISTINCT PREFIXOVEIC AS Prefixo FROM fact_vwpbi_frota
) AS comuns;
