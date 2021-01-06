*** Settings ***
Resource  ../resource/ResourceWeb.robot
Test Setup  Abrir navegador
Test Teardown  Fechar navegador
## para todos os teste
## robot -d ./results testsWeb\TW001-Login.robot
## para teste individual
## robot -t "{nome do caso de teste}" testsWeb
## ex: robot -t "Caso de Teste: Login válido" testsWeb

*** Variables ***

*** Test Case ***
Caso de Teste: Login válido
  Autenticar com login "usuario@claro.com" e senha "123456789"
  Verificar se url contém "dashboards/painel"

Caso de Teste: Login inválido
  Autenticar com login "TESTE@TESTE.COM" e senha "DF54Edr"
  Verificar alerta "E-mail ou senha inválidos"

Caso de Teste: Login informado e senha não informada
  Preencher "email" com "xxx"
  Elemento "btnLogar" está desabilitado

Caso de Teste: Login não informado e senha informada
  Preencher "senha" com "xxx"
  Elemento "btnLogar" está desabilitado
