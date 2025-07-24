-- Prefixos exclusivos de Abastecimento (35)
SELECT COUNT(*) AS Exclusivos_Abastecimento
FROM (
    SELECT DISTINCT PREFIXO FROM fact_vwpbi_abastecimento_detalhado  WHERE DATA >= '2025-01-01 00:00:00'
    EXCEPT
    SELECT DISTINCT VEI_IDENTIFICACAO_EMPRESA FROM fact_vwpbi_abast_gtfrota  WHERE HAS_DATA >= '2025-01-01 00:00:00'
) AS apenas_abastecimento;
