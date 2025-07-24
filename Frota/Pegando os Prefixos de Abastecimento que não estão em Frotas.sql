-- Pegando os Prefixos no mês de Julho no Globus que não estão em Frotas

SELECT DISTINCT PREFIXO AS Prefixo 
FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-07-01' AND DATA < '2025-08-01'

AND PREFIXO NOT IN (SELECT PREFIXOVEIC from fact_vwpbi_frota WHERE CONDICAO = 'Ativo');