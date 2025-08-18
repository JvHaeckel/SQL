-- Prefixo mais Rodado e menos Rodado Gt Frota Km PercoReclaculado

SELECT 
VEI_IDENTIFICACAO_EMPRESA AS Prefixo,  -- Renomeia a coluna para 'Prefixo' 
SUM(HAS_ODOMETRO - KM_ANT) AS Soma_Km               -- Soma todos os valores  KM_PERCO 

FROM  fact_vwpbi_abast_gtfrota   WHERE  HAS_DATA >= '2025-01-01 00:00:00'   
                
GROUP BY VEI_IDENTIFICACAO_EMPRESA     -- Agrupa os resultados por prefixo 

ORDER BY    SUM(HAS_ODOMETRO - KM_ANT) ASC;    -- Ordena do mais negativo para o menos negativo