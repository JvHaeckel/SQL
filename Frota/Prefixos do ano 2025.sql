-- Amostra de dados
SELECT * 
FROM fact_vwpbi_abastecimento_detalhado;

-- PREFIXO distintos para o ano 2025
SELECT DISTINCT PREFIXO 
FROM fact_vwpbi_abastecimento_detalhado 
WHERE data >= '2025-01-01' AND data < '2026-01-01';

-- Contagem de PREFIXO distintos na tabela toda
SELECT COUNT(DISTINCT PREFIXO) FROM fact_vwpbi_abastecimento_detalhado;