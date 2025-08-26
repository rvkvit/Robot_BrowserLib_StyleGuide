*** Settings ***
Documentation        YRD insurance list page
Resource             ../settings.resource

*** Variables ***
${insurance_tab}         xpath=(//*[@data-analytics-link="header_vakuutukset"])[1]
${insurances}            xpath=//*[@id="main-content"]/duet-layout/div/duet-heading

*** Keywords ***
navigate_to_insurance_tab
    [Documentation]        Navigate to insurance tab and verify insurances heading is present
    Get Text              ${insurance_tab}
    Click                 ${insurance_tab}
    Get Text              ${insurances}



