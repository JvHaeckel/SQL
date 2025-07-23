-- Listagem de Prefixos que abasteceram sem rodar mais de uma vez Globus
-- Abastecimento sem rodar possível falha de integração ou leitura
SELECT 
  EMPRESA,  PREFIXO,
  COUNT(*) AS Abastecimentos_KmZero /* Quantas vezes o veículo abasteceu sem rodar*/
 
FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00' AND KMPERCORRIDO <= 0.002
GROUP BY EMPRESA,  PREFIXO
HAVING COUNT(*) >= 2     /* Só quero ver os veículos que abasteceram com KM = 0 em 2 ou mais vezes" */

ORDER BY Abastecimentos_KmZero DESC;