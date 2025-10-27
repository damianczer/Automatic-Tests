*** Settings ***
Documentation       Drag and Drop functionality tests for the-internet.herokuapp.com
Library             SeleniumLibrary
Resource            ../keywords/common_keywords.robot
Resource            ../keywords/homepage_keywords.robot
Resource            ../keywords/drag_and_drop_keywords.robot
Resource            ../resources/variables.robot

Test Setup          Open Browser And Setup
Test Teardown       Close Browser And Cleanup
Test Tags           drag_and_drop

*** Test Cases ***
TC001 - Check Drag And Drop Link Availability On Homepage
    [Documentation]    Verify that Drag and Drop link is available on homepage
    [Tags]    smoke    navigation    drag_and_drop
    Verify Homepage Is Loaded
    Verify Link Exists    Drag and Drop

TC002 - Navigate To Drag And Drop Page
    [Documentation]    Navigate from homepage to Drag and Drop page
    [Tags]    smoke    navigation    drag_and_drop
    Verify Homepage Is Loaded
    Click Drag And Drop Link
    Verify Drag And Drop Page Content

TC003 - Verify Drag And Drop Page Content
    [Documentation]    Verify that Drag and Drop page contains expected content and elements
    [Tags]    content    functionality    drag_and_drop
    Navigate To Drag And Drop Page
    Verify Drag And Drop Page Content
    Verify Page Header
    Verify Initial State

TC004 - Verify Initial State Of Drag And Drop Elements
    [Documentation]    Check initial state of drag and drop columns
    [Tags]    functionality    drag_and_drop
    Navigate To Drag And Drop Page
    Verify Initial State
    ${column_a_text}    Get Column A Text
    ${column_b_text}    Get Column B Text
    Should Contain    ${column_a_text}    A
    Should Contain    ${column_b_text}    B

TC005 - Drag Element From Column A To Column B
    [Documentation]    Test dragging element from column A to column B
    [Tags]    functionality    drag_and_drop    interaction
    Navigate To Drag And Drop Page
    Verify Initial State
    Drag Element From A To B
    Verify State After A To B Drag

TC006 - Drag Element From Column B To Column A
    [Documentation]    Test dragging element from column B to column A
    [Tags]    functionality    drag_and_drop    interaction
    Navigate To Drag And Drop Page
    # First drag A to B, then B back to A
    Drag Element From A To B
    Verify State After A To B Drag
    Drag Element From B To A
    Verify State After B To A Drag

TC007 - Multiple Drag And Drop Operations
    [Documentation]    Test multiple drag and drop operations in sequence
    [Tags]    functionality    drag_and_drop    interaction
    Navigate To Drag And Drop Page
    Verify Initial State
    # Perform multiple drag operations
    Drag Element From A To B
    Verify State After A To B Drag
    Drag Element From B To A
    Verify State After B To A Drag
    Drag Element From A To B
    Verify State After A To B Drag

TC008 - Drag And Drop Elements Properties Verification
    [Documentation]    Verify properties and behavior of drag and drop elements
    [Tags]    functionality    drag_and_drop    validation
    Navigate To Drag And Drop Page
    # Verify elements are visible and enabled
    Element Should Be Visible    ${DRAG_COLUMN_A}
    Element Should Be Visible    ${DRAG_COLUMN_B}
    # Verify page structure
    ${header}    Get Page Header Text
    Should Be Equal    ${header}    Drag and Drop
    # Test drag functionality
    Test Basic Drag And Drop Functionality