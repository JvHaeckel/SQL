-- Soma do Km tanto para o KmPercorrido quanto para o Km Recalculado e a diferença entre eles

SELECT 
    ROUND(SUM(HODFINALVELOC - HODINICIALVELOC),3) AS KmRecalculado,       -- Km Recalculado (soma linha a linha da diferença entre HOD Final e HOD Inicial)
    ROUND(SUM(KMPERCORRIDO),3) AS KmPercorrido,                           -- Km Percorrido (soma dos valores registrados em KMPERCORRIDO)
    ROUND(SUM(HODFINALVELOC - HODINICIALVELOC) - SUM(KMPERCORRIDO),3) AS Diferenca  -- Diferença entre o Km Recalculado e o Km Percorrido
FROM fact_vwpbi_abastecimento_detalhado 
WHERE DATA >= '2025-01-01 00:00:00';


/* 07/08 => 34100130.246 - 34440130.246 =  340 000
18/08 => 35.531.838.021- 35.881.838.021 = 350.000*/