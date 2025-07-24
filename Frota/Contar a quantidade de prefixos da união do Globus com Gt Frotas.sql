-- Contar a quantidade de prefixos da união do Globus com Gt Frotas no mês de Julho

SELECT COUNT(*) AS QTD_PrefixosUnidos
FROM (
    SELECT Prefixo FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-07-01' AND DATA < '2025-08-01'
    UNION
    SELECT VEI_IDENTIFICACAO_EMPRESA AS Prefixo FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-07-01' AND HAS_DATA < '2025-08-01'
) AS PrefixosUnidos /* Aqui tem a tabela dos prefixos que é sobrescrita pelo ALias QTD_PrefixosUnidos*/

-- WHERE Prefixo NOT IN ( SELECT PREFIXOVEIC FROM fact_vwpbi_frota);