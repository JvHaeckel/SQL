-- QTD Abastecimento sem deslocamento GT Frota
SELECT 
    COUNT(HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES) AS QTD_Abas_SemDeslocamento
FROM fact_vwpbi_abast_gtfrota

WHERE HAS_DATA >= '2025-01-01 00:00:00' AND KM_PERCO = 0  AND 
 (HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES) > 0 AND 
 (HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES) IS NOT NULL 
 
 /* Podemos colcocar AND EMPRESA = 21 ou AND EMPRESA = 27 para contar os casos de abastecimento
 sem deslocamento */