*** Settings ***
Documentation            Ações e elementos da página de matrículas

Library    Browser

*** Keywords ***
Create new membership
    [Arguments]    ${dataTest}
    Go to membership form
    Select account       ${dataTest}[account][name]    ${dataTest}[account][cpf]
    Select plan          ${dataTest}[plan]
    Fill payment card    ${dataTest}[credit_card]

    Click    css=button[type=submit] >> text=Cadastrar

Go to membership form
    Click        css=a[href="/memberships/new"]

    Wait For Elements State    css=h1 >> text=Nova matrícula
    ...    visible


Select account
    [Arguments]    ${name}    ${cpf}
    Fill Text    css=input[aria-label=select_account]    ${name}
    Click        css=[data-testid="${cpf}"]

Select plan
    [Arguments]    ${plan}

    Fill Text    css=input[aria-label=select_plan]    ${plan}[name]
    Click        css=div[id*=option] >> text=${plan}[name]

Fill payment card
    [Arguments]    ${card}

    Fill Text    css=input[id=card_number]    ${card}[number]
    Fill Text    css=input[id=card_holder]    ${card}[holder]
    Fill Text    css=input[id=card_month]     ${card}[month]
    Fill Text    css=input[id=card_year]      ${card}[year]
    Fill Text    css=input[id=card_cvv]       ${card}[cvv]