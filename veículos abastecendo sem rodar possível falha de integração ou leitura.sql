-- veículos abastecendo sem rodar possível falha de integração ou leitura
SELECT 
  EMPRESA,  PREFIXO,
  COUNT(*) AS Abastecimentos_KmZero, /* Quantas vezes o veículo abasteceu sem rodar*/
  MIN(DATA) AS primeiro_registro,   /*  Elas mostram o intervalo de tempo em que esses abastecimentos sem deslocamento ocorreram*/
  MAX(DATA) AS ultimo_registro      /* MIN(DATA) → primeira vez que o veículo abasteceu com KM zerado*/
                                    /* MAX(DATA) → última vez que isso ocorreu */
FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00' AND KMPERCORRIDO = 0
GROUP BY EMPRESA,  PREFIXO
HAVING COUNT(*) >= 2     /* Só quero ver os veículos que abasteceram com KM = 0 2 ou mais vezes" */

ORDER BY Abastecimentos_KmZero DESC;