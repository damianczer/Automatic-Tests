*** Settings ***
Documentation    Keywords for Inputs functionality tests
Library          SeleniumLibrary
Resource         ../resources/variables.robot
Resource         common_keywords.robot

*** Keywords ***
Navigate To Inputs Page
    [Documentation]    Navigate to Inputs page
    Go To    ${INPUTS_URL}
    Wait Until Page Contains Element    ${NUMBER_INPUT}    timeout=${EXPLICIT_WAIT}
    Wait Until Page Contains    Inputs    timeout=${EXPLICIT_WAIT}

Verify Inputs Page Content
    [Documentation]    Verify Inputs page contains expected elements
    Page Should Contain    Inputs
    Page Should Contain    Number
    Element Should Be Visible    ${NUMBER_INPUT}
    Element Should Be Enabled    ${NUMBER_INPUT}

Verify Number Input Exists
    [Documentation]    Verify that number input field exists and is accessible
    Element Should Be Visible    ${NUMBER_INPUT}
    Element Should Be Enabled    ${NUMBER_INPUT}
    ${input_type}=    Get Element Attribute    ${NUMBER_INPUT}    type
    Should Be Equal    ${input_type}    number

Enter Number In Input
    [Arguments]    ${number}
    [Documentation]    Enter a number in the input field
    Clear Number Input
    Input Text    ${NUMBER_INPUT}    ${number}
    Sleep    0.3s    # Small delay for input to register

Clear Number Input
    [Documentation]    Clear the number input field
    Clear Element Text    ${NUMBER_INPUT}

Get Number Input Value
    [Documentation]    Get current value from number input
    ${value}=    Get Value    ${NUMBER_INPUT}
    [Return]    ${value}

Verify Number Input Value
    [Arguments]    ${expected_value}
    [Documentation]    Verify that input contains expected value
    ${actual_value}=    Get Number Input Value
    Should Be Equal As Strings    ${actual_value}    ${expected_value}

Increment Number Input
    [Documentation]    Increment number using arrow up key
    Click Element    ${NUMBER_INPUT}
    Press Keys    ${NUMBER_INPUT}    ARROW_UP
    Sleep    0.2s

Decrement Number Input
    [Documentation]    Decrement number using arrow down key
    Click Element    ${NUMBER_INPUT}
    Press Keys    ${NUMBER_INPUT}    ARROW_DOWN
    Sleep    0.2s

Test Number Input With Value
    [Arguments]    ${value}
    [Documentation]    Complete test cycle with specific value
    Enter Number In Input    ${value}
    Verify Number Input Value    ${value}

Get Page Header Text
    [Documentation]    Get the page header text
    ${header}=    Get Text    ${PAGE_HEADER}
    [Return]    ${header}

Verify Page Header
    [Documentation]    Verify the page header is correct
    ${header}=    Get Page Header Text
    Should Be Equal    ${header}    Inputs