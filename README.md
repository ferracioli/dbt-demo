# dbt Meetup: Sandbox com DuckDB 🦆

Ambiente sandbox local para o meetup de dbt usando o dataset **Brazilian E-Commerce (Olist)**. Roda inteiramente local via DuckDB, sem necessidade de nuvem ou bancos externos.

---

## Preparação do Ambiente e Inicialização

```bash
# Criar e ativar o ambiente virtual (Exemplo para Windows)
python -m venv .venv 
./.venv/scripts/activate

# Instalar dependências
pip install -r requirements.txt

# Carregue as rependências do DBT
dbt deps

# Carregar as seeds (necessário na primeira run)
dbt seed --profiles-dir .
```

Para resetar o banco de dados (caso necessário):
`Remove-Item dev.duckdb`

Fluxo padrão para executar código DBT:
```bash
# Rodar apenas um modelo específico
dbt run --select prata_order_items --profiles-dir .

# Executar testes
dbt test --profiles-dir .

# Gerar e abrir a documentação
dbt docs generate --profiles-dir .
dbt docs serve --profiles-dir .
```

Visualizando os dados com duckDB (um server SQL local bem simples)
```python
python

import duckdb

# Conecta ao arquivo de banco local
conn = duckdb.connect('dev.duckdb')

# Consulta e exibe os dados em formato DataFrame
conn.execute("SELECT * FROM main_bronze.customers").fetchdf()
```

Funcionamento esperado dos dados na camada gold
[customers] 
       │
       ▼ (1:N)
   [orders]
       │
       ▼ (1:N)
 [order_items] ◄── (N:1) [products]
       ▲
       │ (N:1)
   [sellers]