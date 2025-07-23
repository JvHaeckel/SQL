-- Seleciona os dados finais com a contagem de abastecimentos totais e sem deslocamento
SELECT 
    T.EMPRESA,  T.PREFIXO,   T.Qtd_Abastecimentos,  
     -- Se não houver abastecimento sem deslocamento, exibe 0 em vez de NULL
    COALESCE(S.Qtd_Abastecimentos_Sem_Deslocamento, 0) AS Qtd_Abastecimentos_Sem_Deslocamento

FROM 
    (-- Subquery que calcula o total de abastecimentos por EMPRESA e PREFIXO
        SELECT 
            EMPRESA, PREFIXO,
            COUNT(*) AS Qtd_Abastecimentos  -- Conta o número total de registros de abastecimento
        FROM  fact_vwpbi_abastecimento_detalhado
        WHERE DATA >= '2025-01-01 00:00:00'  -- Considera apenas abastecimentos a partir de 2025
        GROUP BY  EMPRESA, PREFIXO  -- Agrupa por empresa e prefixo do veículo
    ) T  -- Nomeamos essa subquery como T (de Totais)

LEFT JOIN    -- LEFT JOIN: junta a subquery T com os dados de abastecimentos SEM deslocamento
    ( -- Subquery que calcula abastecimentos onde o veículo não rodou (KMPERCORRIDO = 0)
        SELECT 
            EMPRESA, PREFIXO,
            COUNT(*) AS Qtd_Abastecimentos_Sem_Deslocamento  -- Conta apenas abastecimentos sem deslocamento
        FROM fact_vwpbi_abastecimento_detalhado
        WHERE 
	        DATA >= '2025-01-01 00:00:00'  
            AND KMPERCORRIDO = 0           -- Veículo não percorreu distância
            AND LITROS > 0                 -- Considera apenas abastecimentos com volume real
        GROUP BY 
            EMPRESA, PREFIXO  -- Agrupa por empresa e veículo
    ) S  -- Nomeamos essa subquery como S (de Sem deslocamento)

-- Junta as duas tabelas (T e S) usando EMPRESA e PREFIXO como chave
ON T.EMPRESA = S.EMPRESA AND T.PREFIXO = S.PREFIXO

ORDER BY  -- Ordena o resultado pela empresa e pelo total de abastecimentos (do maior para o menor)
    T.EMPRESA, 
    T.Qtd_Abastecimentos DESC;