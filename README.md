
# Projeto Terraform para Provisionamento na AWS

Este projeto é uma configuração simples de infraestrutura na AWS utilizando Terraform. Ele provisiona uma instância EC2, um banco de dados MySQL, um health check no Route 53 e um Load Balancer. É um exemplo básico que pode ser usado como ponto de partida para setups mais complexos.

## Recursos Provisionados

1. **Instância EC2**
   - Tipo de instância: `t2.micro`
   - AMI: `ami-05fa00d4c63e32376`
   
2. **Banco de Dados MySQL**
   - Engine: `MySQL 5.7`
   - Tipo de instância: `db.t3.micro`
   - Armazenamento: 10 GB
   - Nome do usuário e senha configuráveis via variáveis.

3. **Health Check do Route 53**
   - Verifica a saúde de um endpoint HTTP (com falhas a partir de 5 requisições consecutivas e intervalos de 30 segundos).

4. **Load Balancer (AWS NLB)**
   - Tipo de Load Balancer: `network`
   - Proteção contra deleção habilitada.

## Como Usar

### Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) instalado.
- Uma conta na [AWS](https://aws.amazon.com/) com permissões para provisionar os recursos usados.
- Credenciais AWS configuradas na sua máquina (`~/.aws/credentials`).

### Passos para Executar

1. Clone o repositório e navegue até o diretório do projeto:

   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
   cd seu-repositorio
   ```

2. Inicialize o Terraform:

   ```bash
   terraform init
   ```

3. Verifique o plano de execução (opcional, mas recomendado):

   ```bash
   terraform plan
   ```

4. Aplique a configuração para provisionar os recursos:

   ```bash
   terraform apply
   ```

   Confirme a execução quando solicitado.

5. Após a execução, os recursos serão provisionados na sua conta AWS.

### Personalizações

- **Instância EC2**: Você pode alterar o tipo da instância, a AMI ou até mesmo adicionar mais configurações, como volumes adicionais.
- **Banco de Dados**: O nome do usuário, a senha e outros parâmetros podem ser configurados via variáveis ou diretamente no script.
- **Health Check**: Pode ser adaptado para monitorar outros endpoints, ajustando o `fqdn` e o `resource_path`.
- **Load Balancer**: A lista de subnets pode ser alterada para ajustar sua arquitetura de rede.

