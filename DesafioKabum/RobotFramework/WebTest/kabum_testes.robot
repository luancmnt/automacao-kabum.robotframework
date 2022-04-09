*** Settings ***
Documentation  Essa suíte testa o site do Kabum.com.br
Resource       kabum_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso a página de login
    [Documentation]   Esse teste verifica a validação de um usuário inválido
    [Tags]            pagina_login
    Dado que estou na home page do Kabum.com.br
    Quando acessar a página de login
    E inserir dados inválidos de um usuário
    Então uma mensagem de erro deve ser exibida

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]   Esse teste verifica a busca de um produto
    [Tags]            busca_produtos
    Dado que estou na home page do Kabum.com.br
    Quando pesquisar pelo produto "IPhone"
    Então um produto da linha "IPhone" deve ser mostrado na página

Caso de Teste 03 - Adicionar um produto no carrinho
    [Documentation]   Esse teste verifica a adição de um produto no carrinho
    [Tags]            carrinho
    Dado que estou na home page do Kabum.com.br
    Quando acessar uma categoria do menu "Departamento"
    E adiciono um produto no carrinho    
    Então o produto deve ser adicionado no carrinho
