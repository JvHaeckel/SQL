-- Exibir linhas com Abastecimento Duplicado Globus
/* Ele só fez até dia 29 mas meu BI mostra que teve mais 3 casos*/
SELECT 
    DATA, 
    PREFIXO, 
    LITROS, 
    COUNT(*) AS QTD
FROM fact_vwpbi_abastecimento_detalhado
WHERE DATA >= '2025-01-01 00:00:00' and DATA < '2026-01-01 00:00:00'
GROUP BY DATA, PREFIXO, LITROS
HAVING QTD > 1
ORDER BY PREFIXO, DATA, LITROS;
