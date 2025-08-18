-- Prefixo mais Rodado e menos Rodado Gt  Km PercoRecalculado

SELECT 
VEI_IDENTIFICACAO_EMPRESA AS Prefixo,  HAS_ODOMETRO,  KM_ANT,
SUM(HAS_ODOMETRO - KM_ANT) AS Soma_KmRecalculado               -- Soma todos os valores  KM_PERCO 

FROM  fact_vwpbi_abast_gtfrota   WHERE  HAS_DATA >= '2025-01-01 00:00:00'   
AND KM_ANT > 0  -- Não quero pegar valores aode 
                
GROUP BY VEI_IDENTIFICACAO_EMPRESA , HAS_ODOMETRO,  KM_ANT  -- Agrupa os resultados por prefixo 
ORDER BY    SUM(HAS_ODOMETRO - KM_ANT) DESC;    -- Ordena do mais Rodado para o menos rodado
/* 
Mais rodado - Prefixo: 0002939	Soma_KmRecalculado: 26986069
Menos rodado - Prefixo: 0002975	Soma_KmRecalculado: -938040

*/