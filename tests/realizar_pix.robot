*** Settings ***
Documentation           Suite de testes para realizar transferencias via PIX

Resource            ${EXECDIR}/resources/base.robot


Test Setup          Start Session
Test Teardown       End Session


*** Test Case ***
Deve realizar um PIX com valor positivo
    [Tags]      realizar_pix_positivo

    &{dados}      Factory Pix Positivo

    Go To Home Page                       ${message_welcome}
    User Should Be Balance                ${balance_initial}

    Go To The PIX

    Fill PIX Form                         ${dados}

    Submit Payment Form

    User Should Be Balance                ${dados}[valor_saldo]

    Bank Statement Should Be Visible      ${dados}


Deve realizar um PIX com valor zero
    [Tags]      realizar_pix_zero

    &{dados}      Factory Pix Zero

    Go To Home Page                       ${message_welcome}
    User Should Be Balance                ${balance_initial}

    Go To The PIX

    Fill PIX Form                         ${dados}

    Submit Payment Form

    Alert Message Should Be               Oops. Transferir ZERO é osso hein...



Deve realizar um PIX com valor negativo
    [Tags]      realizar_pix_negativo

    &{dados}      Factory Pix Negativo

    Go To Home Page                       ${message_welcome}
    User Should Be Balance                ${balance_initial}

    Go To The PIX

    Fill PIX Form                         ${dados}

    Submit Payment Form

    Alert Message Should Be               Oops. Valor para PIX incorreto...


Deve limpar os campos ao cancelar a realização do PIX
    [Tags]      cancelar_pix

    &{dados}      Factory Pix Positivo

    Go To Home Page                       ${message_welcome}
    User Should Be Balance                ${balance_initial}

    Go To The PIX

    Fill PIX Form                         ${dados}

    Cancel Payment Form

    Go To The PIX

    Datas Should Not Be Visible           ${dados}


Deve realizar um PIX com chave acima de 150 caracteres
    [Tags]      chave_caracteres_acima

    &{dados}      Factory Pix Sem Limite

    Go To Home Page                       ${message_welcome}
    User Should Be Balance                ${balance_initial}

    Go To The PIX

    Fill PIX Form                         ${dados}

    Submit Payment Form

    Alert Message Should Be               Oops. Chave PIX muito grande. Tente novamente!