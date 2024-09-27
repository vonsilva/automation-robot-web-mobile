*** Settings ***
Documentation    Arquivo principal do projeto de testes automatizados para mobile

Library    AppiumLibrary
Library    JSONLibrary
Library        libs/Database.py

Resource    ./actions/Account.resource
Resource    ./actions/Login.resource
Resource    ./actions/components/Menu.resource
Resource    ./actions/Mybody.resource
Resource    ./actions/components/Popup.resource
Resource    ../../services/Service.resource

*** Keywords ***
Start session

    Open Application    http://localhost:4723
    ...        platformName=Android
    ...        automationName=UIAutomator2
    ...        deviceName=Emulator
    ...        udid=emulator-5554
    ...        app=${EXECDIR}/app/smartbit-beta.apk
    ...        autoGrantPermissions=true
    
    Wait Until Page Contains    IP da API    20

Finish Session
    
    Capture Page Screenshot
    Close Application


# Helpers

Get json fixture
    [Arguments]            ${file_name}    ${scenario}

    ${data}    Load Json From File
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    
    RETURN    ${data}[${scenario}]