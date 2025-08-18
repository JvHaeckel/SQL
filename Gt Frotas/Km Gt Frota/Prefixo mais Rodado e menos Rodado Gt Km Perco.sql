-- Prefixo mais Rodado e menos Rodado Gt Frota Km Perco

SELECT 
VEI_IDENTIFICACAO_EMPRESA AS Prefixo,  HAS_ODOMETRO,  KM_ANT,
SUM(KM_PERCO) AS Soma_Km               -- Soma todos os valores  KM_PERCO 

FROM  fact_vwpbi_abast_gtfrota   WHERE  HAS_DATA >= '2025-01-01 00:00:00'   
                
GROUP BY VEI_IDENTIFICACAO_EMPRESA ,  HAS_ODOMETRO,  KM_ANT  -- Agrupa os resultados por prefixo o hodômetros
ORDER BY    SUM(KM_PERCO) DESC;                              -- Ordena do mais Rodado para o menos rodado

/* Não faz sentido o mais rodado ser o 0002939 pois teve falha no Hodômetro
Mais rodado - Prefixo: 0002939	Soma_KmRecalculado: 26986069
Menos rodado - Prefixo: 0002975	Soma_KmRecalculado: -938040

*/