-- Comparar a quantidade de prefixos da união do Globus com Gt Frotas no mês de Julho com Frotas

SELECT PREFIXO FROM (
    SELECT Prefixo FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-07-01' AND DATA < '2025-08-01'
    UNION
    SELECT VEI_IDENTIFICACAO_EMPRESA AS Prefixo FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-07-01' AND HAS_DATA < '2025-08-01'
    
) AS PrefixosUnidos 

WHERE PREFIXO NOT IN ( SELECT PREFIXOVEIC FROM fact_vwpbi_frota);