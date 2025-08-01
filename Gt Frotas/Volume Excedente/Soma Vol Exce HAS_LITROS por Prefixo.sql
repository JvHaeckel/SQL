-- Soma Vol Exce HAS_LITROS por Prefixo
SELECT 
  VEI_IDENTIFICACAO_EMPRESA AS Prefixo,
ROUND(  SUM( ROUND(HAS_QTD_LITROS - VEI_LIMITE_ABASTECIMENTO,2)),2 )AS SOMA_Volume_Excedente

FROM fact_vwpbi_abast_gtfrota
WHERE 
  HAS_DATA >= '2025-01-01 00:00:00'
  AND HAS_QTD_LITROS > VEI_LIMITE_ABASTECIMENTO  -- Só mostra quando há excesso
GROUP BY VEI_IDENTIFICACAO_EMPRESA
/* Prefixo Mais Excedido: 00006301
   Prefixo Menos Excedido: 0000700
*/