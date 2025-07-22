-- Tabela Consumo Prefixo Abas sem Deslocamento Gt Frota 
/* Globus: soma dos litros dos Prefixos que mais/menos abasteceram sem deslocamento listados */
SELECT 
   VEI_IDENTIFICACAO_EMPRESA AS PREFIXO,
    ROUND(SUM(HAS_QTD_LITROS),2) AS Total_Litros  /* O round precisa vir antes da operação de soma*/
FROM fact_vwpbi_abast_gtfrota
WHERE 
    HAS_DATA >= '2025-01-01 00:00:00' && KM_PERCO = 0 && HAS_QTD_LITROS >= 0.01
GROUP BY VEI_IDENTIFICACAO_EMPRESA