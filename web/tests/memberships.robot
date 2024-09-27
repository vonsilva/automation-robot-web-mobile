*** Settings ***
Documentation    Suite de testes de adesões de planbos

Resource        ../resources/Base.resource

Test Setup       Go to Login Page
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão

    ${dataTest}    Get json fixture    memberships    create

    Delete Account By Email    ${dataTest}[account][email]
    Insert Account             ${dataTest}[account]

    Signin admin
    Go to memberships
    Create new membership    ${dataTest} 

    Validate Toast Message        Matrícula cadastrada com sucesso.


Nao deve realizar adesão duplicada
    ${dataTest}    Get json fixture    memberships    duplicate

    Delete Account By Email    ${dataTest}[account][email]
    Insert Membership          ${dataTest}

    Signin admin
    Go to memberships
    Create new membership    ${dataTest} 

    Validate Toast Message        O usuário já possui matrícula.


Deve buscar por nome

    ${name}    Set Variable    Emily Stone

    Signin admin
    Go to memberships

    Fill Text    css=input[placeholder^=Busque]    ${name}

    Wait For Elements State    css=strong >> text=Total: 1
    ...     visible

    Wait For Elements State    css=table tbody tr >> text=${name}
    ...    visible
    

Deve xcluir uma matrícula
    ${dataTest}    Get json fixture    memberships    remove

    Delete Account By Email    ${dataTest}[account][email]
    Insert Membership          ${dataTest}

    Signin admin
    Go to memberships

    Fill Text    css=input[placeholder^=Busque]    ${dataTest}[account][name]

    Wait For Elements State    css=strong >> text=Total: 1
    ...     visible
    
    Click    xpath=//td[text()="${dataTest}[account][name]"]/..//button

    Click        css=.swal2-confirm

    Wait For Elements State    css=table tbody tr >> text=${dataTest}[account][name]
    ...    detached