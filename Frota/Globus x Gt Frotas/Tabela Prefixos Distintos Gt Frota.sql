-- Tabela Prefixos Distintos Gt Frota
-- 08/08 = 965
SELECT
    VEI_IDENTIFICACAO_EMPRESA AS Prefixo,
    MAX(CASE WHEN EMPRESA = 21 THEN 'Sao Paulo' 
             WHEN EMPRESA = 27 THEN 'Pernambuco'
             ELSE 'Outra' END) AS Empresa
FROM fact_vwpbi_abast_gtfrota
WHERE HAS_DATA >= '2025-01-01 00:00:00'
GROUP BY VEI_IDENTIFICACAO_EMPRESA
ORDER BY Prefixo;

/* Essa parte do MAX na coluna Empresa não é para “pegar o maior nome” literalmente — é um truque para 
o SQL aceitar trazer essa coluna sem quebrar a regra do GROUP BY. Se cada prefixo só tem uma empresa, 
tanto MAX() quanto MIN() vão dar o mesmo resultado.*/