*** Settings ***
Documentation             A test suite to WCITestScripts

Resource                  ../resources/settings.resource

Suite Setup               Run Setup Only Once    startLocalTunnel
Test Setup                Test Setup
Test Teardown             Test Teardown
Suite Teardown            Run Teardown Only Once    stopLocalTunnel

*** Test Cases ***
WCI Landing page validations for active policy with 3 coverages ${APP}
    [Documentation]        Test case to verify WCI landing page with the test cases includes validation of hero area, quick links ,contentful verification for the sumarry section , premium and payment section;
    [Tags]                Smoke    Regression    Summaryfeature    BS-Integration
    Select Bank Portal And Login
    Navigation from Company selection
    Navigate to InsuranceTab
    Run Keyword If        "${APP}" == "LAHITAPIOLA"        Navigate to Policy details LAHITAPIOLA
    ...                   ELSE IF    "${APP}" == "TURVA"    Navigate to Policy details TURVA
    ...                   ELSE    Log    Unknown application: ${APP}
    Verify WCI Hero area
    Verify Quick links for an Active policy
    Verify WCI Policy details page contentfulverification for active policy
    Verify the premium and payment section in summary tab for active policy

Verify quicklinks for an active policy ${APP}
    [Documentation]        Verifying quick links for a policy with active policy;
    [Tags]                Smoke    Regression    Summaryfeature
    Select Bank Portal And Login
    Navigation from Company selection
    Navigate to InsuranceTab
    Run Keyword If        "${APP}" == "LAHITAPIOLA"        Navigate to Policy details LAHITAPIOLA
    ...                   ELSE IF    "${APP}" == "TURVA"    Navigate to Policy details TURVA
    ...                   ELSE    Log    Unknown application: ${APP}
    Verify WCI Hero area
    Verify Quick links for an Active policy
    Verify Quick links for an Active policy
