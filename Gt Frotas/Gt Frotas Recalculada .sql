SELECT  
    EMPRESA, 
    HAS_DATA, 
    VEI_IDENTIFICACAO_EMPRESA AS Prefixo, 

    -- Comparação de Litros
    ROUND(HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES, 1) AS RecalculaLitros, 
    HAS_QTD_LITROS,
    CASE 
        WHEN ABS(ROUND(HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES, 1) - HAS_QTD_LITROS) > 0.1 THEN 'Erro Litros'
        ELSE 'OK'
    END AS Status_Litros,

    -- Comparação de KM
    (HAS_ODOMETRO - KM_ANT) AS RecalculaKm, 
    KM_PERCO, 
    CASE 
        WHEN ABS((HAS_ODOMETRO - KM_ANT) - KM_PERCO) > 0.1 THEN 'Erro KM'
        ELSE 'OK'
    END AS Status_KM,

    -- Colunas de apoio
    KM_ANT, 
    HAS_ODOMETRO,  
    HAS_ENCERRANTE_ANTES, 
    HAS_ENCERRANTE_DEPOIS

FROM fact_vwpbi_abast_gtfrota  
WHERE HAS_DATA >= '2025-01-01 00:00:00' 
ORDER BY HAS_DATA ASC;
