SELECT f.nome_transacao, COUNT(*) AS qtd_transacoes, SUM(valor_transacao) AS total_valor
FROM fato_transacoes f
GROUP BY f.nome_transacao
ORDER BY total_valor DESC;
