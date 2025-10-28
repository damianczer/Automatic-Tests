*** Settings ***
Documentation    Keywords for JavaScript Alerts functionality tests
Library          SeleniumLibrary
Resource         ../resources/variables.robot
Resource         common_keywords.robot

*** Keywords ***
Navigate To JavaScript Alerts Page
    [Documentation]    Navigate to JavaScript Alerts page
    Go To    ${JS_ALERTS_URL}
    Wait Until Page Contains Element    ${JS_ALERT_BUTTON}    timeout=${EXPLICIT_WAIT}
    Wait Until Page Contains Element    ${JS_CONFIRM_BUTTON}    timeout=${EXPLICIT_WAIT}
    Wait Until Page Contains Element    ${JS_PROMPT_BUTTON}    timeout=${EXPLICIT_WAIT}
    Wait Until Page Contains    JavaScript Alerts    timeout=${EXPLICIT_WAIT}

Verify JavaScript Alerts Page Content
    [Documentation]    Verify JavaScript Alerts page contains expected elements
    Page Should Contain    JavaScript Alerts
    Element Should Be Visible    ${JS_ALERT_BUTTON}
    Element Should Be Visible    ${JS_CONFIRM_BUTTON}
    Element Should Be Visible    ${JS_PROMPT_BUTTON}
    Element Should Be Enabled    ${JS_ALERT_BUTTON}
    Element Should Be Enabled    ${JS_CONFIRM_BUTTON}
    Element Should Be Enabled    ${JS_PROMPT_BUTTON}

Click JS Alert Button
    [Documentation]    Click the JS Alert button
    Click Element    ${JS_ALERT_BUTTON}

Click JS Confirm Button
    [Documentation]    Click the JS Confirm button
    Click Element    ${JS_CONFIRM_BUTTON}

Click JS Prompt Button
    [Documentation]    Click the JS Prompt button
    Click Element    ${JS_PROMPT_BUTTON}

Handle Alert And Accept
    [Documentation]    Handle JavaScript alert and accept it
    Alert Should Be Present    action=ACCEPT

Handle Alert And Dismiss
    [Documentation]    Handle JavaScript alert and dismiss it
    Alert Should Be Present    action=DISMISS

Handle Prompt With Text
    [Arguments]    ${text}
    [Documentation]    Handle JavaScript prompt with specific text
    Input Text Into Alert    ${text}    action=ACCEPT

Get Result Text
    [Documentation]    Get the result text after alert handling
    ${result}    Get Text    ${RESULT_TEXT}
    [Return]    ${result}

Verify Result Text
    [Arguments]    ${expected_text}
    [Documentation]    Verify that result text matches expected value
    ${actual_text}    Get Result Text
    Should Be Equal    ${actual_text}    ${expected_text}

Test JS Alert
    [Documentation]    Test JavaScript alert functionality
    Click JS Alert Button
    Handle Alert And Accept
    Verify Result Text    You successfully clicked an alert

Test JS Confirm Accept
    [Documentation]    Test JavaScript confirm with accept
    Click JS Confirm Button
    Handle Alert And Accept
    Verify Result Text    You clicked: Ok

Test JS Confirm Dismiss
    [Documentation]    Test JavaScript confirm with dismiss
    Click JS Confirm Button
    Handle Alert And Dismiss
    Verify Result Text    You clicked: Cancel

Test JS Prompt With Text
    [Arguments]    ${input_text}=Test Input
    [Documentation]    Test JavaScript prompt with text input
    Click JS Prompt Button
    Sleep    1s    # Wait for prompt to appear
    Handle Prompt With Text    ${input_text}
    Verify Result Text    You entered: ${input_text}

Get Page Header Text
    [Documentation]    Get the page header text
    ${header}    Get Text    ${PAGE_HEADER}
    [Return]    ${header}

Verify Page Header
    [Documentation]    Verify the page header is correct
    ${header}    Get Page Header Text
    Should Be Equal    ${header}    JavaScript Alerts

Test Basic JavaScript Alerts Functionality
    [Documentation]    Test basic JavaScript alerts functionality
    Verify JavaScript Alerts Page Content
    Verify Page Header