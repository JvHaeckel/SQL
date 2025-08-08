-- Juntando Globus e Gt Frotas e gerando os Prefixos comuns com os Tanques
SELECT 
    d.Prefixo,      -- Seleciona a coluna Prefixo do resultado do primeiro subquery (apelidado como d)
    d.Empresa,      -- Seleciona a coluna Empresa do primeiro subquery (d)
    g.Tanque        -- Seleciona a coluna Tanque do segundo subquery (g)
FROM (
    SELECT           -- Subquery d: obtém prefixos distintos e associa uma empresa baseada no código
        PREFIXO AS Prefixo,       
        MAX(CASE WHEN EMPRESA = 21 THEN 'Sao Paulo'    
                 WHEN EMPRESA = 27 THEN 'Pernambuco'    
                 ELSE 'Outra' END) AS Empresa           
    FROM fact_vwpbi_abastecimento_detalhado    WHERE DATA >= '2025-01-01 00:00:00'                 
    GROUP BY PREFIXO                                 -- Agrupa por PREFIXO para garantir prefixos distintos
) d
INNER JOIN (
    SELECT  -- Subquery g: obtém prefixos distintos com o limite de abastecimento (tanque) da frota
        VEI_IDENTIFICACAO_EMPRESA AS Prefixo,           -- Seleciona identificação da empresa, renomeada para Prefixo
        MAX(VEI_LIMITE_ABASTECIMENTO) AS Tanque         -- Pega o valor máximo do limite de abastecimento para cada prefixo
    FROM fact_vwpbi_abast_gtfrota  WHERE HAS_DATA >= '2025-01-01 00:00:00'             
    GROUP BY VEI_IDENTIFICACAO_EMPRESA                   -- Agrupa por prefixo para garantir prefixos distintos
) g
    ON d.Prefixo = g.Prefixo                            -- Junta os dois subqueries com base no prefixo igual
ORDER BY d.Prefixo;                                     -- Ordena o resultado final pelo prefixo em ordem crescente
