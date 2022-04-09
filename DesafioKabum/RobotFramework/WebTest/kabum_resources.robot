*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${URL}               https://www.kabum.com.br/
${BARRA_PESQUISA}   //input[contains(@autocomplete,'off')]
${MENSAGEM_ERRO}   //div[@class='sc-gKXOVf bSTGTs'][contains(.,'Não foi possivel realizar o login')]
${SUBMIT}         //button[contains(@class,'sc-kBjqcv Bmexq')]
${PRODUTO}        //span[@height='54'][contains(.,'iPhone SE 64GB Preto, 4G, Tela de 4.7, Câmera Traseira 12MP + Selfie 7MP - MHGP3BR/A')]
${DEPARTAMENTO}   //button[contains(.,'TODOS OS DEPARTAMENTOS')]
${COMPUTADORES}   //a[@href='https://www.kabum.com.br/computadores']
${NOTEBOOK}       //span[@height='54'][contains(.,'Notebook Acer Aspire 5 Intel Core i5-1035G1, 4GB RAM, SSD 256GB NVMe, 14 HD Ultrafino, UHD Graphics, Windows 10 Home, Prata - A514-53-5239')]
${COMPRAR}        //button[contains(.,'COMPRAR')]
${CARRINHO}       //button[@class='buttonGoToCart']
${VALIDACAO}      //a[contains(@class,'sc-bQtKYq hYRcNr productName')]

*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Dado que estou na home page do Kabum.com.br
    Go To                            url=${URL}
    Wait Until Element Is Visible    locator=${BARRA_PESQUISA}

Quando acessar a página de login
    Click Element    locator=linkLoginHeader

E inserir dados inválidos de um usuário
    Input Text        locator=inputUsuarioLogin    text=testes@testes.com
    Input Password    locator=inputSenhaLogin      password=123456
    Click Button      locator=botaoLogin

Então uma mensagem de erro deve ser exibida
    Wait Until Element Is Visible    locator=${MENSAGEM_ERRO}

Quando pesquisar pelo produto "IPhone"
    Click Element    locator=input-busca
    Input Text       locator=input-busca   text=IPhone 
    Click Button     locator=${SUBMIT} 

Então um produto da linha "IPhone" deve ser mostrado na página
    Wait Until Element Is Visible    locator=${PRODUTO}

Quando acessar uma categoria do menu "Departamento"
    Wait Until Element Is Visible    locator=${DEPARTAMENTO}
    Click Button                     locator=${DEPARTAMENTO}
    Wait Until Element Is Visible    locator=${COMPUTADORES}
    Click Element                    locator=${COMPUTADORES}  

E adiciono um produto no carrinho    
    Wait Until Element Is Visible    locator=${NOTEBOOK}
    Click Element                    locator=${NOTEBOOK}
    Wait Until Element Is Visible    locator=${COMPRAR}
    Click Button                     locator=${COMPRAR}

Então o produto deve ser adicionado no carrinho
    Wait Until Element Is Visible    locator=${CARRINHO}
    Click Button                     locator=${CARRINHO}
    Wait Until Element Is Visible    locator=${VALIDACAO}    





