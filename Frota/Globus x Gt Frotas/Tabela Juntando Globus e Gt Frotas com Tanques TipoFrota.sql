-- Juntando Globus e Gt Frotas e gerando os Prefixos comuns com os Tanques e Tipo Frota
SELECT 
    d.Prefixo,      -- Seleciona a coluna Prefixo do resultado do primeiro subquery (apelidado como d)
    d.Tipo_Frota,   -- Seleciona a coluna Tipo_Frota agregada do subquery d
    d.Empresa,      -- Seleciona a coluna Empresa do primeiro subquery (d)
    g.Tanque        -- Seleciona a coluna Tanque do segundo subquery (g)
FROM (
    SELECT           -- Subquery d: obtém prefixos distintos, associa empresa e agrega o tipo de frota
        PREFIXO AS Prefixo,       
        MAX(CASE WHEN EMPRESA = 21 THEN 'Sao Paulo'    
                 WHEN EMPRESA = 27 THEN 'Pernambuco'    
                 ELSE 'Outra' END) AS Empresa,
        MAX(TIPO_FROTA) AS Tipo_Frota                  -- Agrega TIPO_FROTA para cada PREFIXO
    FROM fact_vwpbi_abastecimento_detalhado  WHERE DATA >= '2025-01-01 00:00:00'                 
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
