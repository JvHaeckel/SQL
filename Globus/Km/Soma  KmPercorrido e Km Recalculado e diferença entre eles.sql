-- Soma do Km tanto para o KmPercorrido tanto para o Km Recalculado e a diferença entre eles

SELECT 
ROUND(SUM(HODFINALVELOC - HODINICIALVELOC),3) AS KmRecalculado,                            -- Km Recalculado
ROUND(SUM(KMPERCORRIDO),3) AS KmPercorrido,                                                -- Km Percorrido
(ROUND(SUM(HODFINALVELOC - HODINICIALVELOC),3) - ROUND(SUM(KMPERCORRIDO),3)) AS Diferença  -- Diferença entre eles 

FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00'

/* 07/08 => 34100130.246 - 34440130.246 =  340 000*/