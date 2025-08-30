📊 BV – Criação de DW e análises

Este projeto tem como objetivo realizar a análise de dados do Banco BanVic, respondendo as principais perguntas de negócio e construindo um dashboard interativo no Power BI com os KPIs mais relevantes.



📌 Objetivos do Projeto

Criar um Data Warehouse com tabelas fato e dimensão.

Responder às principais dúvidas de negócio, como:

Desempenho por agência.

Verificar se existe sazonalidade.

Valor médio das transações.

Total de transações por tipo de conta.



Desenvolver um dashboard interativo com filtros por:

Data

Agência

Cotação do dólar

Faixa etária dos clientes



🛠️ Tecnologias Utilizadas

SQL Server → Modelagem e consultas no Data Warehouse

Power BI → Criação de dashboard e KPIs

DAX → Medidas para cálculos e análises



📂 Estrutura do Projeto

/BanVic-Analytics
│── /data               # Dados brutos
│── /data/DadosTratados # Dados tratados
│── /sql                # Scripts de criação e algumas consultas
|── /docs               # Relatório Analítico e Manual dos Dados
│── /dashboard          # Arquivo .pbix do Power BI
│── /imagens            # prints do dashboard interativo e de consultas no banco
│── README.md           # Documentação do projeto



📊 Principais KPIs

✅ Total de transações

✅ Volume de transações por tipo (TED, DOC, Pix etc.)

✅ Média de valor das transações (mensal/par x ímpar)

✅ Transações por agência



📸 Dashboard (Power BI)

<img src="BanVic-Analytics/Imagens/banvic dashboard 1.png" alt="Dashboard" width="600"/>

<img src="BanVic-Analytics/Imagens/banvic dashboard 1.png" alt="Dashboard" width="600"/>

<img src="BanVic-Analytics/Imagens/banvic dashboard 1.png" alt="Dashboard" width="600"/>





🚀 Como Executar o Projeto

Clone este repositório:

git clone (https://github.com/Fer-Dittert/Relatorio-Analitico-BV.git)



Configure o banco de dados SQL Server com os scripts na pasta /sql e insira os dados tratados.

Abra o arquivo BanVic\_Dashboard.pbix no Power BI Desktop.

Explore os KPIs e análises interativas.







📌Transformações Feitas: 



Tratamento para popular a tabela de cotação do dólar, algumas datas vieram com hora e milissegundos, e algumas cotações estavam com mais casas decimais que outras.  



Modificação de todas as tabelas para utf8, reconhecimento de aspas como delimitador dos endereços e converter os datatypes na hora de popular as tabelas. 



Tabela ‘transação’ precisou mudar o formato da data (feito direto no csv removendo UTC com localizador global e removendo os milissegundos . 



Dezembro de 2022, reconhecido como outlier e tratado com remoção direta. 



Tabela ‘contas’ estava com o cod\_cliente errado. 



Na tabela de propostas, correção do formato(casa decimal) de todos os valores. 



Tratamento do cliente que possui código 528 mas não existe na tabela de clientes mas existia na tabela de propostas, precisou ser removido para as analises, já que não temos os dados dele mais, apenas o registro das propostas. 



Alteradas as colunas de data/hora para data no bigquery. 



Alterado o formato dos valores monetários de todas as tabelas no bigquery e o formato da taxa de juros. 



Modificação de alguns nomes de linhas para melhorar o visual(bigquery). 









📌 Resultados rápidos (para análise completa verificar Relatório na pasta Docs)





Análises Volume e Valor de Transações:

Mais frequentes: Compras (crédito e débito).

Menos frequentes, mas de alto impacto: TED e DOC recebidos.

Volume alto não significa impacto financeiro alto. Transações raras podem representar grandes movimentações de recursos.





Perfil dos Clientes:

Idades entre 18 e 83 anos. Concentração em 34 anos e 70 anos.





Distribuição por agência

Agência Digital concentra o maior volume de transações, Recife e Florianópolis têm menor movimento.



 

Tipos de contas

Contas digitais movimentam mais transações que contas tradicionais.





Concentração de clientes

PF predominam, presença significativa de idosos (60+).



&nbsp;













