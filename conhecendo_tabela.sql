#Verificar quantidade de regitros
SELECT ano, count(*) AS total_resgistros
FROM basedosdados.br_mdr_snis.prestador_agua_esgoto
GROUP BY ano
ORDER BY ano DESC;

# Verificar se existe dados suficiêntes para fazer analise em nivel nacional
SELECT ano, COUNT(DISTINCT id_municipio) AS qtde_municipios, COUNT(DISTINCT sigla_uf) AS qtde_estados
FROM basedosdados.br_mdr_snis.prestador_agua_esgoto
WHERE ANO > 2012
GROUP BY ano
ORDER BY ano DESC; #dados abrangem todos os estados brasileiro, e um numero significativo de municipios

# verificar nulos nas principais colunas
SELECT 
  ano,
  COUNTIF(populacao_atendida_agua IS NULL) AS nulos_agua,
  COUNTIF(populacao_atentida_esgoto IS NULL) AS nulos_esgoto,
  COUNTIF(extensao_rede_agua IS NULL) AS nulos_extensao_agua,
  COUNTIF(extensao_rede_esgoto IS NULL) AS nulos_extensao_esgoto
FROM basedosdados.br_mdr_snis.prestador_agua_esgoto
WHERE ANO > 2012
GROUP BY ano
ORDER BY ano DESC;

# identificar amostragem de valores nulos
SELECT *
FROM basedosdados.br_mdr_snis.prestador_agua_esgoto
WHERE populacao_atendida_agua IS NULL
LIMIT 5;

# amostragem analisar detalhes da linhas com valores nulos
SELECT *
FROM basedosdados.br_mdr_snis.prestador_agua_esgoto
WHERE ano = 2021 AND id_municipio = '2910859' 
ORDER BY ano DESC 
LIMIT 5; # em alguns muncipios esgoto e aguas possuem pretadores de serviços diferente

