/* Unir os prefixos do Abastecimento detalhado e do Gt Frotas e comparar com os Prefixos Frota*/
select Prefixo from (

select Prefixo AS Prefixo from fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00'
UNION
select VEI_IDENTIFICACAO_EMPRESA AS Prefixo FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-01-01 00:00:00'

) AS Prefixos_combinados

WHERE Prefixo NOT IN ( SELECT PREFIXOVEIC FROM fact_vwpbi_frota);
