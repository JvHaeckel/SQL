-- Tabela Volume Excedente com Litros HAS_QTD_LITROS
SELECT 
  
 VEI_IDENTIFICACAO_EMPRESA AS Prefixo, VEI_LIMITE_ABASTECIMENTO AS Tanque,
  HAS_DATA AS DATA, HAS_QTD_LITROS AS Litros,HAS_ENCERRANTE_ANTES,HAS_ENCERRANTE_DEPOIS,
  
  -- Volume que excede o limite permitido
  HAS_QTD_LITROS - VEI_LIMITE_ABASTECIMENTO AS Volume_Excedente

FROM fact_vwpbi_abast_gtfrota
WHERE 
  HAS_DATA >= '2025-01-01 00:00:00'
  AND HAS_QTD_LITROS > VEI_LIMITE_ABASTECIMENTO  -- Só mostra quando há excesso

ORDER BY 
  HAS_DATA ASC;  -- Do maior excedente para o menor