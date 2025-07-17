SELECT COUNT(DISTINCT PREFIXO) AS QtdPrefixos
FROM (
    SELECT PREFIXO 
    FROM fact_vwpbi_abastecimento_detalhado 
    WHERE DATA >= '2025-07-01' AND DATA < '2025-08-01'
      AND PREFIXO NOT IN (
          SELECT VEI_IDENTIFICACAO_EMPRESA FROM fact_vwpbi_abast_gtfrota 
          WHERE HAS_DATA >= '2025-07-01' AND HAS_DATA < '2025-08-01'
      )
) AS QTD_Prefixos;
