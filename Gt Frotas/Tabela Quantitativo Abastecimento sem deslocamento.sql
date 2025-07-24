-- Tabela Quantitativo Abastecimento sem deslocamento

-- Seleciona os dados finais com a contagem de abastecimentos totais e sem deslocamento
SELECT 
    T.EMPRESA,  
    T.VEI_IDENTIFICACAO_EMPRESA AS Prefixo,  
    T.Qtd_Abastecimentos,  
    COALESCE(S.Qtd_Abastecimentos_Sem_Deslocamento, 0) AS Qtd_Abastecimentos_Sem_Deslocamento,
    
    -- Percentual de abastecimentos sem deslocamento (evita divisão por zero com NULLIF)
    ROUND(
        COALESCE(S.Qtd_Abastecimentos_Sem_Deslocamento, 0) * 100.0 / NULLIF(T.Qtd_Abastecimentos, 0), 
        1
    ) AS Percentual_Sem_Deslocamento

FROM 
    ( -- Subquery que calcula o total de abastecimentos por EMPRESA e PREFIXO
        SELECT 
            EMPRESA, 
            VEI_IDENTIFICACAO_EMPRESA,
            COUNT(*) AS Qtd_Abastecimentos  -- Conta o número total de registros de abastecimento
        FROM fact_vwpbi_abast_gtfrota
        WHERE HAS_DATA >= '2025-01-01 00:00:00'  -- Considera apenas abastecimentos a partir de 2025
        GROUP BY EMPRESA, VEI_IDENTIFICACAO_EMPRESA
    ) T  -- Nomeamos essa subquery como T (de Totais)

LEFT JOIN
    ( -- Subquery que calcula abastecimentos onde o veículo não rodou (sem deslocamento)
        SELECT 
            EMPRESA, VEI_IDENTIFICACAO_EMPRESA AS Prefixo,
            COUNT(*) AS Qtd_Abastecimentos_Sem_Deslocamento
        FROM fact_vwpbi_abast_gtfrota
        WHERE 
            HAS_DATA >= '2025-01-01 00:00:00'
            AND (HAS_ODOMETRO - KM_ANT) = 0  
            AND ROUND((HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES),2)  > 0   -- Colocar o depois - antes
        GROUP BY EMPRESA, VEI_IDENTIFICACAO_EMPRESA
    ) S  -- Nomeamos essa subquery como S (de Sem deslocamento)

-- Junta as duas tabelas (T e S) usando EMPRESA e PREFIXO como chave
ON T.EMPRESA = S.EMPRESA AND T.VEI_IDENTIFICACAO_EMPRESA = S.Prefixo

-- Ordena o resultado pela empresa e pelo total de abastecimentos (do maior para o menor)
ORDER BY 
    T.EMPRESA, 
    T.Qtd_Abastecimentos DESC;
