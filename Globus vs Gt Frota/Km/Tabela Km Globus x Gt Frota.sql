-- Tabela Km Globus x Gt Frota feita com aux Ch
SELECT
    g.DATA AS Data,
    f.EMPRESA AS Empresa,
    f.Prefixo AS Prefixo,
    g.KMPERCORRIDO AS `Km Globus`,
    f.RecalculaKm AS `Km Gt Frota`,
    (g.KMPERCORRIDO - f.RecalculaKm) AS `Diferença(Km Globus - Km Gt Frota)`
FROM fact_vwpbi_abast_gtfrota f
INNER JOIN Globus g
    ON f.EMPRESA = g.EMPRESA
   AND f.Prefixo = g.PREFIXO
   AND DATE(f.HAS_DATA) = DATE(g.DATA)
ORDER BY g.DATA, f.EMPRESA, f.Prefixo;
