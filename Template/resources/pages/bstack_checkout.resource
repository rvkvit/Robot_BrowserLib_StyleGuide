*** Settings ***
Documentation             Page object to Proceed To Checkout on BStackDemo app
Resource                  ../settings.resource

*** Variables ***
${FIRST_NAME}                Test
${LAST_NAME}                 User
${ADDRESS_LINE}              123 Test Street
${PROVINCE}                  TestState
${POST_CODE}                 123456



*** Keywords ***
Proceed To Checkout

    Click    selector=.buy-btn 
    Wait For Elements State    id=firstNameInput    visible
    Fill Text    id=firstNameInput    ${FIRST_NAME}
    Fill Text    id=lastNameInput     ${LAST_NAME}
    Fill Text    id=addressLine1Input  ${ADDRESS_LINE}
    Fill Text    id=provinceInput     ${PROVINCE}
    Fill Text    id=postCodeInput     ${POST_CODE}
    Click    id=checkout-shipping-continue
