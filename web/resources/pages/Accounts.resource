*** Settings ***
Documentation        Ações e elementos da página de clientes

Library        Browser


*** Keywords ***
Validate login
    [Arguments]        ${login}

    ${element}    Set Variable    css=.logged-user

    Wait For Elements State
    ...    ${element}
    ...    visible    5

    Get Text
    ...    ${element}
    ...    equal
    ...    ${login}