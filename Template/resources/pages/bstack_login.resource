*** Settings ***
Documentation             Page object to login on BStackDemo app
Resource                  ../settings.resource

*** Variables ***
${USERNAME}       demouser
${PASSWORD}       testingisfun99


*** Keywords ***
Login To BStackDemo
    Click    id=signin
    Wait For Elements State    id=username    visible
    Click    selector=id=username
    Click    selector=id=react-select-2-option-0-0        

    Click    selector=id=password
    Click    selector=id=react-select-3-option-0-0
    
    Click    id=login-btn
