*** Settings ***
Documentation     Checkboxes functionality tests for the-internet.herokuapp.com
Library           SeleniumLibrary
Resource          ../keywords/common_keywords.robot
Resource          ../keywords/homepage_keywords.robot
Resource          ../keywords/checkboxes_keywords.robot
Resource          ../resources/variables.robot

Test Setup        Open Browser And Setup
Test Teardown     Close Browser And Cleanup

*** Test Cases ***
TC001 - Check Checkboxes Link Availability On Homepage
    [Documentation]    Verifies that Checkboxes link is available on homepage
    [Tags]             smoke    homepage    checkboxes
    
    Verify Homepage Is Loaded
    Verify Link Exists    Checkboxes

TC002 - Navigate To Checkboxes Page
    [Documentation]    Verifies navigation from homepage to Checkboxes page
    [Tags]             smoke    navigation    checkboxes
    
    Verify Homepage Is Loaded
    Click Checkboxes Link
    Verify Checkboxes Page Is Loaded

TC003 - Verify Checkboxes Page Content
    [Documentation]    Verifies that Checkboxes page displays correct content
    [Tags]             content    checkboxes
    
    Navigate To Page    ${CHECKBOXES_URL}
    Verify Checkboxes Page Is Loaded
    Verify Both Checkboxes Are Present

TC004 - Check Initial Checkbox States
    [Documentation]    Verifies the initial state of checkboxes (checkbox 2 should be checked by default)
    [Tags]             functionality    checkboxes    initial_state
    
    Navigate To Page    ${CHECKBOXES_URL}
    Verify Checkboxes Page Is Loaded
    
    # First checkbox should be unchecked by default
    Verify First Checkbox Is Unchecked
    
    # Second checkbox should be checked by default
    Verify Second Checkbox Is Checked

TC005 - Toggle First Checkbox
    [Documentation]    Tests toggling the first checkbox from unchecked to checked and back
    [Tags]             functionality    checkboxes    toggle
    
    Navigate To Page    ${CHECKBOXES_URL}
    Verify Checkboxes Page Is Loaded
    
    # Initial state - first checkbox unchecked
    Verify First Checkbox Is Unchecked
    
    # Check first checkbox
    Check First Checkbox
    Verify First Checkbox Is Checked
    
    # Uncheck first checkbox
    Uncheck First Checkbox
    Verify First Checkbox Is Unchecked

TC006 - Toggle Second Checkbox
    [Documentation]    Tests toggling the second checkbox from checked to unchecked and back
    [Tags]             functionality    checkboxes    toggle
    
    Navigate To Page    ${CHECKBOXES_URL}
    Verify Checkboxes Page Is Loaded
    
    # Initial state - second checkbox checked
    Verify Second Checkbox Is Checked
    
    # Uncheck second checkbox
    Uncheck Second Checkbox
    Verify Second Checkbox Is Unchecked
    
    # Check second checkbox again
    Check Second Checkbox
    Verify Second Checkbox Is Checked

TC007 - Multiple Checkbox Operations
    [Documentation]    Tests multiple operations on both checkboxes
    [Tags]             functionality    checkboxes    multiple_operations
    
    Navigate To Page    ${CHECKBOXES_URL}
    Verify Checkboxes Page Is Loaded
    
    # Get initial states
    ${state1}    ${state2}=    Get Checkbox States
    
    # Toggle both checkboxes
    Toggle All Checkboxes
    
    # Verify states changed
    ${new_state1}    ${new_state2}=    Get Checkbox States
    Should Not Be Equal    ${state1}    ${new_state1}
    Should Not Be Equal    ${state2}    ${new_state2}

TC008 - Checkbox Persistence Test
    [Documentation]    Tests if checkbox states persist during page operations
    [Tags]             functionality    checkboxes    persistence
    
    Navigate To Page    ${CHECKBOXES_URL}
    Verify Checkboxes Page Is Loaded
    
    # Set both checkboxes to checked state
    Check First Checkbox
    Verify First Checkbox Is Checked
    Verify Second Checkbox Is Checked
    
    # Refresh page and verify states reset to default
    Reload Page
    Verify Checkboxes Page Is Loaded
    
    # Should be back to default states
    Verify First Checkbox Is Unchecked
    Verify Second Checkbox Is Checked