-- Km Gt Frota apenas com as colunas importantes

SELECT  HAS_DATA AS Data, EMPRESA AS Empresa,  VEI_IDENTIFICACAO_EMPRESA AS Prefixo , 
KM_ANT, HAS_ODOMETRO, KM_PERCO, (HAS_ODOMETRO - KM_ANT) AS RecalculaKm, 
(KM_PERCO - (HAS_ODOMETRO - KM_ANT)) AS Diferença,
CASE WHEN (KM_PERCO - (HAS_ODOMETRO - KM_ANT)) <> 0 THEN 'Divergente' ELSE '' END AS Status

 FROM fact_vwpbi_abast_gtfrota  WHERE HAS_DATA >= '2025-01-01 00:00:00' 
 ORDER BY HAS_DATA ASC