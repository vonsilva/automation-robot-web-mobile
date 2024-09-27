*** Settings ***
Documentation        Ações e elementos do componente POPUP

Library    AppiumLibrary

*** Keywords ***
Popup have text
    [Arguments]        ${target}

    ${xpath}    Set Variable            //android.widget.TextView[@resource-id="android:id/message"]

    Wait Until Element Is Visible        xpath=${xpath}
    Element Text Should Be               xpath=${xpath}    ${target}