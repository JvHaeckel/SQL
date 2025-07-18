-- Tabela Consumo Prefixo Abas sem Deslocamento Globus 
/* Globus: soma dos litros dos Prefixos que mais/menos abasteceram sem deslocamento listados */
SELECT 
   PREFIXO,
    ROUND(SUM(LITROS),2) AS Total_Litros  /* O round precisa vir antes da operação de soma*/
FROM fact_vwpbi_abastecimento_detalhado
WHERE 
    DATA >= '2025-01-01 00:00:00' && KMPERCORRIDO = 0 && LITROS >= 0.01
GROUP BY PREFIXO