*** Settings ***
Documentation         Page object for bank selection
Resource              ../settings.resource

*** Variables ***
${lt_loginbank_button}             id=ltuserSocialButtonWrapper
${turva_loginbank_button}          id=turvauserSocialButtonWrapper
${nordea_user_id_textbox}          id=demo-mock-user-id
${ok_button}                       id=auth-button
${owssn_textbox}                   id=authenticate_my_account-TEXT_FIELD-finnishID-input_container-input
${continue_ssninput_button}        id=authenticate_my_account-submit-Submit-button_container-label
${op_bank}                         xpath=//*[contains(text(), 'OP')]
${nordea_bank_button}              xpath=//*[contains(text(), 'Nordea')]
${op_login_button}                 id=login_button
${op_stepup_login_button}          id=stepup-login
${proceed_to_app_continue_button}  id=proceed-submit-Submit-button_container

${user_id}                         DEMOUSER1

*** Keywords ***
select_bank_portal_and_login
    [Documentation]        Bank selection and b2c login
    New Page               ${${env}_${app}_url}
    IF    "${app}" == "LAHITAPIOLA"
        Click              ${lt_loginbank_button}
    ELSE IF    "${app}" == "TURVA"
        Click              ${turva_loginbank_button}
    END
    #Wait For Elements State    ${owssn_textbox}    visible    10s

    IF    "${bank_selected}" == "Nordea"
        nordea_is_selected
    ELSE IF    "${bank_selected}" == "OP"
        op_is_selected
    END
    ${ow_login_ssn}=        Read Cell    TC    SSN ${env}
    Fill Text               ${owssn_textbox}    ${ow_login_ssn}
    Click                   ${continue_ssninput_button}
    ${result}=              Run Keyword And Ignore Error    Wait For Elements State    ${proceed_to_app_continue_button}    visible    timeout=10s
    IF    '${result}[0]' == 'FAIL'
        Click              ${continue_ssninput_button}
        Wait For Elements State    ${proceed_to_app_continue_button}    visible    timeout=10s
    END
    Click                   ${proceed_to_app_continue_button}

nordea_is_selected
    [Documentation]        Steps when Nordea bank is selected
    Click                  ${nordea_bank_button}
    Type Text              ${nordea_user_id_textbox}    ${user_id}
    Click                  ${ok_button}

op_is_selected
    [Documentation]        Steps when OP bank is selected
    Click                  ${op_bank}
    Highlight Elements     ${op_login_button}
    Click                  ${op_login_button}
    Highlight Elements     ${op_stepup_login_button}
    Click                  ${op_stepup_login_button}