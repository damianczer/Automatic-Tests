*** Settings ***
Documentation       Dropdown functionality tests for the-internet.herokuapp.com
Library             SeleniumLibrary
Resource            ../keywords/common_keywords.robot
Resource            ../keywords/homepage_keywords.robot
Resource            ../keywords/dropdown_keywords.robot
Resource            ../resources/variables.robot

Test Setup          Open Browser And Setup
Test Teardown       Close Browser And Cleanup
Test Tags           dropdown

*** Test Cases ***
TC001 - Check Dropdown Link Availability On Homepage
    [Documentation]    Verify that Dropdown link is available on homepage
    [Tags]    smoke    navigation    dropdown
    Verify Homepage Is Loaded
    Verify Link Exists    Dropdown

TC002 - Navigate To Dropdown Page
    [Documentation]    Navigate from homepage to Dropdown page
    [Tags]    smoke    navigation    dropdown
    Verify Homepage Is Loaded
    Click Dropdown Link
    Verify Dropdown Page Content

TC003 - Verify Dropdown Page Content
    [Documentation]    Verify that Dropdown page contains expected content and elements
    [Tags]    content    functionality    dropdown
    Navigate To Dropdown Page
    Verify Dropdown Page Content
    Page Should Contain    Dropdown List
    Element Should Be Visible    ${DROPDOWN_SELECT}

TC004 - Verify Dropdown Default State
    [Documentation]    Check initial state and default selection of dropdown
    [Tags]    functionality    dropdown
    Navigate To Dropdown Page
    Verify Dropdown Default Selection
    ${options}    Get Dropdown Options
    Length Should Be    ${options}    3
    List Should Contain Value    ${options}    Please select an option

TC005 - Select Option 1 From Dropdown
    [Documentation]    Test selecting Option 1 from dropdown
    [Tags]    functionality    dropdown    forms
    Navigate To Dropdown Page
    Select Dropdown Option    Option 1
    Verify Dropdown Option Selected    Option 1
    Verify Dropdown Value Selected    1

TC006 - Select Option 2 From Dropdown
    [Documentation]    Test selecting Option 2 from dropdown
    [Tags]    functionality    dropdown    forms
    Navigate To Dropdown Page
    Select Dropdown Option    Option 2
    Verify Dropdown Option Selected    Option 2
    Verify Dropdown Value Selected    2

TC007 - Multiple Dropdown Selections
    [Documentation]    Test multiple selections in sequence
    [Tags]    functionality    dropdown    forms
    Navigate To Dropdown Page
    # Test sequence: Option 1 -> Option 2 -> Option 1
    Select Dropdown Option    Option 1
    Verify Dropdown Option Selected    Option 1
    Select Dropdown Option    Option 2
    Verify Dropdown Option Selected    Option 2
    Select Dropdown Option    Option 1
    Verify Dropdown Option Selected    Option 1

TC008 - Dropdown Options Verification
    [Documentation]    Verify all available dropdown options and their properties
    [Tags]    functionality    dropdown    validation
    Navigate To Dropdown Page
    Verify Dropdown Has Options    Please select an option    Option 1    Option 2
    # Test selection by value
    Select Dropdown Option By Value    1
    Verify Dropdown Value Selected    1
    Select Dropdown Option By Value    2
    Verify Dropdown Value Selected    2