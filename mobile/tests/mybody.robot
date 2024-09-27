*** Settings ***
Documentation        Suite de testes da funcionalidade de cadastro de medidas

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown     Finish Session

*** Test Cases ***
Deve realizar cadastro de medidas
    
    ${data}    Get json fixture    memberships    update
    
    Delete Account By Email    ${data}[account][email]
    Insert Membership    ${data}
    
    Signin with document    ${data}[account][cpf]
    User is logged in

    Go to my body

    
    Send weight and height    ${data}[account]

    Popup have text    Seu cadastro foi atualizado com sucesso

    Set user token
    ${accountAPI}    Get account by name    ${data}[account][name]

    Should Be Equal    ${accountAPI}[weight]    ${data}[account][weight]
    Should Be Equal    ${accountAPI}[height]    ${data}[account][height]
