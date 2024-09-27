*** Settings ***
Documentation    Ações e elementos da tela minha conta

Library        AppiumLibrary

*** Keywords ***
User is logged in

    ${xpath}    Set Variable    //android.widget.TextView[@resource-id="myAccountTitle"]

    Wait Until Element Is Visible    xpath=${xpath}    20

    Element Text Should Be           xpath=${xpath}    Sua transformação começa aqui!