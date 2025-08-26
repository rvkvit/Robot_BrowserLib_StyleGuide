*** Settings ***
Documentation                Navigation from Company selection
Resource                     ../settings.resource

*** Variables ***
${cookies_text}                    id=onetrust-policy-title
${accept_cookie}                   id=onetrust-accept-btn-handler
${org_company_selection}           span[contains(text(), '1002259-6')]
${company_landing_page}            id=cis-ui-yrd-company-landing-head-wrap/cis-ui-expanded-company-section/duet-heading
${language_selector_tool}          xpath=//*[@icon="navigation-language"]
${language_selected_is_english}    xpath=(//*[@id="currentLanguageIn English"])[1]
${language_selected_is_swedish}    xpath=(//*[@id="currentLanguagePå Svenska"])[1]
${language_selected_finnish}       xpath=(//*[@id="currentLanguageSuomeksi"])[1]

*** Keywords ***
navigation_from_company_selection
    [Documentation]        Navigation from Company selection
    ${is_visible}=         Run Keyword And Return Status        Wait For Elements State    ${accept_cookie}
    IF    ${is_visible}
        Click              ${accept_cookie}
        Log                Button was displayed and clicked.
    ELSE
        Log                Button is not displayed.
    END
    Run Keyword If         "${APP}" == "LAHITAPIOLA"           Click    ${language_selector_tool}
    #Wait For Elements State    ${language_selector_tool}      detached    timeout=5s
    IF    "${Lang}" == "FI"
        fi_is_selected
    ELSE IF    "${Lang}" == "SV"
        sv_is_selected
    ELSE IF    "${Lang}" == "EN"
        en_is_selected
    END

fi_is_selected
    [Documentation]        steps when langugage selected is Finnish
    Wait For Elements State    ${language_selected_finnish}    visible    timeout=5s
    Click                     ${language_selected_finnish}

en_is_selected
    [Documentation]        steps when langugage selected is English
    Wait For Elements State    ${language_selected_is_english}    visible    timeout=5s
    Click                     ${language_selected_is_english}

sv_is_selected
    [Documentation]        steps when langugage selected is Swedish
    Wait For Elements State    ${language_selected_is_swedish}    visible    timeout=5s
    Click                     ${language_selected_is_swedish}


