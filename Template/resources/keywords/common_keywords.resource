*** Settings ***
Resource            ../settings.resource


*** Keywords ***
Test Setup
    [Documentation]   closes the browser after each test case
    
    New Browser    ${BROWSER}     headless=False    args=["--start-maximized"]
    New Context
    New Page    ${APP_URL}
Test Teardown
    [Documentation]   closes the browser after each test case

    Close Browser        ALL