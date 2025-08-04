-- Tabela Globus que detalha os erros referentes a Km numa coluna chamada de DivergenciaKM

SELECT 
    EMPRESA, DATA, PREFIXO, KMPERCORRIDO,
    ROUND((HODFINALVELOC - HODINICIALVELOC),3) AS RecalKmPercorrido,
    
    CASE 
        WHEN ROUND((HODFINALVELOC - HODINICIALVELOC),3) <> KMPERCORRIDO THEN 'ERRO'
        ELSE ''
    END AS DivergenciaKM,

    LITROS, CONSUMO, TIPO_FROTA, VALOR, LINHA

FROM fact_vwpbi_abastecimento_detalhado  WHERE DATA >= '2025-01-01 00:00:00' 
ORDER BY DATA ASC;