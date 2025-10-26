*** Settings ***
Documentation    Keywords for Dropdown functionality tests
Library          SeleniumLibrary
Library          Collections
Resource         ../resources/variables.robot
Resource         common_keywords.robot

*** Keywords ***
Navigate To Dropdown Page
    [Documentation]    Navigate to Dropdown page
    Go To    ${DROPDOWN_URL}
    Wait Until Page Contains Element    ${DROPDOWN_SELECT}    timeout=${EXPLICIT_WAIT}
    Wait Until Page Contains    Dropdown List    timeout=${EXPLICIT_WAIT}

Verify Dropdown Page Content
    [Documentation]    Verify Dropdown page contains expected elements
    Page Should Contain    Dropdown List
    Element Should Be Visible    ${DROPDOWN_SELECT}
    Element Should Be Enabled    ${DROPDOWN_SELECT}

Get Dropdown Options
    [Documentation]    Get all available options from dropdown
    ${options}    Get List Items    ${DROPDOWN_SELECT}
    [Return]    ${options}

Select Dropdown Option
    [Arguments]    ${option}
    [Documentation]    Select specific option from dropdown
    Select From List By Label    ${DROPDOWN_SELECT}    ${option}

Select Dropdown Option By Value
    [Arguments]    ${value}
    [Documentation]    Select specific option from dropdown by value
    Select From List By Value    ${DROPDOWN_SELECT}    ${value}

Get Selected Dropdown Option
    [Documentation]    Get currently selected option from dropdown
    ${selected}    Get Selected List Label    ${DROPDOWN_SELECT}
    [Return]    ${selected}

Get Selected Dropdown Value
    [Documentation]    Get currently selected option value from dropdown
    ${selected}    Get Selected List Value    ${DROPDOWN_SELECT}
    [Return]    ${selected}

Verify Dropdown Option Selected
    [Arguments]    ${expected_option}
    [Documentation]    Verify that specific option is selected
    ${selected}    Get Selected Dropdown Option
    Should Be Equal    ${selected}    ${expected_option}

Verify Dropdown Value Selected
    [Arguments]    ${expected_value}
    [Documentation]    Verify that specific value is selected
    ${selected}    Get Selected Dropdown Value
    Should Be Equal    ${selected}    ${expected_value}

Verify Dropdown Has Options
    [Arguments]    @{expected_options}
    [Documentation]    Verify dropdown contains expected options
    ${actual_options}    Get Dropdown Options
    FOR    ${option}    IN    @{expected_options}
        List Should Contain Value    ${actual_options}    ${option}
    END

Verify Dropdown Default Selection
    [Documentation]    Verify dropdown default selection
    ${selected}    Get Selected Dropdown Option
    Should Be Equal    ${selected}    Please select an option

Test Dropdown Functionality
    [Documentation]    Test basic dropdown functionality
    Verify Dropdown Page Content
    ${options}    Get Dropdown Options
    Log    Available options: ${options}
    Length Should Be    ${options}    3