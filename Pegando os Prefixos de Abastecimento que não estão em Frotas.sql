/* Pegando os Prefixos de Abastecimento que não estão em Frotas*/

SELECT DISTINCT PREFIXO AS Prefixo 
FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00'

AND PREFIXO NOT IN (
SELECT PREFIXOVEIC from fact_vwpbi_frota);