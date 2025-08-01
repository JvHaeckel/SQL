/*Inconsistência na quantidade de Litros(HAS_QTD_LITROS)

Abri o chamado: C2507-353 no link: 
https://mobibrasil.topdesk.net/tas/public/ssp/content/detail/incident?unid=f86a79fc-40ad-4270-9bc5-511a158537ab

Inconsistência na quantidade de Litros(HAS_QTD_LITROS), ao fazer a diferença entre os encerrantes para checar 
os dados percebi que alguns valores não batem. Como podemos ver abaixo existem uma série de desvios:  */

SELECT * FROM (
  SELECT 
   HAS_DATA AS DATA, EMPRESA AS Empresa, VEI_IDENTIFICACAO_EMPRESA AS Prefixo, HAS_QTD_LITROS, 
 (HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES) AS Recalcula_QTD,

    CASE 
WHEN (HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES) = HAS_QTD_LITROS THEN 'OK' ELSE 'ERRO' 
    END AS CheckList,

VEI_LIMITE_ABASTECIMENTO AS Tanque,HAS_ENCERRANTE_ANTES, 
 HAS_ENCERRANTE_DEPOIS

  FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-01-01 00:00:00'
) AS sub

WHERE CheckList = 'ERRO' AND NOT (
HAS_QTD_LITROS = 0 AND (HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES) IS NULL)