-- Contar a quantidade de abasteciemtos sem deslocamento Globus
SELECT 
    EMPRESA, PREFIXO,
    COUNT(*) AS Qtd_Abas_Sem_Deslocamento

FROM  fact_vwpbi_abastecimento_detalhado

WHERE  DATA >= '2025-01-01 00:00:00'
    AND KMPERCORRIDO = 0
    AND LITROS > 0
GROUP BY EMPRESA, PREFIXO
ORDER BY EMPRESA, Qtd_Abas_Sem_Deslocamento DESC;