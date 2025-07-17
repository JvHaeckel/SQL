-- Pegando os Prefixos de Gt Frotas no mês de Julho que não estão em Frotas

SELECT DISTINCT VEI_IDENTIFICACAO_EMPRESA AS Prefixo 
FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-07-01' AND HAS_DATA < '2025-08-01'

AND VEI_IDENTIFICACAO_EMPRESA NOT IN (SELECT PREFIXOVEIC from fact_vwpbi_frota);