-- Soma Volume Excedente Litros HAS_QTD_LITROS (388,35)
SELECT 
  
ROUND(  SUM( ROUND(HAS_QTD_LITROS - VEI_LIMITE_ABASTECIMENTO,2)),2 )AS SOMA_Volume_Excedente

FROM fact_vwpbi_abast_gtfrota
WHERE 
  HAS_DATA >= '2025-01-01 00:00:00'
  AND HAS_QTD_LITROS > VEI_LIMITE_ABASTECIMENTO  -- Só mostra quando há excesso