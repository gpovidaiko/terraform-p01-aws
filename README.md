# Terraform - P01

Projeto para estudo de _Terraform_. Módulo "Automatize a infraestrutura na nuvem". Tem como motivação provisionar infraestrutura na nuvem. No projeto foi utlizado serviços em nuvem disponibilizados pela _AWS_.
Foi provisionada uma máquina vitual _Linux_, utilizando _Vagrant_, para estudar a tecnologia alvo.

## 01. Provisionando a primeira infraestrutura com o _Terraform_

Configuração do _terraform-cli_ e do _aws-cli_.
Criação de usuário para o _Terraform_ se comunicar com o _AWS_.
Configuração de chave _SSH_ para se comunicar com o _AWS_.
Criação de arquivo de código para configurar três servidores _EC2_ no _AWS_.
Comando _init_ para baixar os módulos do provedor utilizado, no nosso caso o _AWS_.
Comando _plan_ para ter uma visão prévia das alterações que serão efetuadas.
Comando _apply_ para aplicar as alterações ao provedor alvo.

## 02. Modificando a infraestrutura e inserindo novos recursos

Criação de grupo para conexão _SSH_.
Alteração na configuração das instâncias para utilizarem o grupo para conexão _SSH_.
Conexão via _SSH_ com a instância provida na _AWS_ 
Comando _show_ para vizualizar o estado da configuração.

## 03. Utilizando referências e dependências entre os recursos

Método para referenciar recursos e suas propriedades
Configuração para informar a dependência entre recursos através do atributo _depends_on_ de um recurso.

## 04. Organizando a configuração com a separação de arquivos e aliases

Método de segregação de configuração em arquivos específicos
Configuração multiregional
Utilização do atributo _alias_ para identificar em qual região o recurso deve ser configurado

## 05. Trabalhando com variáveis

Criação de arquivo para configurar váriaveis a serem utilizadas em vários pontos do projeto.
Configuração de váriavel do tipo _map_.
Configuração de váriavel do tipo _list_.
Configuração de váriavel do tipo _string_.
Método de acesso das váriáveis nos arquivos _.tf_.

## 06. Gerenciando recursos e outputs

Comando _destroy -target <recurso>_ para destruir um recurso provisionado.
Comando _destroy_ já destrói todos os recursos provisionados.
Somente apagar a declaração de um recurso do arquivo de configuração já serve como um _destroy_.
Criação de arquivo para configurar as saídas (_outputs_) do procedimento.

## 07. Trabalhando em equipe - Terraform Cloud

Autenticação no _Terraform Cloud_. Método diferente do explicado em aula, utilizando o comando _terraform login_.
Configuração de administração remota através do arquivo _remote-state.tf_.
Infraestrutura versionada no _Terraform Cloud_ ao reexecutar o comando _terraform init_.
Foi necessário configurar as credenciais de comunicação com a _AWS_, antes configuradas no _AWS CLI_, agora no _Terraform Cloud_.
