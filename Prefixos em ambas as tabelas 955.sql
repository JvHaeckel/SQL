-- Prefixos em ambas as tabelas 955
SELECT COUNT(*) AS Prefixos_Em_Ambas
FROM (
    SELECT PREFIXO FROM fact_vwpbi_abastecimento_detalhado  WHERE DATA >= '2025-01-01 00:00:00'
    
    INTERSECT
    SELECT VEI_IDENTIFICACAO_EMPRESA FROM fact_vwpbi_abast_gtfrota  WHERE HAS_DATA >= '2025-01-01 00:00:00'
) AS comuns;
