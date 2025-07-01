-- Selecionando tudo da tabela Gt Frota para o ano de 2025
SELECT * FROM fact_vwpbi_abast_gtfrota where HAS_DATA >= '01-01-2025' and HAS_DATA < '01-01-2026';

SELECT * FROM fact_vwpbi_abast_gtfrota
WHERE HAS_DATA >= '2025-01-01' AND HAS_DATA < '2026-01-01';
