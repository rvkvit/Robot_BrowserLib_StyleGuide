*** Settings ***
Resource            ../settings.resource
#Library             ../../libraries/contentfulvalidation.py



*** Keywords ***
Test Setup

    # ${cdpURL}=    createCdpUrl   chrome
    # ${platfromDetails}=    getPlatformDetails
    # Connect To Browser    ${cdpURL}
    # Set Browser Timeout    25

    ${viewport}=       getViewportResolution
    ${browserstackExecution}=    Set Variable    ${Browserstack_Execution}
    IF    ${browserstackExecution} == True
        ${cdpURL}=    createCdpUrl    ${BROWSER_BrowserStack}  
        Connect To Browser    ${cdpURL}
        Set Browser Timeout    25
    ELSE
            New Browser    ${BROWSER_Local}    headless=False    args=["--start-maximized"]
            
            New Page
    END
    New Context        viewport=${viewport}
Test Teardown
    [Documentation]    Updates BrowserStack session status and closes the browser

    #  ${test name}=    Set Variable    ${TEST NAME}
    #         ${test status}=  Set Variable    ${TEST STATUS}
    #         Log    Test Name: ${test name}, Test Status: ${test status}
    #         ${platfromDetails}=    getPlatformDetails
    #         SetStatus    ${test status}    ${test name}   
    #         ${sessionName}=    Catenate    ${test name}    ${platfromDetails}
    #         SetSessionName    ${sessionName}
    
    # ${browserstackExecution}=    Set Variable    ${Browserstack_Execution}

    IF    ${browserstackExecution} == True
            ${test name}=    Set Variable    ${TEST NAME}
            ${test status}=  Set Variable    ${TEST STATUS}
            Log    Test Name: ${test name}, Test Status: ${test status}
            ${platfromDetails}=    getPlatformDetails
            SetStatus    ${test status}    ${test name}   
            ${sessionName}=    Catenate    ${test name}    ${platfromDetails}
            SetSessionName    ${sessionName}
        Close Browser    ALL  
    ELSE

        Close Browser    ALL  
    END
    #Update Jira

Update Jira
    ${JiraID} =        Read Cell            TC     JiraID
    ${JiraIDs} =    Split String    ${JiraID}    ,
    ${FolderName} =        Read Cell            TC     FolderName
    ${status} =    Set Variable    ${TEST_STATUS}
    FOR    ${id}    IN    @{JiraIDs}
        IF    '${status}'== 'PASS'
            Update Jira Execution Status    ${id}   ${FolderName}    1
        ELSE
            Update Jira Execution Status    ${id}    ${FolderName}    2
        END
    END

VerifyWebContent
    [Arguments]    ${fields_key}    ${contentful_key}    ${content_label}    ${locator}
    ${value} =     Fetch Content Json  ${fields_key}    ${contentful_key}   ${content_label}   ${APP}  ${Lang}
    Get Text    ${locator}    equal    ${value}
