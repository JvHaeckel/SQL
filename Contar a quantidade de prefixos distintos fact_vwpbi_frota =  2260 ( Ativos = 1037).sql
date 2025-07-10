-- Contar a quantidade de prefixos distintos fact_vwpbi_frota =  2260 ( Ativos = 1037)
SELECT COUNT(DISTINCT PREFIXOVEIC) AS Prefixos   FROM fact_vwpbi_frota
 WHERE CONDICAO = 'Inativo' ;
