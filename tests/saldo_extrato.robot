*** Settings ***
Documentation           Suite de testes para verificar o saldo e extrato da aplicação

Resource            ${EXECDIR}/resources/base.robot


Test Setup          Start Session
Test Teardown       End Session


*** Test Case ***
Deve verificar o saldo inicial em conta no valor R$ 1000
    [Tags]      verifca_saldo

    Go To Home Page                 ${message_welcome}

    User Should Be Balance          ${balance_initial}





