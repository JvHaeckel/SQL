-- Pegando os Prefixos no GT Frotas que não estão no Globus

SELECT DISTINCT VEI_IDENTIFICACAO_EMPRESA  AS Prefixo 
FROM fact_vwpbi_abast_gtfrota  WHERE HAS_DATA >= '2025-01-01 00:00:00'

AND VEI_IDENTIFICACAO_EMPRESA  NOT IN (SELECT PREFIXO  from fact_vwpbi_abastecimento_detalhado );