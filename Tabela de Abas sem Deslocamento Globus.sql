-- Tabela de Abas sem Deslocamento Globus
/* -- Recalcula o Km Percorrido e compara com a coluna KmPercorrido já calculada no banco Globus. Além disso
vai listar os prefixos que abasteceram acima de 0 litros sem mostrar deslocamento */

SELECT EMPRESA, DATA,PREFIXO, KMPERCORRIDO, ROUND(HODFINALVELOC - HODINICIALVELOC , 3) AS RecalKmPercorrido,  
-- Usei o ROUND para limitar a 3 casas decimais pq na hora de igualar dava diferente devido a conta ser uma dízima. 

CASE 
WHEN KMPERCORRIDO = ROUND(HODFINALVELOC - HODINICIALVELOC , 3) THEN ' ' ELSE 'ERRO'
END AS Status,

LITROS, CONSUMO, TIPO_FROTA, VALOR, LINHA

FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00' AND ROUND(HODFINALVELOC - HODINICIALVELOC , 3) = 0  AND LITROS > 0
ORDER BY DATA ASC