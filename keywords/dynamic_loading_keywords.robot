*** Settings ***
Documentation    Keywords for Dynamic Loading functionality tests
Library          SeleniumLibrary
Resource         ../resources/variables.robot
Resource         common_keywords.robot

*** Keywords ***
Navigate To Dynamic Loading Page
    [Documentation]    Navigate to Dynamic Loading page
    Go To    ${DYNAMIC_LOADING_URL}
    Wait Until Page Contains Element    ${DYNAMIC_LOADING_EXAMPLE1_LINK}    timeout=${EXPLICIT_WAIT}
    Wait Until Page Contains Element    ${DYNAMIC_LOADING_EXAMPLE2_LINK}    timeout=${EXPLICIT_WAIT}
    Wait Until Page Contains    Dynamically Loaded Page Elements    timeout=${EXPLICIT_WAIT}

Navigate To Dynamic Loading Example 1
    [Documentation]    Navigate to Dynamic Loading Example 1 page
    Go To    ${DYNAMIC_LOADING_EXAMPLE1_URL}
    Wait Until Page Contains Element    ${START_BUTTON}    timeout=${EXPLICIT_WAIT}
    Wait Until Page Contains    Example 1: Element on page that is hidden    timeout=${EXPLICIT_WAIT}

Navigate To Dynamic Loading Example 2
    [Documentation]    Navigate to Dynamic Loading Example 2 page
    Go To    ${DYNAMIC_LOADING_EXAMPLE2_URL}
    Wait Until Page Contains Element    ${START_BUTTON}    timeout=${EXPLICIT_WAIT}
    Wait Until Page Contains    Example 2: Element rendered after the fact    timeout=${EXPLICIT_WAIT}

Verify Dynamic Loading Page Content
    [Documentation]    Verify Dynamic Loading page contains expected elements
    Page Should Contain    Dynamically Loaded Page Elements
    Element Should Be Visible    ${DYNAMIC_LOADING_EXAMPLE1_LINK}
    Element Should Be Visible    ${DYNAMIC_LOADING_EXAMPLE2_LINK}
    Element Should Be Enabled    ${DYNAMIC_LOADING_EXAMPLE1_LINK}
    Element Should Be Enabled    ${DYNAMIC_LOADING_EXAMPLE2_LINK}

Click Dynamic Loading Example 1 Link
    [Documentation]    Click the Example 1 link
    Click Element And Wait    ${DYNAMIC_LOADING_EXAMPLE1_LINK}

Click Dynamic Loading Example 2 Link
    [Documentation]    Click the Example 2 link
    Click Element And Wait    ${DYNAMIC_LOADING_EXAMPLE2_LINK}

Click Start Button
    [Documentation]    Click the Start button to trigger dynamic loading
    Click Element    ${START_BUTTON}

Wait For Loading To Complete
    [Documentation]    Wait for loading indicator to disappear and content to appear
    Wait Until Element Is Not Visible    ${LOADING_INDICATOR}    timeout=${EXPLICIT_WAIT}
    Wait Until Element Is Visible    ${HELLO_WORLD_TEXT}    timeout=${EXPLICIT_WAIT}

Verify Hello World Text
    [Documentation]    Verify that "Hello World!" text is displayed
    Element Should Be Visible    ${HELLO_WORLD_TEXT}
    Element Text Should Be    ${HELLO_WORLD_TEXT}    Hello World!

Test Hidden Element Loading
    [Documentation]    Test the hidden element loading functionality (Example 1)
    # Verify initial state - element exists but is hidden
    Element Should Not Be Visible    ${HELLO_WORLD_TEXT}
    Element Should Be Visible    ${START_BUTTON}
    # Click start and wait for loading
    Click Start Button
    Wait For Loading To Complete
    # Verify final state
    Verify Hello World Text
    Element Should Not Be Visible    ${START_BUTTON}

Test Rendered Element Loading
    [Documentation]    Test the rendered element loading functionality (Example 2)
    # Verify initial state - element doesn't exist
    Page Should Not Contain Element    ${HELLO_WORLD_TEXT}
    Element Should Be Visible    ${START_BUTTON}
    # Click start and wait for loading
    Click Start Button
    Wait For Loading To Complete
    # Verify final state
    Verify Hello World Text
    Element Should Not Be Visible    ${START_BUTTON}

Verify Loading State Transitions
    [Documentation]    Verify loading state transitions work correctly
    # Initial state
    Element Should Be Visible    ${START_BUTTON}
    Element Should Be Enabled    ${START_BUTTON}
    # Click start
    Click Start Button
    # Loading state
    Wait Until Element Is Visible    ${LOADING_INDICATOR}    timeout=2s
    Element Should Contain    ${LOADING_INDICATOR}    Loading...
    # Final state
    Wait For Loading To Complete
    Verify Hello World Text

Verify Example Links Exist
    [Documentation]    Verify that both example links exist on main Dynamic Loading page
    Element Should Be Visible    ${DYNAMIC_LOADING_EXAMPLE1_LINK}
    Element Should Be Visible    ${DYNAMIC_LOADING_EXAMPLE2_LINK}
    Element Should Contain    ${DYNAMIC_LOADING_EXAMPLE1_LINK}    Example 1
    Element Should Contain    ${DYNAMIC_LOADING_EXAMPLE2_LINK}    Example 2

Go Back To Dynamic Loading Page
    [Documentation]    Navigate back to main Dynamic Loading page
    Go To    ${DYNAMIC_LOADING_URL}
    Wait Until Page Contains    Dynamically Loaded Page Elements    timeout=${EXPLICIT_WAIT}

Get Page Header Text
    [Documentation]    Get the page header text
    ${header}    Get Text    ${PAGE_HEADER}
    [Return]    ${header}

Verify Page Header
    [Documentation]    Verify the page header is correct
    ${header}    Get Page Header Text
    Should Contain    ${header}    Dynamically Loaded Page Elements