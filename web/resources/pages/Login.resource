*** Settings ***
Documentation        Ações e elementos da página de login

Library        Browser

*** Keywords ***

Submit login form
    [Arguments]        ${login}    ${password}

    Fill Text    id=email          ${login}
    Fill Text    id=password       ${password}

    Click    css=button >> text=Entrar
