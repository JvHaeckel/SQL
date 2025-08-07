-- Selecionando tudo da tabela Gt Frota para o ano de 2025
SELECT * FROM fact_vwpbi_abast_gtfrota where HAS_DATA >= '2025-01-01 00:00:00' and HAS_DATA < '2026-01-01  00:00:00';
