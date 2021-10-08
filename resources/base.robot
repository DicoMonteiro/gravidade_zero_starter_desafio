*** Settings ***
Documentation           Aqui é onde tudo deve ser gerenciado

Library         Browser
Library         String

Resource        actions.robot
Library         ${EXECDIR}/resources/factories/massas_dados.py


*** Variable ***
${message_welcome}         Olá Papito
${balance_initial}         R$ 1000


*** Keywords ***
Start Session

    New Browser     chromium    headless=False      slowMo=00:00:00
    New Page        https://nbank.vercel.app/
    

End Session

    Take Screenshot