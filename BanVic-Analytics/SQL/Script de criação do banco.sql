USE [DW_banvic_dev]
GO
/****** Object:  Table [dbo].[colaborador_agencia]    Script Date: 30/08/2025 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[colaborador_agencia](
	[cod_colaborador] [int] NOT NULL,
	[cod_agencia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_colaborador] ASC,
	[cod_agencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_agencias]    Script Date: 30/08/2025 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_agencias](
	[cod_agencia] [int] NOT NULL,
	[endereco] [nvarchar](300) NULL,
	[cidade] [nvarchar](100) NULL,
	[uf] [nvarchar](2) NULL,
	[data_abertura] [date] NULL,
	[tipo_agencia] [nvarchar](50) NULL,
	[nome] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_agencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_clientes]    Script Date: 30/08/2025 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_clientes](
	[cod_cliente] [int] NOT NULL,
	[primeiro_nome] [varchar](100) NULL,
	[ultimo_nome] [varchar](100) NULL,
	[email] [varchar](150) NULL,
	[tipo_cliente] [varchar](50) NULL,
	[data_inclusao] [date] NULL,
	[cpf_cnpj] [varchar](20) NULL,
	[data_nascimento] [date] NULL,
	[endereco] [varchar](255) NULL,
	[cep] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_colaboradores]    Script Date: 30/08/2025 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_colaboradores](
	[cod_colaborador] [int] NOT NULL,
	[primeiro_nome] [varchar](100) NULL,
	[ultimo_nome] [varchar](100) NULL,
	[email] [varchar](150) NULL,
	[cpf] [varchar](15) NULL,
	[data_nascimento] [date] NULL,
	[endereco] [varchar](255) NULL,
	[cep] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_colaborador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_contas]    Script Date: 30/08/2025 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_contas](
	[cod_conta] [int] NOT NULL,
	[num_conta] [int] NULL,
	[cod_agencia] [int] NULL,
	[cod_colaborador] [int] NULL,
	[tipo_conta] [varchar](10) NULL,
	[data_abertura] [datetime] NULL,
	[saldo_total] [decimal](18, 2) NULL,
	[saldo_disponivel] [decimal](18, 2) NULL,
	[data_ultimo_lancamento] [datetime] NULL,
 CONSTRAINT [PK_dim_contas] PRIMARY KEY CLUSTERED 
(
	[cod_conta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_cotacao_dolar_nova]    Script Date: 30/08/2025 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_cotacao_dolar_nova](
	[data] [date] NOT NULL,
	[cotacao_venda] [decimal](18, 4) NULL,
PRIMARY KEY CLUSTERED 
(
	[data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_data]    Script Date: 30/08/2025 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_data](
	[data] [date] NOT NULL,
	[ano] [int] NULL,
	[mes] [int] NULL,
	[nome_mes] [varchar](20) NULL,
	[dia] [int] NULL,
	[dia_semana] [int] NULL,
	[nome_dia_semana] [varchar](20) NULL,
	[trimestre] [int] NULL,
	[semestre] [int] NULL,
	[eh_final_de_semana] [bit] NULL,
	[eh_dia_util] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_propostas_raw]    Script Date: 30/08/2025 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_propostas_raw](
	[cod_proposta] [varchar](50) NOT NULL,
	[cod_cliente] [int] NULL,
	[data_entrada_proposta] [varchar](max) NULL,
	[taxa_juros_mensal] [varchar](max) NULL,
	[valor_proposta] [varchar](max) NULL,
	[valor_financiamento] [varchar](max) NULL,
	[valor_entrada] [varchar](max) NULL,
	[valor_prestacao] [varchar](max) NULL,
	[quantidade_parcelas] [varchar](max) NULL,
	[carencia] [varchar](max) NULL,
	[status_proposta] [varchar](max) NULL,
	[cod_colaborador] [int] NULL,
	[taxa_juros_mensal_decimal] [decimal](18, 6) NULL,
	[data_entrada_date] [date] NULL,
 CONSTRAINT [PK_dim_propostas_raw] PRIMARY KEY CLUSTERED 
(
	[cod_proposta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fato_transacoes]    Script Date: 30/08/2025 13:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fato_transacoes](
	[cod_transacao] [int] NOT NULL,
	[num_conta] [int] NULL,
	[data_transacao] [datetime2](6) NULL,
	[data_key] [date] NULL,
	[nome_transacao] [varchar](100) NULL,
	[valor_transacao] [decimal](18, 2) NULL,
	[cod_conta] [int] NULL,
	[IsOutlier] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_transacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[colaborador_agencia]  WITH CHECK ADD FOREIGN KEY([cod_agencia])
REFERENCES [dbo].[dim_agencias] ([cod_agencia])
GO
ALTER TABLE [dbo].[colaborador_agencia]  WITH CHECK ADD FOREIGN KEY([cod_colaborador])
REFERENCES [dbo].[dim_colaboradores] ([cod_colaborador])
GO
ALTER TABLE [dbo].[dim_propostas_raw]  WITH CHECK ADD  CONSTRAINT [FK_dim_propostas_raw_cliente] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[dim_clientes] ([cod_cliente])
GO
ALTER TABLE [dbo].[dim_propostas_raw] CHECK CONSTRAINT [FK_dim_propostas_raw_cliente]
GO
ALTER TABLE [dbo].[dim_propostas_raw]  WITH CHECK ADD  CONSTRAINT [FK_dim_propostas_raw_colaborador] FOREIGN KEY([cod_colaborador])
REFERENCES [dbo].[dim_colaboradores] ([cod_colaborador])
GO
ALTER TABLE [dbo].[dim_propostas_raw] CHECK CONSTRAINT [FK_dim_propostas_raw_colaborador]
GO
ALTER TABLE [dbo].[fato_transacoes]  WITH CHECK ADD FOREIGN KEY([data_key])
REFERENCES [dbo].[dim_data] ([data])
GO
ALTER TABLE [dbo].[fato_transacoes]  WITH CHECK ADD  CONSTRAINT [FK_fato_contas] FOREIGN KEY([cod_conta])
REFERENCES [dbo].[dim_contas] ([cod_conta])
GO
ALTER TABLE [dbo].[fato_transacoes] CHECK CONSTRAINT [FK_fato_contas]
GO
