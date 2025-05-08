# POC Function Slot

Este projeto é uma prova de conceito para a criação e implantação de uma Azure Function utilizando Terraform para provisionamento de infraestrutura.

## Estrutura do Projeto

- **infraestrutura/**: Contém os arquivos Terraform para provisionar os recursos no Azure.
- **app/**: Contém o código da Azure Function em Node.js.

## Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) instalado.
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) instalado e autenticado.
- Node.js e npm instalados.
- Extensão [Azure Functions Core Tools](https://learn.microsoft.com/azure/azure-functions/functions-run-local) instalada.

## Configuração

1. Clone este repositório:
   ```bash
   git clone <url-do-repositorio>
   cd poc_func_slot
   ```

2. Configure as variáveis de ambiente no arquivo `infraestrutura/environments/dev.tfvars` conforme necessário.

3. Inicialize o Terraform:
   ```bash
   cd infraestrutura
   terraform init
   ```

4. Valide e aplique a infraestrutura:
   ```bash
   terraform plan -var-file=environments/dev.tfvars
   terraform apply -var-file=environments/dev.tfvars
   ```

## Execução Local

1. Navegue até o diretório `app`:
   ```bash
   cd app
   ```

2. Instale as dependências (se houver):
   ```bash
   npm install
   ```

3. Inicie a Azure Function localmente:
   ```bash
   npm start
   ```

4. Acesse a função em `http://localhost:7071/api/<nome-da-função>`.

## Limpeza

Para destruir os recursos provisionados:
```bash
cd infraestrutura
terraform destroy -var-file=environments/dev.tfvars
```

## Autor

Rodrigo Garcez

## Licença

Este projeto está licenciado sob a licença MIT.
