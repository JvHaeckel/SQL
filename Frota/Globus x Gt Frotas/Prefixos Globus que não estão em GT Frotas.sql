-- Pegando os Prefixos no Globus que não estão em GT Frotas

SELECT DISTINCT PREFIXO AS Prefixo 
FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00'

AND PREFIXO NOT IN (SELECT VEI_IDENTIFICACAO_EMPRESA  from fact_vwpbi_abast_gtfrota );