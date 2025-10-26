*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/variables.robot
Resource          common_keywords.robot

*** Keywords ***
Verify Checkboxes Page Is Loaded
    [Documentation]    Verifies that Checkboxes page is loaded correctly
    Verify Page URL    ${CHECKBOXES_URL}
    Verify Element Is Visible    ${PAGE_HEADER}
    Verify Page Contains Text    Checkboxes

Verify Both Checkboxes Are Present
    [Documentation]    Verifies that both checkboxes are present on the page
    Verify Element Is Visible    ${CHECKBOX_1}
    Verify Element Is Visible    ${CHECKBOX_2}

Check First Checkbox
    [Documentation]    Checks the first checkbox
    Click Element And Wait    ${CHECKBOX_1}

Check Second Checkbox
    [Documentation]    Checks the second checkbox
    Click Element And Wait    ${CHECKBOX_2}

Uncheck First Checkbox
    [Documentation]    Unchecks the first checkbox
    Click Element And Wait    ${CHECKBOX_1}

Uncheck Second Checkbox
    [Documentation]    Unchecks the second checkbox
    Click Element And Wait    ${CHECKBOX_2}

Verify First Checkbox Is Checked
    [Documentation]    Verifies that first checkbox is checked
    Checkbox Should Be Selected    ${CHECKBOX_1}

Verify Second Checkbox Is Checked
    [Documentation]    Verifies that second checkbox is checked
    Checkbox Should Be Selected    ${CHECKBOX_2}

Verify First Checkbox Is Unchecked
    [Documentation]    Verifies that first checkbox is unchecked
    Checkbox Should Not Be Selected    ${CHECKBOX_1}

Verify Second Checkbox Is Unchecked
    [Documentation]    Verifies that second checkbox is unchecked
    Checkbox Should Not Be Selected    ${CHECKBOX_2}

Get Checkbox States
    [Documentation]    Gets the state of both checkboxes
    ${checkbox1_state}=    Get Element Attribute    ${CHECKBOX_1}    checked
    ${checkbox2_state}=    Get Element Attribute    ${CHECKBOX_2}    checked
    Log    Checkbox 1 state: ${checkbox1_state}
    Log    Checkbox 2 state: ${checkbox2_state}
    [Return]    ${checkbox1_state}    ${checkbox2_state}

Toggle All Checkboxes
    [Documentation]    Toggles the state of both checkboxes
    Click Element And Wait    ${CHECKBOX_1}
    Click Element And Wait    ${CHECKBOX_2}