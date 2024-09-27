*** Settings ***
Documentation        Ações e elementos do componente da navbar

Library    Browser

*** Keywords ***
Go to memberships
    Click    css=a[href="/memberships"]

    Wait For Elements State    css=h1 >> text=Matrículas
    ...    visible