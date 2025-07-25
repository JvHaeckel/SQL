-- Contar a quantidade de ERRORS ao comparar as colunas de Litros
/* Exibir a quantidade de errors, da diferença entre o volume do encerrantes antes e depois
para poder comparar com as contas do banco de dados*/

SELECT COUNT(*) AS QTD_ERRORS
FROM (

SELECT
VEI_IDENTIFICACAO_EMPRESA AS PREFIXO,
EMPRESA, VEI_LIMITE_ABASTECIMENTO, HAS_QTD_LITROS, ABS(HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES ) AS Recalcula_QTD_LITROS
,
CASE 

WHEN HAS_ENCERRANTE_DEPOIS IS NULL OR HAS_ENCERRANTE_ANTES IS NULL THEN 'NULL'
WHEN HAS_ENCERRANTE_DEPOIS = 0 OR HAS_ENCERRANTE_ANTES = 0 THEN '0'
WHEN ABS(HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES  ) = HAS_QTD_LITROS THEN '' ELSE 'ERROR'
END AS Verifica

FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-01-01 00:00:00' 

) AS Sub WHERE Verifica = 'ERROR';