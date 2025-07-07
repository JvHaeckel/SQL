SELECT COUNT(*) AS Exclusivos_GTFrota
FROM (
    -- Prefixos excluisvos Gt Frotas 10
    SELECT DISTINCT VEI_IDENTIFICACAO_EMPRESA 
    FROM fact_vwpbi_abast_gtfrota 
    WHERE HAS_DATA >= '2025-01-01 00:00:00'
    EXCEPT
    SELECT DISTINCT PREFIXO 
    FROM fact_vwpbi_abastecimento_detalhado 
    WHERE DATA >= '2025-01-01 00:00:00'
) AS apenas_gtfrota;
