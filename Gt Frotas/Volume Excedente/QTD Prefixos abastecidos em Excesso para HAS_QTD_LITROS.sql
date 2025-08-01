-- QTD Prefixos abastecidos em Excesso para HAS_QTD_LITROS (10)
SELECT 
 count(distinct(VEI_IDENTIFICACAO_EMPRESA)) AS QTD_Excesso

FROM fact_vwpbi_abast_gtfrota
WHERE 
  HAS_DATA >= '2025-01-01 00:00:00'
  AND HAS_QTD_LITROS  > VEI_LIMITE_ABASTECIMENTO  -- Só mostra quando há excesso