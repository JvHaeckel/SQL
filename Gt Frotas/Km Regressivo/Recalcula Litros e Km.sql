-- Recalcula Litros e Km 

SELECT  
  EMPRESA, HAS_DATA, VEI_IDENTIFICACAO_EMPRESA AS Prefixo, 

  -- Cálculo dos litros abastecidos via encerrantes
  ROUND((HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES), 1) AS RecalculaLitros, 
  HAS_QTD_LITROS,

  -- Comparação tolerante entre litros calculados e registrados
  CASE
    WHEN ABS((HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES) - HAS_QTD_LITROS) <= 0.05 THEN '' 
    ELSE 'ERRO' 
  END AS CompareLitros,

  -- Recalcula distância percorrida via hodômetro
  (HAS_ODOMETRO - KM_ANT) AS RecalculaKm, KM_PERCO, 

  -- Comparação direta de distância
  CASE
    WHEN (HAS_ODOMETRO - KM_ANT) = KM_PERCO THEN '' ELSE 'ERRO' 
  END AS CompareKm,

  KM_ANT, HAS_ODOMETRO,  HAS_ENCERRANTE_ANTES, 
  HAS_ENCERRANTE_DEPOIS, TER_DATA_ULTIMA_COMUNIC
 
FROM fact_vwpbi_abast_gtfrota  
WHERE HAS_DATA >= '2025-01-01 00:00:00' 
ORDER BY HAS_DATA ASC;