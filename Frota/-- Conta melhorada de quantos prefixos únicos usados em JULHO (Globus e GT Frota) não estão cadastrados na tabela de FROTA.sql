-- Conta melhorada de quantos prefixos únicos usados em JULHO (Globus e GT Frota) não estão cadastrados na tabela de FROTA

SELECT COUNT(DISTINCT TRIM(Prefixos.PREFIXO)) AS QtdDivergentes
FROM (
    -- União dos prefixos de Globus
    SELECT DISTINCT PREFIXO FROM fact_vwpbi_abastecimento_detalhado
    WHERE DATA >= '2025-07-01' AND DATA < '2025-08-01'
    
    UNION
    
    -- União dos prefixos de GT Frota
    SELECT DISTINCT VEI_IDENTIFICACAO_EMPRESA AS PREFIXO FROM fact_vwpbi_abast_gtfrota
    WHERE HAS_DATA >= '2025-07-01' AND HAS_DATA < '2025-08-01' 
) AS Prefixos

-- Junta com a tabela de frota, limpando espaços com TRIM
LEFT JOIN fact_vwpbi_frota f ON TRIM(Prefixos.PREFIXO) = TRIM(f.PREFIXOVEIC) AND CONDICAO = 'Ativo'

-- Filtro: queremos apenas os prefixos que NÃO estão na frota
WHERE f.PREFIXOVEIC IS NULL;