SELECT
    tipo_mes,
    AVG(total_transacoes) AS media_transacoes
FROM (
    SELECT
        YEAR(f.data_transacao) AS ano,
        MONTH(f.data_transacao) AS mes,
        CASE 
            WHEN MONTH(f.data_transacao) % 2 = 0 THEN 'Mes Par'
            ELSE 'Mes Impar'
        END AS tipo_mes,
        COUNT(f.cod_transacao) AS total_transacoes
    FROM fato_transacoes f
    WHERE f.IsOutlier = 0
      AND NOT (YEAR(f.data_transacao) = 2022 AND MONTH(f.data_transacao) = 12)
    GROUP BY YEAR(f.data_transacao), MONTH(f.data_transacao)
) AS transacoes_por_mes
GROUP BY tipo_mes
ORDER BY tipo_mes;
