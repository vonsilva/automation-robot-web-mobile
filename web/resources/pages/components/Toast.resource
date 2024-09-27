*** Settings ***
Documentation        Ações e elementos do Componente Toast

Library    Browser

*** Keywords ***
Validate Toast Message
    [Arguments]    ${message}

    ${element}    Set Variable    .Toastify__toast-body

    Wait For Elements State    css=${element}
    ...    visible    5
    
    Get Text    css=${element}
    ...    equal
    ...    ${message}
    
    Take Screenshot    selector=${element}