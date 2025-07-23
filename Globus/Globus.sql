-- Colunas mais usadas Globus com KmPercorrido recalculado

SELECT EMPRESA, DATA,PREFIXO, KMPERCORRIDO, (HODFINALVELOC - HODINICIALVELOC) AS RecalKmPercorrido,  
LITROS, CONSUMO, TIPO_FROTA, VALOR, LINHA
FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00' 
order by DATA ASC