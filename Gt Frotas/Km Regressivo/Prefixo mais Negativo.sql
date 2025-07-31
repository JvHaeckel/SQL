-- Prefixo mais Negativo 

SELECT 
VEI_IDENTIFICACAO_EMPRESA AS Prefixo,  -- Renomeia a coluna para 'Prefixo' 
SUM(KM_PERCO) AS Soma_Km_Negativo    -- Soma todos os valores negativos de KM_PERCO 

FROM  fact_vwpbi_abast_gtfrota               -- Origem dos dados: tabela de abastecimento da frota

WHERE  HAS_DATA >= '2025-01-01 00:00:00'    -- Considera registros a partir de 1º de janeiro 
AND KM_PERCO < 0                  -- Filtra apenas os registros onde o KM percorrido foi negativo

GROUP BY 
  VEI_IDENTIFICACAO_EMPRESA             -- Agrupa os resultados por prefixo 

ORDER BY    SUM(KM_PERCO) ASC;    -- Ordena do mais negativo para o menos negativo
