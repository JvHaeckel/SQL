/* Pegando os Prefixos de Gt Frotas que não estão em Frotas*/

SELECT DISTINCT PREFIXOVEIC AS Prefixo
FROM fact_vwpbi_frota
WHERE PREFIXOVEIC NOT IN (
    SELECT DISTINCT VEI_IDENTIFICACAO_EMPRESA
    FROM fact_vwpbi_abast_gtfrota
);
