-- Tabela Km Regressivo Principal Gt Frotas

SELECT  HAS_DATA,EMPRESA,  VEI_IDENTIFICACAO_EMPRESA AS Prefixo ,  
(HAS_ODOMETRO - KM_ANT) AS RecalculaKm 
 FROM fact_vwpbi_abast_gtfrota  WHERE HAS_DATA >= '2025-01-01 00:00:00' AND 
 (HAS_ODOMETRO - KM_ANT) < 0
 
 ORDER BY HAS_DATA ASC