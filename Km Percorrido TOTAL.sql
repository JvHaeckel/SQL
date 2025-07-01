-- Soma do Km Percorrido TOTAL :

select sum(KMPERCORRIDO) as Soma FROM fact_vwpbi_abastecimento_detalhado
WHERE DATA >= '2025-01-01 00:00:00'  AND DATA < '2026-01-01 00:00:00';
