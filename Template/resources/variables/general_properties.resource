*** Settings ***
Documentation    Contains variables used in TestSuite.

*** Variables ***
${ENV}                          SIT
${Lang}                         EN
${APP}                          LAHITAPIOLA

${BROWSER_BrowserStack}         chromium
${BROWSER_Local}                chromium
${Browserstack_Execution}       False
${Bank_Selected}                Nordea

@{available_ENV}                SIT    UAT    PROD
@{available_APP}                TURVA    LAHITAPIOLA
@{available_BROWSER}            chromium    firefox    webkit
@{Bank_Available}               Nordea    OP
@{Languages}                    EN    SV    FI

# URLs
${SIT_TURVA_URL}                https://sit2yritys.turva.fi/yrd/#/
${SIT_LAHITAPIOLA_URL}          https://sit2yritys.lahitapiola.fi/yrd/#/
${SSN_generator_URL}            https://telepartikkeli.azurewebsites.net/tunnusgeneraattori
