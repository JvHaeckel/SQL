-- Gt Frota Prefixos que abasteceram várias vezes, sem aumento significativo no km percorrido recalculado
SELECT
    EMPRESA,
    VEI_IDENTIFICACAO_EMPRESA,
    COUNT(*) AS Qtd_Abastecimentos, -- Quantidade de abastecimentos para o veículo
    MIN(HAS_DATA) AS Data_Inicial,
    MAX(HAS_DATA) AS Data_Final,
    MIN(HAS_ODOMETRO - KM_ANT) AS Km_Percorrido_Min,        -- menor deslocamento calculado
    MAX(HAS_ODOMETRO - KM_ANT) AS Km_Percorrido_Max,        -- maior deslocamento calculado
    MAX(HAS_ODOMETRO) - MIN(KM_ANT) AS Km_Total_Recalculado -- km total acumulado entre primeiros e últimos hodômetros

FROM fact_vwpbi_abast_gtfrota
WHERE HAS_DATA >= '2025-01-01 00:00:00'

GROUP BY EMPRESA, VEI_IDENTIFICACAO_EMPRESA
HAVING 
    COUNT(*) > 1 -- mais de um abastecimento
    AND (MAX(HAS_ODOMETRO) - MIN(KM_ANT)) < 0.01 -- km total percorrido quase zero

/* 
Essa consulta identifica veículos que abasteceram mais de uma vez mas não rodaram (km recalculado entre
o menor hodômetro inicial e maior hodômetro final é menor que 0,01 km), indicando:
- Veículos abastecidos sem rodar;
- Possíveis falhas na captura do hodômetro;
- Ou dados incorretos/inconsistentes.
*/
