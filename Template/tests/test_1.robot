*** Settings ***
Resource    ../resources/settings.resource

Test Setup  Test Setup
Test Teardown  Test Teardown

*** Variables ***

*** Test Cases ***
Buy Product On BStackDemo And Checkout
    [Documentation]        Test case to Buy Product On BStackDemo And Checkout
    [Tags]                Smoke    Regression    Summaryfeature

    Login To BStackDemo
    Add Product To Cart
    Proceed To Checkout


