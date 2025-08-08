-- Tabela Prefixos Distintos Globus
-- 08/08 = 1004
SELECT
    PREFIXO AS Prefixo,
    MAX(CASE WHEN EMPRESA = 21 THEN 'Sao Paulo' 
             WHEN EMPRESA = 27 THEN 'Pernambuco'
             ELSE 'Outra' END) AS Empresa
FROM fact_vwpbi_abastecimento_detalhado
WHERE DATA >= '2025-01-01 00:00:00'
GROUP BY PREFIXO
ORDER BY Prefixo;

/* Essa parte do MAX na coluna Empresa não é para “pegar o maior nome” literalmente — é um truque para 
o SQL aceitar trazer essa coluna sem quebrar a regra do GROUP BY. Se cada prefixo só tem uma empresa, 
tanto MAX() quanto MIN() vão dar o mesmo resultado.*/