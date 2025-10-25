*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/variables.robot

*** Keywords ***
Open Browser And Setup
    [Documentation]    Opens browser and sets up window size
    [Arguments]        ${url}=${BASE_URL}    ${browser}=${BROWSER}
    
    # Simple configuration with automatic driver downloads
    IF    '${browser}' == 'chrome'
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
        Run Keyword If    ${HEADLESS}    Call Method    ${options}    add_argument    --headless
        Call Method    ${options}    add_argument    --no-sandbox
        Call Method    ${options}    add_argument    --disable-dev-shm-usage
        Call Method    ${options}    add_argument    --disable-gpu
        Open Browser    ${url}    ${browser}    options=${options}
    ELSE
        Open Browser    ${url}    ${browser}
    END
    
    Maximize Browser Window
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}

Close Browser And Cleanup
    [Documentation]    Closes browser
    Close Browser

Navigate To Page
    [Documentation]    Navigates to specific page
    [Arguments]        ${url}
    Go To              ${url}

Verify Element Is Visible
    [Documentation]    Verifies that element is visible on page
    [Arguments]        ${locator}    ${timeout}=${EXPLICIT_WAIT}
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}

Verify Page Contains Text
    [Documentation]    Verifies that page contains specific text
    [Arguments]        ${text}
    Page Should Contain    ${text}

Click Element And Wait
    [Documentation]    Clicks specified element
    [Arguments]        ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element      ${locator}

Verify Page URL
    [Documentation]    Verifies that current URL matches expected
    [Arguments]        ${expected_url}
    Location Should Be    ${expected_url}
