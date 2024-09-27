*** Settings ***
Documentation        Arquivo principal do projeto robot

Library        JSONLibrary
Library        Browser
Library        libs/Account.py
Library        libs/Database.py

Resource        pages/Accounts.resource
Resource        pages/Landing.resource
Resource        pages/Login.resource
Resource        pages/Welcome.resource
Resource        pages/Memberships.resource

Resource        pages/components/Toast.resource
Resource        pages/components/BoxNotice.resource
Resource        pages/components/Navbar.resource

Variables       Env.py

*** Variables ***
${ADMIN_EMAIL}    sac@smartbit.com
${ADMIN_PASS}     pwd123


*** Keywords ***

Start session
    New Browser    browser=chromium    headless=False 
    New page       ${BASE_URL}

Go to Login Page
    Start session
    Go to    ${BASE_URL}/login

# Helpers

Get json fixture
    [Arguments]            ${file_name}    ${scenario}

    ${data}    Load Json From File
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    
    RETURN    ${data}[${scenario}]

Signin admin
    Submit login form    ${ADMIN_EMAIL}    ${ADMIN_PASS}
    Validate login       ${ADMIN_EMAIL}