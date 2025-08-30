-- Encontra a última data disponível (ignorando outliers)
DECLARE @ultima_data DATETIME;

SELECT @ultima_data = MAX(data_transacao)
FROM fato_transacoes
WHERE IsOutlier = 0;

-- Consulta de transações por agência nos últimos 6 meses
SELECT 
    ag.cod_agencia,
    ag.nome AS nome_agencia,
    COUNT(f.cod_transacao) AS total_transacoes,
    SUM(f.valor_transacao) AS valor_total_transacoes
FROM fato_transacoes f
JOIN dim_contas c ON f.cod_conta = c.cod_conta
JOIN dim_agencias ag ON c.cod_agencia = ag.cod_agencia
WHERE f.IsOutlier = 0
  AND f.data_transacao >= DATEADD(MONTH, -6, @ultima_data)
GROUP BY ag.cod_agencia, ag.nome
ORDER BY total_transacoes DESC;
