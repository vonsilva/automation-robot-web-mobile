*** Settings ***
Documentation        Cenários de testes do login SAC admin

Resource        ../resources/Base.resource

Test Setup       Go to Login Page
Test Teardown    Take Screenshot


*** Test Cases ***
Deve realizar login corretamente
    [Tags]    test

    Submit login form    sac@smartbit.com    pwd123
    Validate login       sac@smartbit.com


Não deve logar com senha incorreta
    [Tags]    test

    Submit login form    sac@smartbit.com    abc123
    
    Validate Toast Message    As credenciais de acesso fornecidas são inválidas. Tente novamente!


Não deve logar com e-mail incorreto
    [Tags]    test

    Submit login form    404@smartbit.com    pwd123
    
    Validate Toast Message    As credenciais de acesso fornecidas são inválidas. Tente novamente!


Tentativa de login com dados incorretos
    [Template]    Login with verify notice
    ${EMPTY}            ${EMPTY}      Os campos email e senha são obrigatórios.
    ${EMPTY}            pwd123        Os campos email e senha são obrigatórios.
    sac@smartbit.com    ${EMPTY}      Os campos email e senha são obrigatórios.
    www.teste.com.br    pwd123        Oops! O email informado é inválido


*** Keywords ***
Login with verify notice
    [Arguments]
    ...    ${email}
    ...    ${password}
    ...    ${output_message}
    
    ${login}    Create Dictionary
    ...    email=${email}
    ...    password=${password}
    
    Submit login form    ${email}    ${password}
    Notice should be     ${output_message}