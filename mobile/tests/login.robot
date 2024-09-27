*** Settings ***
Documentation    Suite de testes de adesões de planbos

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown     Finish Session

*** Test Cases ***
Deve logar com o cpf e IP

    ${login}    Get json fixture    memberships    login

    Delete Account By Email    ${login}[account][email]
    Insert Membership    ${login}

    Signin with document             ${login}[account][cpf]
    User is logged in


Nao deve realizar login com cpf não cadastrado

    Signin with document             77501408084
    
    Popup have text                  Acesso não autorizado! Entre em contato com a central de atendimento


Nao deve realizar login com cpf inválido

    Signin with document             77501408085
    
    Popup have text                  CPF inválido, tente novamente