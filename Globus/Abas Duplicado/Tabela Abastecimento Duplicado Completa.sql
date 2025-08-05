-- Exibir todas as linhas completas com Abastecimento Duplicado no Globus
-- Identifica duplicados
WITH duplicados AS (
    SELECT EMPRESA, DATE(DATA) AS DATA_DIA, PREFIXO, LITROS
    FROM fact_vwpbi_abastecimento_detalhado
    WHERE DATA >= '2025-01-01 00:00:00' AND LITROS >= 0.01
    GROUP BY EMPRESA, DATE(DATA), PREFIXO, LITROS
    HAVING COUNT(*) >= 2
)

-- Busca todas as linhas completas que batem com os duplicados
SELECT f.EMPRESA, f.DATA, f.PREFIXO, f.LITROS
FROM fact_vwpbi_abastecimento_detalhado f
JOIN duplicados d
  ON f.EMPRESA = d.EMPRESA
 AND DATE(f.DATA) = d.DATA_DIA
 AND f.PREFIXO = d.PREFIXO
 AND f.LITROS = d.LITROS
WHERE f.DATA >= '2025-01-01 00:00:00' AND f.LITROS >= 0.01
ORDER BY f.LITROS DESC;
