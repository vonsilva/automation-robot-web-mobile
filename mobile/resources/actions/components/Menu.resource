*** Settings ***
Documentation    Ações e elementos do componente menu

Library    AppiumLibrary

*** Keywords ***
Go to my body
    Click Element        xpath=//android.widget.TextView[@text="Meu corpo"]


Go to my account
    Click Element        xpath=//android.widget.TextView[@text="Minha conta"]