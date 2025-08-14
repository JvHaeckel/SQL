-- Prefixo mais Rodado e menos Rodado Gt Frota Km Perco

SELECT 
VEI_IDENTIFICACAO_EMPRESA AS Prefixo,  -- Renomeia a coluna para 'Prefixo' 
SUM(KM_PERCO) AS Soma_Km               -- Soma todos os valores  KM_PERCO 

FROM  fact_vwpbi_abast_gtfrota   WHERE  HAS_DATA >= '2025-01-01 00:00:00'   
                
GROUP BY VEI_IDENTIFICACAO_EMPRESA     -- Agrupa os resultados por prefixo 
ORDER BY    SUM(KM_PERCO) DESC;    -- Ordena do mais Rodado para o menos rodado