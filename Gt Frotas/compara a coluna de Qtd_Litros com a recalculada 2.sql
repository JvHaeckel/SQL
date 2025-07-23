--  Gera coluna que compara a coluna de Qtd_Litros com a recalculada 2
/* Calcular novamente a difereça entre o encerrante antes e depois para
saber se o valor bate com HAS_QTD_LITROS*/
SELECT 
VEI_IDENTIFICACAO_EMPRESA AS PREFIXO, 
HAS_DATA AS DATA , HAS_QTD_LITROS,
ABS(HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES) AS Recalcula_QTD_LITROS,

CASE 
when ABS(HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES) <> HAS_QTD_LITROS then 'ERRO'      -- Não pode usar alias QTD_LITROS
else ''
end as Verifica_QTD_LITROS

from fact_vwpbi_abast_gtfrota where HAS_DATA >= '2025-01-01  00:00:00';