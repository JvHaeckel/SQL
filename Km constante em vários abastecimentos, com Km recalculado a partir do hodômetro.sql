-- Km constante em vários abastecimentos, com Km recalculado a partir do hodômetro
SELECT
    EMPRESA, PREFIXO, 
    COUNT(*) AS Qtd_Abastecimentos, -- Conta o número total de abastecimentos feitos por cada veículo (com base em EMPRESA + PREFIXO).
    MIN(DATA) AS Data_Inicial, /* Pega a primeira e a última data de abastecimento no período analisado, por veículo.
                                Isso ajuda a entender por quanto tempo o KM ficou inalterado. */
    MAX(DATA) AS Data_Final,
    MIN(HODFINALVELOC - HODINICIALVELOC) AS KM_Percorrido_Recalculado_Min,
    MAX(HODFINALVELOC - HODINICIALVELOC) AS KM_Percorrido_Recalculado_Max,
    MIN(HODINICIALVELOC) AS HodometroInicial_Min,
    MAX(HODFINALVELOC) AS HodometroFinal_Max
    
FROM fact_vwpbi_abastecimento_detalhado  
WHERE DATA >= '2025-01-01 00:00:00' 
GROUP BY EMPRESA, PREFIXO
HAVING 
    COUNT(DISTINCT (HODFINALVELOC - HODINICIALVELOC)) = 1 -- o Km recalculado foi sempre o mesmo (suspeito).
    AND COUNT(*) > 1                 -- mais de um abastecimento
    
    /* Essa consulta serve para identificar veículos que abasteceram várias vezes, mas o Km recalculado
    a partir do hodômetro nunca mudou, o que é um comportamento atípico e pode indicar:
            Falha na captura automática do KM;
            KM não atualizado corretamente;
            Problema na integração entre sistemas. */
