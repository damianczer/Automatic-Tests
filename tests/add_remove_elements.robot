*** Settings ***
Documentation     Add/Remove Elements functionality tests for the-internet.herokuapp.com
Library           SeleniumLibrary
Resource          ../keywords/common_keywords.robot
Resource          ../keywords/homepage_keywords.robot
Resource          ../keywords/add_remove_keywords.robot
Resource          ../resources/variables.robot

Test Setup        Open Browser And Setup
Test Teardown     Close Browser And Cleanup

*** Test Cases ***
TC001 - Check Add/Remove Elements Link Availability On Homepage
    [Documentation]    Verifies that Add/Remove Elements link is available on homepage
    [Tags]             smoke    homepage    add_remove
    
    Verify Homepage Is Loaded
    Verify Link Exists    Add/Remove Elements

TC002 - Navigate To Add/Remove Elements Page
    [Documentation]    Verifies navigation from homepage to Add/Remove Elements page
    [Tags]             smoke    navigation    add_remove
    
    Verify Homepage Is Loaded
    Click Add/Remove Elements Link
    Verify Add/Remove Elements Page Is Loaded

TC003 - Verify Basic Page Functionality
    [Documentation]    Verifies that page contains basic elements
    [Tags]             content    add_remove
    
    Navigate To Page    ${ADD_REMOVE_URL}
    Verify Add/Remove Elements Page Is Loaded
    Verify Add Element Button Is Visible

TC004 - Add Single Element
    [Documentation]    Verifies adding a single element
    [Tags]             functionality    add_remove
    
    Navigate To Page    ${ADD_REMOVE_URL}
    Verify Add/Remove Elements Page Is Loaded
    
    # Check initial state - no Delete buttons
    Verify No Delete Buttons Exist
    
    # Add element
    Click Add Element Button
    
    # Verify Delete button appeared
    ${count}=    Get Delete Buttons Count
    Should Be Equal As Numbers    ${count}    1

TC005 - Add And Remove Element
    [Documentation]    Verifies complete cycle of adding and removing element
    [Tags]             functionality    add_remove
    
    Navigate To Page    ${ADD_REMOVE_URL}
    Verify Add/Remove Elements Page Is Loaded
    
    # Add element
    Click Add Element Button
    ${count_after_add}=    Get Delete Buttons Count
    Should Be Equal As Numbers    ${count_after_add}    1
    
    # Remove element
    Click Delete Button
    Verify No Delete Buttons Exist

TC006 - Add Multiple Elements
    [Documentation]    Verifies adding multiple elements at once
    [Tags]             functionality    add_remove    multiple
    
    Navigate To Page    ${ADD_REMOVE_URL}
    Verify Add/Remove Elements Page Is Loaded
    
    # Add 5 elements
    Add Multiple Elements    5
    
    # Verify there are 5 Delete buttons
    ${count}=    Get Delete Buttons Count
    Should Be Equal As Numbers    ${count}    5

TC007 - Remove All Elements
    [Documentation]    Verifies removing all added elements
    [Tags]             functionality    add_remove    cleanup
    
    Navigate To Page    ${ADD_REMOVE_URL}
    Verify Add/Remove Elements Page Is Loaded
    
    # Add several elements
    Add Multiple Elements    3
    
    # Check state after adding
    ${count_before}=    Get Delete Buttons Count
    Should Be Equal As Numbers    ${count_before}    3
    
    # Remove all elements
    Remove All Elements
    
    # Verify all were removed
    Verify No Delete Buttons Exist

TC008 - Performance Test - Add Many Elements
    [Documentation]    Performance test when adding many elements
    [Tags]             performance    add_remove    stress
    
    Navigate To Page    ${ADD_REMOVE_URL}
    Verify Add/Remove Elements Page Is Loaded
    
    # Add 10 elements and verify all are available
    Add Multiple Elements    10
    
    ${count}=    Get Delete Buttons Count
    Should Be Equal As Numbers    ${count}    10
    
    # Remove all for cleanup
    Remove All Elements
