-- Contar a quantidade Total abastecimentos sem deslocamento Globus
SELECT 
    COUNT(*) AS Qtd_Abas_Sem_Deslocamento

FROM  fact_vwpbi_abastecimento_detalhado

WHERE  DATA >= '2025-01-01 00:00:00'
    AND KMPERCORRIDO <= 0.002  AND LITROS > 0