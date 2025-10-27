*** Settings ***
Documentation    Keywords for Drag and Drop functionality tests
Library          SeleniumLibrary
Resource         ../resources/variables.robot
Resource         common_keywords.robot

*** Keywords ***
Navigate To Drag And Drop Page
    [Documentation]    Navigate to Drag and Drop page
    Go To    ${DRAG_AND_DROP_URL}
    Wait Until Page Contains Element    ${DRAG_COLUMN_A}    timeout=${EXPLICIT_WAIT}
    Wait Until Page Contains Element    ${DRAG_COLUMN_B}    timeout=${EXPLICIT_WAIT}
    Wait Until Page Contains    Drag and Drop    timeout=${EXPLICIT_WAIT}

Verify Drag And Drop Page Content
    [Documentation]    Verify Drag and Drop page contains expected elements
    Page Should Contain    Drag and Drop
    Element Should Be Visible    ${DRAG_COLUMN_A}
    Element Should Be Visible    ${DRAG_COLUMN_B}

Get Column A Text
    [Documentation]    Get text content of column A
    ${text}    Get Text    ${DRAG_COLUMN_A}
    [Return]    ${text}

Get Column B Text
    [Documentation]    Get text content of column B
    ${text}    Get Text    ${DRAG_COLUMN_B}
    [Return]    ${text}

Verify Column A Contains
    [Arguments]    ${expected_text}
    [Documentation]    Verify column A contains expected text
    ${actual_text}    Get Column A Text
    Should Contain    ${actual_text}    ${expected_text}

Verify Column B Contains
    [Arguments]    ${expected_text}
    [Documentation]    Verify column B contains expected text
    ${actual_text}    Get Column B Text
    Should Contain    ${actual_text}    ${expected_text}

Drag Element From A To B
    [Documentation]    Drag element from column A to column B
    Drag And Drop    ${DRAG_COLUMN_A}    ${DRAG_COLUMN_B}
    Sleep    1s    # Wait for animation to complete

Drag Element From B To A
    [Documentation]    Drag element from column B to column A
    Drag And Drop    ${DRAG_COLUMN_B}    ${DRAG_COLUMN_A}
    Sleep    1s    # Wait for animation to complete

Verify Initial State
    [Documentation]    Verify initial state of drag and drop elements
    Verify Column A Contains    A
    Verify Column B Contains    B

Verify State After A To B Drag
    [Documentation]    Verify state after dragging from A to B
    Verify Column A Contains    B
    Verify Column B Contains    A

Verify State After B To A Drag
    [Documentation]    Verify state after dragging from B to A
    Verify Column A Contains    A
    Verify Column B Contains    B

Get Page Header Text
    [Documentation]    Get the page header text
    ${header}    Get Text    ${PAGE_HEADER}
    [Return]    ${header}

Verify Page Header
    [Documentation]    Verify the page header is correct
    ${header}    Get Page Header Text
    Should Be Equal    ${header}    Drag and Drop

Test Basic Drag And Drop Functionality
    [Documentation]    Test basic drag and drop functionality
    Verify Drag And Drop Page Content
    Verify Page Header
    Verify Initial State