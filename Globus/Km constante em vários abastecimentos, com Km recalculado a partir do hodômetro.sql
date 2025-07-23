-- Prefixos que abasteceram várias vezes, sem aumento significativo no km percorrido recalculado
-- é a tabela de Km Constante Globus
SELECT
    EMPRESA,
    PREFIXO,
    COUNT(*) AS Qtd_Abastecimentos, -- Quantidade de abastecimentos para o veículo
    MIN(DATA) AS Data_Inicial,
    MAX(DATA) AS Data_Final,
    MIN(ROUND(HODFINALVELOC - HODINICIALVELOC, 5)) AS Km_Percorrido_Min, -- menor deslocamento calculado
    MAX(ROUND(HODFINALVELOC - HODINICIALVELOC , 5)) AS Km_Percorrido_Max, -- maior deslocamento calculado
   ROUND ( MAX(HODFINALVELOC) - MIN(HODINICIALVELOC),4) AS Km_Total_Recalculado -- km total acumulado entre primeiros e últimos hodômetros
   -- Para operações o Round precisa ser colocado pegando tudo
FROM fact_vwpbi_abastecimento_detalhado
WHERE DATA >= '2025-01-01 00:00:00'

GROUP BY EMPRESA, PREFIXO
HAVING 
    COUNT(*) > 1 -- mais de um abastecimento
    AND (MAX(HODFINALVELOC) - MIN(HODINICIALVELOC)) < 0.1 -- km total percorrido quase zero

/* 
Essa consulta identifica veículos que abasteceram mais de uma vez mas não rodaram (km recalculado entre
o menor hodômetro inicial e maior hodômetro final é menor que 0,01 km), indicando:
- Veículos abastecidos sem rodar;
- Possíveis falhas na captura do hodômetro;
- Ou dados incorretos/inconsistentes.
*/
