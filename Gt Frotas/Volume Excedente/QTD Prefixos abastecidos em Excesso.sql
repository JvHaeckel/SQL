-- QTD Prefixos abastecidos em Excesso para o HAS_QTD_LITROS recalculado (8)
SELECT 
 count(distinct(VEI_IDENTIFICACAO_EMPRESA)) AS QTD_Excesso

FROM fact_vwpbi_abast_gtfrota
WHERE 
  HAS_DATA >= '2025-01-01 00:00:00'
  AND ROUND(HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES,2)  > VEI_LIMITE_ABASTECIMENTO  -- Só mostra quando há excesso