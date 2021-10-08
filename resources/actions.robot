*** Settings ***
Documentation           Ações customizadas do nBank


*** Keywords ***
Go To Home Page
    [Arguments]         ${message}

    Get Title       equal       nBank by QAninja
    
    Wait For Elements State     css=.carousel       visible     5
    Wait For Elements State     
    ...                         xpath=//a[contains(text(), "${message}")]
    ...                         visible     5

Go To The PIX
    Click       text=Fazer PIX

    Log     Checkpoint para garantir que estamos na tela do PIX

    Wait For Elements State     
    ...                         css=.modal-card-title >> text=PIX     
    ...                         visible     5


Fill PIX Form
    [Arguments]         ${dados}

    Select Options By       css=.field select       text    ${dados}[bank]

    Fill Text           id=chave-pix                          ${dados}[chave]
    Fill Text           css=input[placeholder="Valor"]        ${dados}[valor_pix]


Submit Payment Form
    Click               css=button >> text=Enviar PIX

Cancel Payment Form
    Click               css=button >> text=Cancelar

Alert Message Should Be
    [Arguments]         ${message}

    ${element}      Set Variable        css=.media-content

    Wait For Elements State         ${element}       visible     5
    Get Text                        ${element}       equal       ${message}

User Should Be Balance
    [Arguments]     ${value}

    ${element}      Set Variable        css=a[class=navbar-item] 

    Wait For Elements State         ${element}      visible     5

    Get Text        ${element}      contains        ${value}


Bank Statement Should Be Visible
    [Arguments]     ${dados}

    ${element}      Set Variable        xpath=//td[contains(text(), "${dados}[chave]")]/.. 

    Wait For Elements State         ${element}      visible     5

    Get Text        ${element}      contains        ${dados}[chave]
    Get Text        ${element}      contains        ${dados}[valor_extrato]


Datas Should Not Be Visible
    [Arguments]     ${dados}


    ${element_chave_pix}      Set Variable        id=chave-pix
    ${element_valor}          Set Variable        css=input[placeholder="Valor"]

    Wait For Elements State         ${element_chave_pix}       visible     5
    Wait For Elements State         ${element_valor}           visible     5

    Get Text        ${element_chave_pix}      not contains        ${dados}[chave]
    Get Text        ${element_valor}          not contains        ${dados}[valor_pix]

