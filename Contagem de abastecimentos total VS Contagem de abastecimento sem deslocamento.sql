-- Contagem de abastecimentos total VS Contagem de abastecimento sem deslocamento

-- CTE (Common Table Expression) para calcular os abastecimentos sem deslocamento
WITH Abas_Sem_Deslocamento AS (
    SELECT 
        EMPRESA,
        PREFIXO,
        COUNT(*) AS Qtd_Abastecimentos_Sem_Deslocamento  -- Conta o número de registros (abastecimentos) por prefixo
    FROM 
        fact_vwpbi_abastecimento_detalhado
    WHERE 
        DATA >= '2025-01-01 00:00:00'    -- Considera apenas dados de 2025 em diante
        AND KMPERCORRIDO = 0             -- Apenas abastecimentos sem deslocamento
        AND LITROS > 0                   -- Apenas abastecimentos com volume real de combustível
    GROUP BY 
        EMPRESA, PREFIXO                 -- Agrupa por empresa e prefixo do veículo
),

-- Segunda CTE para calcular o total de abastecimentos (com ou sem deslocamento)
Abas_Totais AS (
    SELECT 
        EMPRESA,
        PREFIXO,
        COUNT(*) AS Qtd_Abastecimentos   -- Conta o total de abastecimentos por prefixo
    FROM  
        fact_vwpbi_abastecimento_detalhado
    WHERE 
        DATA >= '2025-01-01 00:00:00'    -- Mesmo filtro de data para garantir consistência
    GROUP BY  
        EMPRESA, PREFIXO                 -- Agrupamento igual ao anterior
)

-- Consulta final que junta as duas CTEs
SELECT 
    T.EMPRESA,
    T.PREFIXO,
    T.Qtd_Abastecimentos,                                 -- Total de abastecimentos (com ou sem deslocamento)
    
    -- Usa COALESCE para garantir que, se não houver registro de abastecimento sem deslocamento, exiba 0
    COALESCE(S.Qtd_Abastecimentos_Sem_Deslocamento, 0) AS Qtd_Abastecimentos_Sem_Deslocamento

FROM 
    Abas_Totais T    -- Tabela principal com os totais

-- LEFT JOIN: mantém todos os prefixos que tiveram qualquer abastecimento,
-- mesmo que não tenham nenhum abastecimento sem deslocamento
LEFT JOIN 
    Abas_Sem_Deslocamento S
    ON T.EMPRESA = S.EMPRESA AND T.PREFIXO = S.PREFIXO   -- Junção pelos mesmos identificadores

ORDER BY 
    T.EMPRESA, T.Qtd_Abastecimentos DESC;   -- Ordena por empresa e quantidade total de abastecimentos (do maior para o menor)
