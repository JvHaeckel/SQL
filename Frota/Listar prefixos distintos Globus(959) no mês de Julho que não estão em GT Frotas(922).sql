-- Listar prefixos distintos Globus(959) no mês de Julho que não estão em GT Frotas(922) 
/*
SELECT DISTINCT PREFIXO AS Prefixo FROM fact_vwpbi_abastecimento_detalhado 
WHERE DATA >= '2025-07-01' AND DATA < '2025-08-01' AND

PREFIXO NOT IN (SELECT VEI_IDENTIFICACAO_EMPRESA FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-07-01' AND HAS_DATA < '2025-08-01') */


SELECT DISTINCT TRIM(UPPER(PREFIXO)) AS Prefixo
FROM fact_vwpbi_abastecimento_detalhado
WHERE DATA >= '2025-07-01' AND DATA < '2025-08-01'
  AND TRIM(UPPER(PREFIXO)) NOT IN (
    SELECT TRIM(UPPER(VEI_IDENTIFICACAO_EMPRESA))
    FROM fact_vwpbi_abast_gtfrota
    WHERE HAS_DATA >= '2025-07-01' AND HAS_DATA < '2025-08-01'
  )
  AND PREFIXO IS NOT NULL
  AND TRIM(PREFIXO) NOT LIKE '%[^0-9]%'; -- opcional: filtrar apenas numéricos
