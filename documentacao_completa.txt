# Projeto de Análise de Saneamento Básico no Brasil

## Objetivo

Este projeto tem como objetivo analisar a situação do saneamento básico no Brasil entre os anos de 2012 e 2021, com foco em abastecimento de água e esgotamento sanitário. Através da análise de dados públicos, busca-se identificar diferenças regionais e entender a evolução dos serviços.
---

## 1. Coleta de Dados

Foram utilizadas duas fontes públicas:

### 1.1 Base dos Dados – SNIS

- Origem: Plataforma [Base dos Dados](https://basedosdados.org/)
- Fonte: Sistema Nacional de Informações sobre Saneamento (SNIS)
- Acesso: BigQuery
- Tipo de dados: Estruturados (tabela padronizada, acessada via SQL)
- Período analisado: 2012 a 2021

**Colunas utilizadas:**
`ano`, `id_municipio`, `sigla_uf`, `abrangencia`, `tipo_servico`, `natureza_juridica`, `populacao_atendida_agua`, `populacao_atentida_esgoto`, `populacao_urbana`, `populacao_urbana_atendida_agua`, `populacao_urbana_atendida_esgoto`, `extensao_rede_agua`, `extensao_rede_esgoto`, `volume_agua_produzido`, `volume_agua_tratada_eta`, `volume_agua_consumido`, `volume_esgoto_coletado`, `volume_esgoto_tratado`, `quantidade_ligacao_total_agua`, `quantidade_ligacao_total_esgoto`.

> Foi identificada a **ausência de valores para a variável `populacao_urbana` no ano de 2022**, o que motivou a exclusão deste ano da análise.

### 1.2 IBGE – Municípios

- Origem: [www.ibge.gov.br](https://www.ibge.gov.br)
- Tipo de dados: Estruturado (CSV)
- Conteúdo: `Código Município Completo`, `Nome Município`, `UF`, `Região`
- Utilidade: Utilizado para cruzar o código do município com o nome oficial e região, permitindo gráficos e filtros por nome no dashboard.

---

## 2. Limpeza e Preparação dos Dados

A etapa de pré-processamento foi realizada em Python (Google Cloud Notebooks), com os seguintes passos:

- Padronização dos nomes das colunas para minúsculas e sem espaços ou acentos.
- Substituição de valores nulos por zero nas colunas numéricas de serviços.
- Criação de métricas auxiliares como: índices de atendimento, percentuais de cobertura, etc.
- Exclusão de registros com `populacao_urbana` nula (2022).
- Tratamento de inconsistências no campo `tipo_servico` (ex: "esgoto" vs "esgotos").
- Detecção de **outliers esperados** (ex: São Paulo) e verificação de sua representatividade.

---

## 3. Análise Exploratória dos Dados (EDA)

### Verificações em SQL:
- Cobertura nacional confirmada (todos os estados e grande número de municípios).
- Detecção de valores nulos em colunas-chave, tratados com base no contexto dos prestadores de serviço.

### EDA em Python:
- Geração de gráficos (boxplots, correlações).
- Avaliação de distribuição de dados por estado.
- Cálculo de índices de atendimento (água/esgoto vs população urbana).
- Verificação de correlação entre variáveis:
   - Correlação fraca entre `ano` e crescimento dos índices → projeções futuras pouco confiáveis.

---

## 4. Visualização de Dados (Looker Studio)

As visualizações foram feitas no **Looker Studio**, com o objetivo de comunicar os principais achados de forma clara e interativa.

**Link para o dashboard:** https://lookerstudio.google.com/reporting/33dc93d6-4298-4c5a-b961-8f7f69cc77f4

**Gráficos desenvolvidos:**
- Evolução da cobertura de água e esgoto (2012–2021)
- Comparação entre estados e regiões
- Municípios mais defasados em cobertura
- Análise por tipo de prestador e natureza jurídica

---

## 5. Considerações Finais

Os dados demonstram a **urgência de políticas públicas que ampliem o acesso ao saneamento básico**, priorizando regiões e municípios mais vulneráveis.

### Observações:
- A análise identificou **desigualdades regionais marcantes**, especialmente nas regiões Norte e Nordeste.
- A ausência de dados de 2022 e a variação no preenchimento entre os prestadores dificultam a continuidade de análises temporais mais profundas.

---

## 6. Sugestões para ações futuras

- Expandir a análise para áreas rurais;
- Investigar barreiras geográficas à expansão dos serviços;
- Avaliar o desempenho dos prestadores de serviço;
- Focar investimentos em municípios com alta população e baixa cobertura;
- Reforçar a padronização e frequência da publicação dos dados pelo SNIS.

---

## Tecnologias utilizadas

- **SQL** (BigQuery)
- **Python** (Pandas, Seaborn, Scikit-learn)
- **Google Cloud Notebooks**
- **Looker Studio**
- **GitHub**