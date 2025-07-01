/* Colunas importantes da tabela Abastecimento Detalhado*/
SELECT EMPRESA, DATA,PREFIXO, HODINICIALVELOC, HODFINALVELOC, KMPERCORRIDO, 
LITROS, CONSUMO, TIPO_FROTA, VALOR, LINHA
FROM fact_vwpbi_abastecimento_detalhado where data >= '2025-01-01 00:00:00'

 