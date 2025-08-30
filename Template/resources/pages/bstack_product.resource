*** Settings ***
Documentation             Page object to add product to cart on BStackDemo app
Resource                  ../settings.resource

*** Variables ***
${PRODUCT}       iPhone 12


*** Keywords ***
Add Product To Cart
    Click    xpath=//*[text()="${PRODUCT}"]/ancestor::div[contains(@class,"shelf-item")]/div[4]
