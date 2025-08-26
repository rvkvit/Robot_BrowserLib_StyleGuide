*** Settings ***
Documentation     WCI policy details page
Resource          ../settings.resource

*** Variables ***
${expected_url_in_english}                                                        https://www.tvk.fi/en/trhv/
${expected_url_in_swedish}                                                        https://www.tvk.fi/sv/trhv/
${expected_url_in_finnish}                                                        https://www.tvk.fi/trhv/
${api_url_policy_details_page}                                                    https://sitapim-api.lahitapiola.fi/sit2/corporate-wci-policy/policy/v1/wci/details
${api_url}                                                                        https://sitapim-api.lahitapiola.fi
${company}                                                                        Malinen Forest Oy
${employees_label}                                                                data-testid=policy-details-policy-information-heading
${policy_details_page_loaded}                                                     data-testid=policy-details-policy-information-policy-name
${back_button_wci_details_page}                                                   xpath=//*[@data-testid="wci-policy-details-policy-information-back-button"]
${wci_detail_page_main_label}                                                     xpath=//*[@id="wci-landing-layout"]/div/duet-grid/duet-grid-item[1]/ui-app-library-generic-policy-basic-info/duet-grid/div/duet-heading[1]
${policyholder_label}                                                             xpath=//*[@id="wci-landing-layout"]/div/duet-grid/duet-grid-item[1]/ui-app-library-generic-policy-basic-info/duet-list/duet-list-item[1]/span[1]
${policy_number_label}                                                            xpath=//*[@id="wci-landing-layout"]/div/duet-grid/duet-grid-item[1]/ui-app-library-generic-policy-basic-info/duet-list/duet-list-item[2]/span[1]
${period_label}                                                                   xpath=//*[@id="wci-landing-layout"]/div/duet-grid/duet-grid-item[1]/ui-app-library-generic-policy-basic-info/duet-list/duet-list-item[3]/span[1]
${quicklinks_header}                                                              xpath=//*[@id="cis-ui-app-generic-side-links"]/duet-heading
${download_certificate_text_active_policy}                                        id=cis-ui-side-bar-link-1
${classes_of_occupations_and_estimated_salaries_link_active_policy}               xpath=//*[@id="cis-ui-side-bar-link-2"]
${invoices_link_text_active_policy}                                               xpath=//*[@id="cis-ui-side-bar-link-3"]
${invoices_link_text_scheduled_policy}                                            xpath=//*[@id="cis-ui-side-bar-link-2"]
${make_a_claim_link_text_active_policy}                                           xpath=//*[@id="cis-ui-side-bar-link-4"]
${online_service_support_link_text_active_policy}                                 xpath=//*[@id="cis-ui-side-bar-link-5"]
${online_service_support_link_text_scheduled_policy}                              xpath=//*[@id="cis-ui-side-bar-link-3"]
${classes_of_occupations_and_estimated_salaries_link_scheduled_policy}            id=cis-ui-side-bar-link-1
${classes_of_occupations_and_estimated_salaries_link_cancelled_policy}            id=cis-ui-side-bar-link-1 
${invoices_linktext_cancelled_policy}                                             xpath=//*[@id="cis-ui-side-bar-link-2"]
${make_a_claim_linktext_cancelled_policy}                                         xpath=//*[@id="cis-ui-side-bar-link-3"]
${online_service_support_link_text_cancelled_policy}                              xpath=//*[@id="cis-ui-side-bar-link-4"] 
${sheet_name}                                         TC
${contractsection}                                                              xpath=//*[@id="policy-tabs"]
${dismisiblecoverage_ended_banner_for_employee_grouplife}                       xpath=(//*[@data-testid="coverage-banner"])[1]
${dismissiblecoverage_ended_banner_for_voluntary}                               xpath=(//*[@data-testid="coverage-banner"])[2]
#Below are the locators for Contract sections
${summary_tab}                                                                  xpath=//*[@data-testid="wci-insurance-tab-group"] >> css=button[type='button']:nth-child(1)
...    #
${contractsectiontable}                                                         xpath=//*[@data-testid="wci-insurance-tab-group"]
${contract_section_expandable_and_collapsible_component}                        xpath=(//*[@data-testid="wci-insurance-tab-group"]//duet-grid)[1]
${policyholder_section_in_contract_section}                                     xpath=//*[@data-testid="card-info-item-Policy holder"]
${policy_holder_label_in_policy_holder_section}                                 xpath=(//*[@data-testid="card-info-item-Policy holder"]//div)[2]
${policynumber_section_in_contract_section}                                     data-testid=card-info-item-Policy number
${policyperiod_section_in_contract_section}                                     data-testid=card-info-item-Period
${insurance_premium_to_be_paid_section_in_contract_section}                     data-testid=card-info-item-Insurance premium to be paid
${insurance_premium_to_be_paid_label}                                           xpath=(//*[@data-testid="card-info-item-Insurance premium to be paid"]//div)[1]
${insurance_premium_value_times_year_displayed}                                 xpath=//*[@data-testid="generic-infobox-value-Insurance premium to be paid"]
${insurance_recipient_of_documents_and_messages_section_in_contract_section}     data-testid=card-info-item-Recipient of documents and messages
${insurance_recipient_of_documents_and_messages_section_in_contract_section_label}            (//*[@data-testid="card-info-item-Recipient of documents and messages"]//div)[1]
${insurance_card_info_item_industry_section_in_contract_section}                 data-testid=card-info-item-Industry
${insurancecard_info_item_estimated_salary_for_the_current_period}              xpath=(//*[@data-testid="card-info-item-Estimated salary for the current period"])[1]
${insurancecard_info_item_estimated_salary_for_the_current_period_label}        (//*[@data-testid="card-info-item-Estimated salary for the current period"]//div)[1]
${insurance_card_industry_name_title_label}                                    (//*[@data-testid="generic-infobox-label-Industry"])[1]
${industry_card_industry_name_from_gw}                                          (//*[@data-testid="generic-infobox-value-Industry"])[1]
${insurance_card_estimated_salary_amount_in_ui}                                (//*[@data-testid="generic-infobox-value-Estimated salary for the current period"])[1]
${insurancesheader_in_summary_section}                                          data-testid=contract-section-insurance-heading           
${insuranceheader_description_in_summary_section}                              data-testid=contract-section-insurance-description
${insurance_category_link_mandatory_workers_compensation_insurance}            xpath=//*[@data-testid="insurance-category-link-WCLWorkingTimeCoverEmployees"]
${insurance_category_link_employees_group_life_assurance}                     xpath=//*[@data-testid="insurance-category-link-WCLEmployeesGroupLifeAssurance"]
${insurance_category_link_voluntary_workers_compensation_insurance}           xpath=//*[@data-testid="insurance-category-link-WCLVolLeisureTimeInsurance"]


#Document section locators
${document_section_expandable_and_collapsible_button}             xpath=(//*[@class='sc-duet-tab hydrated user-is-tabbing'])[2]
${document_section_main_descripition_text}                        data-testid=document-card-description
${document_insurancepolicy_collapsible_button}                    data-testid=document-card-insurance-policy-collapsible 
${document_terms_condition_collapisible_button}                   data-testid=document-card-terms-and-conditions-collapsible

#Pricebreakdown section locators
${price_breakdown_collapsible_button}                            data-testid=price-breakdown
${premium_and_payment_card}                                      data-testid=price-breakdown
${premium_payment_section_description}                           data-testid=premium-payment-section-description
${mandatory_workers_compensation_insurance_voluntary_workers_compensation_insurance_expandabile_text}       xpath=(//*[@data-testid="coverage-collapsible"])[1]       
${employee_group_life_worker_compensation_insurance_expandabile_text}         xpath=(//*[@data-testid="coverage-collapsible"])[2]        
${policy_payer_for_mandatory_and_voluntary_insurance_card}                        xpath=(//*[@data-testid="policy-payer-card"])[1]
${policy_payer_name_label_for_mandatory_section_in_payment_breakdown}           xpath=(//*[@data-testid="policy-payer-card"]//div)[2]
${policy_period_mandatory_and_voluntary_insurance_insurance_card}                 xpath=(//*[@data-testid="policy-period-card"])[1]

${mandatory_insurances_in_coverage_list_in_payment_section}        data-testid=Mandatory insurance
${voluntary_insurance_in_coverage_list_in_payment_section}         data-testid=Voluntary Insurance
${policy_payer_for_employee_group_card}                          xpath=(//*[@data-testid="policy-payer-card"])[2]
${policy_period_for_employee_group_insurance_card}                 xpath=(//*[@data-testid="policy-period-card"])[2]
${employee_group_life_insurances_in_coverage_list_in_payment_section}     xpath=//*[@data-testid="Employee Group Life Insurance"]
${policy_payer_name_label_in_employee_group_life_in_payment_section}      xpath=(//*[@data-testid="policy-payer-card"]//div)[4]
${total_price_breakdown_section_with_cost}                            xpath=//*[@data-testid="total-premium-of-all-coverages"]
${mandatory_wci_tab}                                 xpath=//*[@data-testid="wci-insurance-tab-group"] >> css=button[type='button']:nth-child(2)
${employee_group_life_wci_tab}                       xpath=//*[@data-testid="wci-insurance-tab-group"] >> css=button[type='button']:nth-child(3)
${voluntary_wci_tab}                                 xpath=//*[@data-testid="wci-insurance-tab-group"] >> css=button[type='button']:nth-child(4)

${policy_date}                                     xpath=//*[@data-testid="policy-details-policy-information-insurance-period-list-item-value"]

${policy_level_banner}                                 xpath=//*[@data-testid="policy-banner"]

#Document section locators
${document_section_card}                                    data-testid=document-section-card-details    
${document_section_description}                             data-testid=document-card-description
${document_section_insurance_policy_expandible_text}                         data-testid=document-card-insurance-policy-collapsible
${document_section_terms_and_condition_and_product_spec_expandible_text}     data-testid=document-card-terms-and-conditions-collapsible

#Mandatory tab locators
${coverdetails_card_locator}                    xpath=(//*[@data-testid="wci-insurance-tab-WCLWorkingTimeCoverEmployees"]//duet-card)[1]
${cover_details_label}                          xpath=(//*[@data-testid="wci-insurance-tab-WCLWorkingTimeCoverEmployees"]//duet-card)[1]//duet-heading
${cover_details_description_label}               xpath=(//*[@data-testid="wci-insurance-tab-WCLWorkingTimeCoverEmployees"]//duet-card)[1]//duet-paragraph
${estimated_salary_for_current_period_section}    xpath=(//*[@data-testid="card-info-item-Estimated salary for the current period"])[2]
${insured_section_in_mandatory_tab}                xpath=(//*[@data-testid="card-info-item-Insured"])[1]
${insurer_section_in_mandatory_tab}                xpath=(//*[@data-testid="card-info-item-Insurer"])[1]
${payment_system_section_in_mandatory_tab}         data-testid=card-info-item-Payment system
${payment_type_label_for_table_tariff}             xpath=(//*[@data-testid="generic-infobox-value-Payment system"])[1]
${payment_system_type_as_helmi}                    xpath=(//*[@data-testid="card-info-item-Payment system"])[1]
${helmi_payment_type}                                xpath=(//*[@data-testid="card-info-item-Payment system"]//div)[2]
${validity_section_in_mandatory_tab}                xpath=(//*[@data-testid="card-info-item-Validity"])[1]
${cut_off_limit_card_in_mandatory_tab}                data-testid=card-info-item-Cut-off limit
${policy_end_date_badge_in_period_section_for_mandatory_tab_tobecancelled}    xpath=(//*[@data-testid="insurance-contract-badge-ends"])[2]
${policy_start_date_badge_in_period_section_for_mandatory_tab_to_be_valid}     xpath=(//*[@data-testid="insurance-contract-badge-begins"])[2] 
${policy_start_date_badge_in_period_section_for_summary_tab_to_be_valid}      xpath=(//*[@data-testid="insurance-contract-badge-begins"])[1] 
${policy_ended_date_badge_in_period_section_for_mandatory_tab_to_be_valid}      xpath=(//*[@data-testid="insurance-contract-badge-ended"])[2]
#What is insured section for mandatory tab locators
${what_is_insured_card_locator}                    xpath=(//*[@data-testid="insured-info-section-card"])[1]
${what_is_insured_header_label}                    xpath=(//*[@data-testid="insured-info-section-card"]//duet-heading)[1]
${what_is_insured_header_description}               xpath=(//*[@data-testid="insured-info-section-card"]//duet-paragraph)[1]
${you_are_covered_for_title_label}                  xpath=(//*[@data-testid="insured-info-title-you-are-covered-for"])[1]
${you_are_covered_covered_for_description}          xpath=//*[@data-testid="insured-info-collapsible-content-title-injuryAndOccupationalDisease"]
${you_are_covered_expandible_description_text}        xpath=//*[@data-testid="insured-info-collapsible-content-description-injuryAndOccupationalDisease"]
${you_are_not_covered_for_title_label}                xpath=(//*[@data-testid="insured-info-title-what-is-not-covered"])[1]

${date_format}           %Y-%m-%d
${new_date_format}       %d-%m-%Y


#locators for employee group life assurance tab
${employee_group_life_cover_details_header_label}            xpath=(//*[@data-testid="wci-insurance-tab-WCLEmployeesGroupLifeAssurance"]//duet-heading)[1]
${employee_group_life_cover_details_description_label}       xpath=(//*[@data-testid="wci-insurance-tab-WCLEmployeesGroupLifeAssurance"]//duet-paragraph)[1]
${employee_group_life_what_is_insured_header_label}          xpath=(//*[@data-testid="wci-insurance-tab-WCLEmployeesGroupLifeAssurance"]//duet-heading)[2]    
${employee_group_life_contract_section_insured_card}                             xpath=(//*[@data-testid="card-info-item-Insured"])[2]
${employee_group_life_contract_section_insurer_card}                              xpath=(//*[@data-testid="card-info-item-Insurer"])[2]
${employee_group_life_contract_section_validity_card}                             xpath=(//*[@data-testid="card-info-item-Validity"])[2]
${employee_group_life_validity_card_displayed_date}                             xpath=(//*[@data-testid="card-info-item-Validity"]//div)[5]
${employee_group_life_estimate_salary_card_estimated_salary_label}               xpath=(//*[@data-testid="card-info-item-Estimated salary for the current period"]//div)[5]
${employee_group_life_estimate_salary_card_estimated_salary_value}               xpath=(//*[@data-testid="card-info-item-Estimated salary for the current period"]//div)[6]
${employee_group_life_insuredcard_insured_label}                                  xpath= (//*[@data-testid="card-info-item-Insured"]//div)[3]
${employee_group_life_insuredcard_insured_value}                                  xpath=(//*[@data-testid="card-info-item-Insured"]//div)[4]
${employee_group_life_insurer_card_insurer_label}                                xpath=(//*[@data-testid="card-info-item-Insurer"]//div)[3]
${employee_group_life_insurer_card_insurer_value}                                xpath=(//*[@data-testid="card-info-item-Insurer"]//div)[4]
${readmorelinktext}                                                                xpath=(//*[@data-testid="wci-insurance-tab-WCLEmployeesGroupLifeAssurance"]//ng-component)[3]
${what_is_insured_card_expandable}                                                 xpath=(//*[@data-testid="insured-info-section-card"])[2]
${what_is_insured_header_label}                                                    xpath=((//*[@data-testid="generic-collapsible-heading-title-what-is-insured"])[2])
${what_is_insured_description_label}                                               xpath=((//*[@data-testid="generic-collapsible-heading-description-what-is-insured"])[2])
${you_are_covered_for_label_employeegrouplife}                                   xpath=((//*[@data-testid="insured-info-title-you-are-covered-for"])[2])
${death_benefit_label}                                                             xpath=//*[@data-testid="insured-info-collapsible-content-title-deathCoverage"]
${death_benefit_expandable_text_paragraph1}                                        xpath=(//*[@data-testid="insured-info-collapsible-content-title-deathCoverage"]//lt-paragraph)[1]
${death_benefit_expandable_text_paragraph2}                                        xpath=(//*[@data-testid="insured-info-collapsible-content-title-deathCoverage"]//lt-paragraph)[2]
${what_is_not_insured_label}                                                       xpath=(//*[@data-testid="insured-info-title-what-is-not-covered"])[2]

*** Keywords ***


navigate_to_policy_details_lahitapiola
    ${policy_number}=        Read Cell    ${sheet_name}    LTPolicynumber
    ${contract_no}=          Set Variable    (//*[contains(text(),'${policy_number}')])[1]
    Scroll To Element        ${contract_no}
   # Sleep   5  
    Click                    ${contract_no}
    
    #Click                   ${back_button_wci_details_page}
    ##Scroll To Element      ${contract_no}
    #Click                   ${contract_no}
    
    Highlight Elements       ${wci_detail_page_main_label}

verify_wci_hero_area
    [Documentation]          WCI Hero area validations
    Wait For Elements State  ${wci_detail_page_main_label}    visible    timeout=10s
    Get Text                 ${wci_detail_page_main_label}
    Get Text                 ${policyholder_label}
    Get Text                 ${policy_number_label}
    Get Text                 ${period_label}
    Get Text                 ${wci_detail_page_main_label}

verify_back_button_functionality_and_generic_text_to_description_field_displayed_in_hero_area
    [Documentation]          click action of back button from policy details page to policy list page
    Wait For Elements State  ${employees_label}    visible    timeout=10s
    VerifyWebContent         workers-compensation-insurance     1hXUqLts47UF4KKT9gw9EW    value     ${employees_label}
    Get Text                 ${wci_detail_page_main_label}
    Click                    ${back_button_wci_details_page}
    Get Text                 ${insurance_tab}

verify_expired_policy_displayed_in_next_year_is_displayed_with_mandatory_coverage_only

    Get Text                 ${policy_level_banner}
    Click                    ${mandatory_wci_tab}
    Get Text                 ${policy_ended_date_badge_in_period_section_for_mandatory_tab_to_be_valid}

    ${is_not_visible}=       Run Keyword And Return Status    Wait For Elements State    ${employee_group_life_wci_tab}    hidden    timeout=3s
    IF    ${is_not_visible}
        Log                 Element is not displayed.
    ELSE
        Fail                Element is visible when it should not be.
    END
    


verify_wci_policy_details_page_contentfulverification_for_active_policy
    [Documentation]          Verify WCI Policy details page contentfulverification for active policy
    VerifyWebContent         workers-compensation-insurance     1hXUqLts47UF4KKT9gw9EW    value     ${employees_label}
    VerifyWebContent         workers-compensation-insurance     7oTg6dcuXo8EhjlzgpNeZu    text      ${download_certificate_text_active_policy}
    VerifyWebContent         workers-compensation-insurance     2VACn1XA5AQqzvGoxNCjWF    text      ${classes_of_occupations_and_estimated_salaries_link_active_policy}
    VerifyWebContent         workers-compensation-insurance     4gEAuuDyB5QuQnGSVUXyHl    text      ${invoices_link_text_active_policy}
    VerifyWebContent         workers-compensation-insurance     30jIhSFPMkBcpTTZN9NdiR    text      ${make_a_claim_link_text_active_policy}
    VerifyWebContent         workers-compensation-insurance     2UL58im0oj4rcMwUUhIM70    text      ${online_service_support_link_text_active_policy}
    VerifyWebContent         workers-compensation-insurance     4ippD7S0vahtmBYftbudc3    value     ${summary_tab}
    VerifyWebContent         workers-compensation-insurance     7wS74mYvey6lVqaXb4bROo    tabHeading    ${mandatory_wci_tab}
    VerifyWebContent         workers-compensation-insurance     2ypglQZDPjXGVZ2BFuesQl    tabHeading    ${employee_group_life_wci_tab}
    VerifyWebContent         workers-compensation-insurance     4eVqQGaEiToK9v4X6bBq2G    tabHeading    ${voluntary_wci_tab}
    VerifyWebContent         workers-compensation-insurance     3f6rJfgkym4WQPeF3YdAcL    value     ${insurance_premium_to_be_paid_label}
    VerifyWebContent         workers-compensation-insurance     b42ad0d3-dbba-47e5-b071-0b8a02999a7d    value    ${insurance_recipient_of_documents_and_messages_section_in_contract_section_label}
    VerifyWebContent         workers-compensation-insurance     1glMiAKBB2tQwU4CgblywU    value     ${insurancecard_info_item_estimated_salary_for_the_current_period_label}  
    Get Text                 ${insurance_card_estimated_salary_amount_in_ui} 
    VerifyWebContent         workers-compensation-insurance     51Q72KM7xGc73Yxx0iNCs6    value     ${insurance_card_industry_name_title_label}  
    Get Text                 ${industry_card_industry_name_from_gw}          
    

verify_quick_links_for_an_active_policy
    [Documentation]          Verify quick links displayed in hero area
    Get Text                 ${quicklinks_header}    
    Log                      ${quicklinks_header}
    Get Text                 ${download_certificate_text_active_policy}
    Log                      ${download_certificate_text_active_policy}
    Get Text                 ${classes_of_occupations_and_estimated_salaries_link_active_policy}
    Get Text                 ${invoices_link_text_active_policy}
    Get Text                 ${make_a_claim_link_text_active_policy}
    Get Text                 ${online_service_support_link_text_active_policy}

navigate_to_policy_details_turva
    ${policy_number} =    Read Cell    ${sheet_name}    TurvaPolicynumber
    ${contract_no}=       Set Variable    (//*[contains(text(),'${policy_number}')])[1]
    Click                    ${contract_no}
   # Click    ${back_button_wci_details_page}
   # Click    ${contract_no}
    Highlight Elements       ${wci_detail_page_main_label}



verify_quick_links_for_an_scheduled_policy          
    [Documentation]       Verify Quick links for an Scheduled policy (In this case we hide download certificate link and claims link) 
    Get Text               ${quicklinks_header}
    Get Text               ${classes_of_occupations_and_estimated_salaries_link_scheduled_policy}
    Get Text               ${invoices_linktext_scheduled_policy}
    Get Text               ${online_service_support_link_text_scheduled_policy} 


verify_summary_section_for_a_scheduled_policy_with_all_3_coverages 
    [Documentation]      Here we are validating the summary section of policy set to valid
    ${displayed_date}=    Get Text     ${policy_date}
    ${today}=    Get Current Date    result_format=%Y-%m-%d
       
    Should Not Be Empty    ${policy_level_banner} 
    

    #${start-date}=     Substring ${displayed_date}   0     10
    #Should Be True    ${start-date} > ${today}  
    Scroll To Element            ${contractsectiontable}  
    Get Text                    ${contractsectiontable}                                          
    Get Text             ${contract_section_expandable_and_collapsible_component}
    Get Text               ${policyholder_section_in_contract_section}                       
    Get Text              ${policynumber_section_in_contract_section}                      
    Get Text       ${policyperiod_section_in_contract_section}                        
    Get Text          ${insurance_premium_to_be_paid_section_in_contract_section} 
    Get Text            ${insurance_premium_value_times_year_displayed}        
    Get Text          ${insurance_recipient_of_documents_and_messages_section_in_contract_section}    
    Get Text           ${insurance_card_info_item_industry_section_in_contract_section}             
    Get Text              ${insurancecard_info_item_estimated_salary_for_the_current_period}           
    Get Text            ${insurancesheader_in_summary_section}      
    Scroll To Element                ${insuranceheader_description_in_summary_section}                             
    Get Text             ${insuranceheader_description_in_summary_section}                          
    Get Text           ${insurance_category_link_mandatory_workers_compensation_insurance}       
    Get Text            ${insurance_category_link_employees_group_life_assurance}                
    Get Text            ${insurance_category_link_voluntary_workers_compensation_insurance}


verify_summary_section_for_a_scheduled_policy_with_mandatory_coverage_only
    [Documentation]      Here we are validating the summary section of policy set to valid having signle coverage mandatory insurance
    ${displayed_date}=    Get Text     ${policy_date}
    ${today}=    Get Current Date    result_format=%Y-%m-%d
    Get Text    ${policy_start_date_badge_in_period_section_for_mandatory_tab_to_be_valid} 
    Get Text   ${policy_level_banner} 
    

    #${start-date}=     Substring ${displayed_date}   0     10
    #Should Be True    ${start-date} > ${today}  
    Scroll To Element            ${contractsectiontable}  
    Get Text                    ${contractsectiontable}                                          
    Get Text             ${contract_section_expandable_and_collapsible_component}
    Get Text               ${policyholder_section_in_contract_section}                       
    Get Text              ${policynumber_section_in_contract_section}                      
    Get Text       ${policyperiod_section_in_contract_section}                        
    Get Text          ${insurance_premium_to_be_paid_section_in_contract_section}  
    Get Text            ${insurance_premium_value_times_year_displayed}       
    Get Text          ${insurance_recipient_of_documents_and_messages_section_in_contract_section}    
    Get Text           ${insurance_card_info_item_industry_section_in_contract_section}             
    Get Text              ${insurancecard_info_item_estimated_salary_for_the_current_period}           
    Get Text            ${insurancesheader_in_summary_section}      
    Scroll To Element                ${insuranceheader_description_in_summary_section}                             
    Get Text             ${insuranceheader_description_in_summary_section}                          
    Get Text           ${insurance_category_link_mandatory_workers_compensation_insurance}       
 
     
verify_quick_links_for_cancelled_policy
    [Documentation]       Verify Quick links for an Cancelled policy (in this case all other links except download certificates will be displayed) 
    Get Text               ${quicklinks_header}
    Get Text               ${classes_of_occupations_and_estimated_salaries_link_cancelled_policy}
    Get Text               ${invoices_linktext_cancelled_policy}
    Get Text               ${online_service_support_link_text_cancelled_policy} 
    Get Text                ${make_a_claim_linktext_cancelled_policy} 

verify_quick_links_for_to_be_cancelled_policy
    [Documentation]       Verify Quick links for to be  Cancelled policy (in this case all links will be displayed as in active policy) 
    Get Text   ${quicklinks_header}    
    Log        ${quicklinks_header}
    Get Text   ${download_certificate_text_active_policy}
    Log        ${download_certificate_text_active_policy}
    Get Text   ${classes_of_occupations_and_estimated_salaries_link_active_policy}
    Get Text   ${invoices_link_text_active_policy}
    Get Text   ${make_a_claim_link_text_active_policy}
    Get Text   ${online_service_support_link_text_active_policy}
verify_summary_section_for_a_cancelled_policy
    [Documentation]      Here we are validating the summary section of cancelled policy
    ${displayed_date}=    Get Text     ${policy_date}
    ${today}=    Get Current Date    result_format=%Y-%m-%d
       
    Should Not Be Empty    ${policy_level_banner} 
    

    #${start-date}=     Substring ${displayed_date}   0     10
    #Should Be True    ${start-date} > ${today}  
    Scroll To Element            ${contractsectiontable}  
    Get Text            ${contractsectiontable}                                          
    Get Text             ${contract_section_expandable_and_collapsible_component}
    Get Text               ${policyholder_section_in_contract_section}                       
    Get Text              ${policynumber_section_in_contract_section}                      
    Get Text       ${policyperiod_section_in_contract_section}                        
    Get Text          ${insurance_premium_to_be_paid_section_in_contract_section}  
    Get Text            ${insurance_premium_value_times_year_displayed}       
    Get Text          ${insurance_recipient_of_documents_and_messages_section_in_contract_section}    
    Get Text           ${insurance_card_info_item_industry_section_in_contract_section}             
    Get Text              ${insurancecard_info_item_estimated_salary_for_the_current_period}           
    Get Text            ${insurancesheader_in_summary_section}      
    Scroll To Element                ${insuranceheader_description_in_summary_section}                             
    Get Text             ${insuranceheader_description_in_summary_section}                          
    Get Text           ${insurance_category_link_mandatory_workers_compensation_insurance}       
    Get Text            ${insurance_category_link_employees_group_life_assurance}                
    Get Text            ${insurance_category_link_voluntary_workers_compensation_insurance}
verify_summary_section_for_active_policy_for_3_coverages
    [Documentation]       Verify Summary section for the active policy(Testcases to verify the contract and summary section)
    Sleep    3
    Scroll To Element            ${contractsectiontable}  
    Get Text            ${contractsectiontable}                                          
    Get Text         ${contract_section_expandable_and_collapsible_component}
    Get Text               ${policyholder_section_in_contract_section}                       
    Get Text              ${policynumber_section_in_contract_section}                      
    Get Text       ${policyperiod_section_in_contract_section}                        
    Get Text          ${insurance_premium_to_be_paid_section_in_contract_section}        
    Get Text            ${insurance_premium_value_times_year_displayed} 
    Get Text          ${insurance_recipient_of_documents_and_messages_section_in_contract_section}    
    Get Text           ${insurance_card_info_item_industry_section_in_contract_section}             
    Get Text              ${insurancecard_info_item_estimated_salary_for_the_current_period}           
    Get Text            ${insurancesheader_in_summary_section}      
    Scroll To Element                ${insuranceheader_description_in_summary_section}                             
    Get Text             ${insuranceheader_description_in_summary_section}           
    Sleep    2               
    Get Text             ${insurance_category_link_mandatory_workers_compensation_insurance}          
    Get Text            ${insurance_category_link_employees_group_life_assurance}                
    Get Text            ${insurance_category_link_voluntary_workers_compensation_insurance} 
                  

verify_the_tab_switching_functionality_in_policy_details_page_for_all_coverage_tabs 
    [Documentation]       Verify redirection to coverage tab from coverage links in contract section
     Wait For Elements State    ${contractsectiontable}
     Scroll To Element    ${insurance_category_link_mandatory_workers_compensation_insurance}
     #Click    ${insurance_category_link_mandatory_workers_compensation_insurance}
     #Sleep    3
     ${count}    Get Element Count    ${summary_tab}
     Log    ${count}
     Click    ${summary_tab}
     Scroll To Element    ${insurance_category_link_employees_group_life_assurance}
     Click    ${insurance_category_link_employees_group_life_assurance}
     Click    ${summary_tab}
     Scroll To Element    ${insurance_category_link_voluntary_workers_compensation_insurance}
     Click    ${insurance_category_link_voluntary_workers_compensation_insurance}
     Click    ${mandatory_wci_tab}
     Click    ${employee_group_life_wci_tab}
     Click    ${voluntary_wci_tab}
     Click    ${summary_tab}


verify_mandatory_wci_section_for_active_policy
    [Documentation]       Verify MandatoryWCI section for the active policy
    
    Click                    ${employee_group_life_wci_tab}
    Click                    ${mandatory_wci_tab}


verify_employee_grouplifeassurance_tab_for_active_policy
    Click                    ${employee_group_life_wci_tab}


verify_the_premium_and_payment_section_in_summary_tab_for_active_policy_with_mandatory_coverage_only
    [Documentation]       This script will check if the particular section is displayed in UI with the types of coverages in the coverage list.
    Get Text                 ${premium_and_payment_card}
    Click                     ${premium_and_payment_card}
    Highlight Elements       ${premium_and_payment_card}
    Click                    ${mandatory_workers_compensation_insurance_voluntary_workers_compensation_insurance_expandabile_text}  
    Get Text                 ${mandatory_workers_compensation_insurance_voluntary_workers_compensation_insurance_expandabile_text}  
    Get Text                 ${policy_payer_for_mandatory_and_voluntary_insurance_card}
    Get Text                 ${policy_period_mandatory_and_voluntary_insurance_insurance_card}
    Log                      Get ${policy_payer_for_mandatory_and_voluntary_insurance_card}
    Log                      Get${policy_period_mandatory_and_voluntary_insurance_insurance_card}
    Get Text                 ${total_price_breakdown_section_with_cost} 

wci_policy_group_life_assurance_and_voluntary_workers_compensation_insurance_cancelled_in_gw_for_current_year
    Get Text                 ${dismisiblecoverage_ended_banner_for_employee_grouplife}
    Get Text                 ${dismissiblecoverage_ended_banner_for_voluntary}
    Click                    ${employee_group_life_wci_tab}
    Click                    ${voluntary_wci_tab}
    
    
verify_the_document_section_in_summary_tab_for_to_be_cancelled_policy
    [Documentation]       Verify Document section functionalitites for to be cancelled policy
    Click                    ${document_section_card}
    Get Text                 ${document_section_description}
    Log                      Document description is displayed:${document_section_description}
    Click                    ${document_section_insurance_policy_expandible_text}  
    Click                    ${document_section_terms_and_condition_and_product_spec_expandible_text}
    Highlight Elements       ${document_section_card}

verify_the_premium_and_payment_section_in_summary_tab_for_to_be_cancelled_policy
    [Documentation]       This script will check if the particular section is displayed in UI with the types of coverages in the coverage list.
    Get Text                 ${premium_and_payment_card}
    Click                     ${premium_and_payment_card}
    Highlight Elements       ${premium_and_payment_card}
    Click                    ${mandatory_workers_compensation_insurance_voluntary_workers_compensation_insurance_expandabile_text}  
    Get Text                 ${mandatory_workers_compensation_insurance_voluntary_workers_compensation_insurance_expandabile_text}  
    Get Text                 ${policy_payer_for_mandatory_and_voluntary_insurance_card}
    Get Text                 ${policy_period_mandatory_and_voluntary_insurance_insurance_card}
    Log                      Get ${policy_payer_for_mandatory_and_voluntary_insurance_card}
    Log                      Get${policy_period_mandatory_and_voluntary_insurance_insurance_card}
    Click                    ${employee_group_life_worker_compensation_insurance_expandabile_text}  
    Get Text                 ${policy_payer_for_employee_group_card}                         
    Get Text                 ${policy_period_for_employee_group_insurance_card} 
    Click                    ${employee_group_life_worker_compensation_insurance_expandabile_text}                 
    ${occurance_of_employee_group_life_in_coverage_list}=    Get Element States    ${employee_group_life_insurances_in_coverage_list_in_payment_section} 
    log                      EmployeegrouplifeCIinpremiumlist visibility: ${occurance_of_employee_group_life_in_coverage_list}  

verify_the_premium_and_payment_section_in_summary_tab_for_active_policy
    [Documentation]       This script will check if the particular section is displayed in UI with the types of coverages in the coverage list.
    Get Text                 ${premium_and_payment_card}
    Click                     ${premium_and_payment_card}
    Highlight Elements       ${premium_and_payment_card}
    Click                    ${mandatory_workers_compensation_insurance_voluntary_workers_compensation_insurance_expandabile_text}  
    Get Text                 ${mandatory_workers_compensation_insurance_voluntary_workers_compensation_insurance_expandabile_text}  
    Get Text                 ${policy_payer_for_mandatory_and_voluntary_insurance_card}
    Get Text                 ${policy_period_mandatory_and_voluntary_insurance_insurance_card}
    Log                      Get ${policy_payer_for_mandatory_and_voluntary_insurance_card}
    Log                      Get${policy_period_mandatory_and_voluntary_insurance_insurance_card}
    Click                    ${employee_group_life_worker_compensation_insurance_expandabile_text}  
    Get Text                 ${policy_payer_for_employee_group_card}                         
    Get Text                 ${policy_period_for_employee_group_insurance_card} 
    Click                    ${employee_group_life_worker_compensation_insurance_expandabile_text}                 
    ${occurance_of_employee_group_life_in_coverage_list}=    Get Element States    ${employee_group_life_insurances_in_coverage_list_in_payment_section} 
    log                      EmployeegrouplifeCIinpremiumlist visibility: ${occurance_of_employee_group_life_in_coverage_list}



verify_the_premium_and_payment_section_in_summary_tab_for_a_scheduled_policy
    [Documentation]       This script will check if the particular section is displayed in UI with the types of coverages in the coverage list.
    Get Text                 ${premium_and_payment_card}
    Click                     ${premium_and_payment_card}
    Highlight Elements       ${premium_and_payment_card}
    Click                    ${mandatory_workers_compensation_insurance_voluntary_workers_compensation_insurance_expandabile_text}  
    Get Text                 ${mandatory_workers_compensation_insurance_voluntary_workers_compensation_insurance_expandabile_text}  
    Get Text                 ${policy_payer_for_mandatory_and_voluntary_insurance_card}
    Get Text                 ${policy_period_mandatory_and_voluntary_insurance_insurance_card}
    Log                      Get ${policy_payer_for_mandatory_and_voluntary_insurance_card}
    Log                      Get${policy_period_mandatory_and_voluntary_insurance_insurance_card}
   # ${mandatory_wci_inpremiumlist_is_visible}=    Get Element States    ${mandatory_insurances_in_coverage_list_in_payment_section}    
    #Log    MandatoryWCIinpremiumlist visibility: ${mandatory_wci_inpremiumlist_is_visible} 
   # ${voluntary_wci_inpremiumlist_is_visible}=     Get Element States  ${voluntary_insurance_in_coverage_list_in_payment_section}   
    #Log    VoluntaryCIinpremiumlist visibility: ${voluntary_wci_inpremiumlist_is_visible} 
    Click                    ${employee_group_life_worker_compensation_insurance_expandabile_text}  
    Get Text                 ${policy_payer_for_employee_group_card}                         
    Get Text                 ${policy_period_for_employee_group_insurance_card} 
    Click                    ${employee_group_life_worker_compensation_insurance_expandabile_text}                 
    ${occurance_of_employee_group_life_in_coverage_list}=    Get Element States    ${employee_group_life_insurances_in_coverage_list_in_payment_section} 
    log                      EmployeegrouplifeCIinpremiumlist visibility: ${occurance_of_employee_group_life_in_coverage_list}


verify_the_premium_and_payment_section_in_summary_tab_cancelled_policy
    [Documentation]       This script will check if the particular section is displayed in UI with the types of coverages in the coverage list.
    Get Text                 ${premium_and_payment_card}
    Click                     ${premium_and_payment_card}
    Highlight Elements       ${premium_and_payment_card}
    Click                    ${mandatory_workers_compensation_insurance_voluntary_workers_compensation_insurance_expandabile_text}  
    Get Text                 ${mandatory_workers_compensation_insurance_voluntary_workers_compensation_insurance_expandabile_text}  
    Get Text                 ${policy_payer_for_mandatory_and_voluntary_insurance_card}
    Get Text                 ${policy_period_mandatory_and_voluntary_insurance_insurance_card}
    Log                      Get ${policy_payer_for_mandatory_and_voluntary_insurance_card}
    Log                      Get${policy_period_mandatory_and_voluntary_insurance_insurance_card}
   # ${mandatory_wci_inpremiumlist_is_visible}=    Get Element States    ${mandatory_insurances_in_coverage_list_in_payment_section}    
    #Log    MandatoryWCIinpremiumlist visibility: ${mandatory_wci_inpremiumlist_is_visible} 
   # ${voluntary_wci_inpremiumlist_is_visible}=     Get Element States  ${voluntary_insurance_in_coverage_list_in_payment_section}   
    #Log    VoluntaryCIinpremiumlist visibility: ${voluntary_wci_inpremiumlist_is_visible} 
    Click                    ${employee_group_life_worker_compensation_insurance_expandabile_text}  
    Get Text                 ${policy_payer_for_employee_group_card}                         
    Get Text                 ${policy_period_for_employee_group_insurance_card} 
    Click                    ${employee_group_life_worker_compensation_insurance_expandabile_text}                 
    ${occurance_of_employee_group_life_in_coverage_list}=    Get Element States    ${employee_group_life_insurances_in_coverage_list_in_payment_section} 
    log                      EmployeegrouplifeCIinpremiumlist visibility: ${occurance_of_employee_group_life_in_coverage_list}


 verify_the_contract_ending_banner_is_displayed_for_to_be_cancelled_policies    
      [Documentation]     Validating the contract banner is displayed with end date for the policy
      Highlight Elements    ${policy_level_banner}
      Get Text     ${policy_level_banner}
      #Run Keyword If    "${Lang}" == "EN" 
      #...    ${policy_level_banner}    matches    Contract ends 13.05.2025
      #...  ELSE IF    "${Lang}" == "FI" 
      #...      ${policy_level_banner}    matches    Sopimus päättyy  13.05.2025
      #...  ELSE
      #...     ${policy_level_banner}    matches    Avtal upphör 13.05.2025
          


verify_the_mandatory_tab_validations_with_contentful_validations
    [Documentation]  validation begins once the user is navigated to mandatory Tab 
    Click                    ${mandatory_wci_tab}  
    Scroll To Element        ${coverdetails_card_locator}
    Highlight Elements       ${coverdetails_card_locator}
    Get Text                ${cover_details_label}
    VerifyWebContent         workers-compensation-insurance     uwn79lw44C4ppCHE7SdGx    value    ${cover_details_label}
    VerifyWebContent         workers-compensation-insurance     7w45ASl052raVR5jRcBQcL    value    ${cover_details_description_label}
    VerifyWebContent         workers-compensation-insurance     5WB87908oe8nxWzbPyRVi5    value    ${payment_type_label_for_table_tariff}
    Get Text                 ${coverdetails_card_locator}                   
    Get Text                 ${cover_details_label}                         
    Get Text                 ${cover_details_description_label}               
    Get Text                 ${estimated_salary_for_current_period_section}    
    Get Text                 ${insured_section_in_mandatory_tab}                
    Get Text                 ${insurer_section_in_mandatory_tab}                
    Get Text                 ${payment_system_section_in_mandatory_tab} 
    Get Text                 ${validity_section_in_mandatory_tab}         

wci_policy_having_two_coverages_mandatory_workers_compensation_insurance_and_the_employees_group_life_assurance
    [Documentation]    Validating the tab switching 
    Click                    ${insurance_category_link_mandatory_workers_compensation_insurance}
    Click                    ${summary_tab}
    Click                    ${insurance_category_link_employees_group_life_assurance}


verify_what_is_insured_section_with_contentful_validations_under_mandatory_tab_for_multiple_coverage
    [Documentation]  validation for what is insured and expandible text under mandatory tab 
    Click                    ${mandatory_wci_tab}
    Scroll To Element        ${what_is_insured_card_locator}
    Click                    ${what_is_insured_header_description}
    VerifyWebContent         workers-compensation-insurance     8208f289-f674-4373-b8b3-53dd68096586    value    ${what_is_insured_header_label}
    VerifyWebContent         workers-compensation-insurance     28yAVR94wwhdiPMmqM2kp3    value    ${what_is_insured_header_description}
    Get Text                 ${you_are_covered_for_title_label}
    Get Text                 ${you_are_covered_covered_for_description}
   
    Get Text                 ${you_are_covered_expandible_description_text}                   
    Get Text                 ${you_are_not_covered_for_title_label}                         
    Click                   ${employee_group_life_wci_tab}

verify_the_policy_with_a_mandatory_workers_compensation_insurance_displays_the_payment_type_as_helmi_with_cut_off_value_in_ui
    [Documentation]  validation for the policy where the coverage is displayed with payment type is helmi and cutoff value 
     Click                    ${mandatory_wci_tab}
     Highlight Elements       ${payment_system_type_as_helmi}       
     Highlight Elements       ${cut_off_limit_card_in_mandatory_tab}
     Get Text                 ${payment_system_type_as_helmi}
    VerifyWebContent         workers-compensation-insurance     4G90gJnfZaupsQ9tsg7VoH    value    ${helmi_payment_type}    

verifying_customer_views_price_and_payment_section_with_same_payer_for_mandatory_wci_and_employee_group_life    
    [Documentation]    We are validating the UI for a policy where the payer of coverages and the policy holder is the company itself    
     Scroll To Element        ${premium_and_payment_card}
     Click                    ${premium_and_payment_card}
     ${policy_holder_name_in_contract_section}=    Get Text    ${policy_holder_label_in_policy_holder_section}
     ${policy_holder_name_label_under_mandatory_payment_breakdown}=     Get Text        ${policy_payer_name_label_for_mandatory_section_in_payment_breakdown}
     ${policy_holder_name_label_under_employee_grouplife_payment_breakdown}=    Get Text    ${policy_payer_name_label_in_employee_group_life_in_payment_section}  
    Should Be Equal   ${policy_holder_name_in_contract_section}  ${policy_holder_name_label_under_mandatory_payment_breakdown}


verifying_the_policy_end_date_badge_and_notification_banner_is_displayed_for_a_policy_coverage_going_to_end_in_mandatory_section
    [Documentation]        In this test case we valdiate if the end date banner and badge is displayed for the ${Policy date}
    Click   ${mandatory_wci_tab}
    Get Text                 ${policy_level_banner}
    Get Text                 ${policy_end_date_badge_in_period_section_for_mandatory_tab_tobecancelled}

verifying_the_policy_start_date_badge_and_notification_banner_is_displayed_for_a_policy_coverage_going_to_start_in_mandatory_section
    [Documentation]        In this test case we valdiate if the end date banner and badge is displayed for the ${Policy date}
    Click   ${mandatory_wci_tab}
    Get Text                 ${policy_level_banner}
    Get Text                 ${policy_start_date_badge_in_period_section_for_mandatory_tab_to_be_valid}

verifying_the_policy_ended_date_badge_and_notification_banner_is_displayed_for_a_policy_coverage_cancelled_in_mandatory_section
    [Documentation]        In this test case we valdiate if the end date banner and badge is displayed for the ${Policy date}
    Click   ${mandatory_wci_tab}
    Get Text                 ${policy_level_banner}
    Get Text                 ${policy_ended_date_badge_in_period_section_for_mandatory_tab_to_be_valid}   



verify_the_date_displayed_is_future_date_for_the_policy
    Get Text                 ${policy_date}
    ${date_range}    Set Variable    ${policy_date}
    ${start_date}    Get Substring    ${date_range}    0    10
    Log                      Start Date: ${start_date}
    Get Text                 ${policy_start_date_badge_in_period_section_for_summary_tab_to_be_valid}   


verifying_the_alerts_are_displayed_for_coverages
    ${alerts}=    Get Element Count    .alert
    Get Text                 ${dismisiblecoverage_ended_banner_for_employee_grouplife}    
   Get Text                 ${dismissiblecoverage_ended_banner_for_voluntary}          

verifying_employee_grouplifeassurance_contract_section
     Click                    ${employee_group_life_wci_tab}
     Scroll To Element        ${employee_group_life_contract_section_insurer_card}
     Get Text                 ${employee_group_life_cover_details_header_label}           
     Get Text                 ${employee_group_life_cover_details_description_label}       
     Get Text                 ${employee_group_life_what_is_insured_header_label}            
     Get Text                 ${employee_group_life_contract_section_insured_card}                             
     Get Text                 ${employee_group_life_contract_section_insurer_card}                              
     Get Text                 ${employee_group_life_contract_section_validity_card}                             
     Get Text                 ${employee_group_life_validity_card_displayed_date}                             
     Get Text                 ${employee_group_life_estimate_salary_card_estimated_salary_label}               
     Get Text                 ${employee_group_life_estimate_salary_card_estimated_salary_value}               
     Get Text                 ${employee_group_life_insuredcard_insured_label}                                 
     Get Text                 ${employee_group_life_insuredcard_insured_value}                                 
     Get Text                 ${employee_group_life_insurer_card_insurer_label}                                
     Get Text                 ${employee_group_life_insurer_card_insurer_value}     
     Get Text                 ${readmorelinktext}

    IF  "${Lang}" == "EN"
        Click                    ${readmorelinktext}
        Switch Page    NEW  
        ${current_url}=    Get Url
        Should Be Equal    ${current_url}    ${expected_url_in_english}
    ELSE IF     "${Lang}" == "FI"
        Click                    ${readmorelinktext}
        Switch Page    NEW  
        ${current_url}=    Get Url
        Should Be Equal    ${current_url}    ${expected_url_in_finnish}
    ELSE 
        Click                    ${readmorelinktext}
        Switch Page    NEW  
        ${current_url}=    Get Url
        Should Be Equal    ${current_url}    ${expected_url_in_swedish}
        
    END
   

verify_the_insured_section_in_employee_group_life_assurance 
    [Documentation]    Verifying the what is insured section 
   Click                    ${employee_group_life_wci_tab}
   VerifyWebContent         workers-compensation-insurance     8208f289-f674-4373-b8b3-53dd68096586    value    ${what_is_insured_header_label}
   VerifyWebContent         workers-compensation-insurance     28yAVR94wwhdiPMmqM2kp3    value    ${what_is_insured_header_description}
   Click                    ${what_is_insured_card_expandable}
   VerifyWebContent         workers-compensation-insurance     2uv2l2epgqKBMABi6EZgiZ    value    ${you_are_covered_for_title_label}
   VerifyWebContent         workers-compensation-insurance     2uv2l2epgqKBMABi6EZgiZ    value    ${you_are_covered_for_title_label}
    Get Text                 ${death_benefit_label}
    Get Text                 ${death_benefit_expandable_text_paragraph1}
    Get Text                 ${death_benefit_expandable_text_paragraph2}


verify_the_contract_start_banner_is_displayed_for_the_2_coverages_set_to_valid    
    Get Text                 ${policy_level_banner}
    Click                    ${mandatory_wci_tab}
    Click                    ${employee_group_life_wci_tab}





















