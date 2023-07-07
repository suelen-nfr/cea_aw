# Certificação em Analytics Engineer 

Repositório para ser utilizado no desafio para a obtenção da certificação de Analytics Engineer by Indicium.

## Instruções

- Clonar o repositório da Adventure Works para a pasta local:

https://github.com/suelen-nfr/cea_aw

- Criar um projeto no BigQuery

- Criar um ambiente virtual dentro do repositório local:

python -m venv venv
source venv/Scripts/activate

- Fazer a instalação dos requirements:

pip install -r requirements.txt

- Rodar o dbt debug

- Rodar o dbt deps

Todas as tabelas do banco fonte do SAP da Adventure Works foram carregadas como seeds pelo dbt. Os arquivos .csv com os dados estão na pasta de seeds.

Para fazer o carregamento de todas as tabelas usar o comando:
- `dbt seed`

Para carregar uma tabela especifíca utilizem o comando
- `dbt seed -s nome_do_csv`

Para incluir o modelos no projeto dentro do BigQuery
dbt run --select adventure_works
dbt test --select adventure_works

## Recursos:
- https://docs.getdbt.com/docs

