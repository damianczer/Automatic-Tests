*** Settings ***
Documentation       Dynamic Loading functionality tests for the-internet.herokuapp.com
Library             SeleniumLibrary
Resource            ../keywords/common_keywords.robot
Resource            ../keywords/homepage_keywords.robot
Resource            ../keywords/dynamic_loading_keywords.robot
Resource            ../resources/variables.robot

Test Setup          Open Browser And Setup
Test Teardown       Close Browser And Cleanup
Test Tags           dynamic_loading

*** Test Cases ***
TC001 - Check Dynamic Loading Link Availability On Homepage
    [Documentation]    Verify that Dynamic Loading link is available on homepage
    [Tags]    smoke    navigation    dynamic_loading
    Verify Homepage Is Loaded
    Verify Link Exists    Dynamic Loading

TC002 - Navigate To Dynamic Loading Page
    [Documentation]    Navigate from homepage to Dynamic Loading page
    [Tags]    smoke    navigation    dynamic_loading
    Verify Homepage Is Loaded
    Click Dynamic Loading Link
    Verify Dynamic Loading Page Content

TC003 - Verify Dynamic Loading Page Content
    [Documentation]    Verify that Dynamic Loading page contains expected content and links
    [Tags]    content    functionality    dynamic_loading
    Navigate To Dynamic Loading Page
    Verify Dynamic Loading Page Content
    Verify Page Header
    Verify Example Links Exist

TC004 - Test Dynamic Loading Example 1 - Hidden Element
    [Documentation]    Test dynamic loading with hidden element that becomes visible
    [Tags]    functionality    dynamic_loading    example1
    Navigate To Dynamic Loading Example 1
    Test Hidden Element Loading

TC005 - Test Dynamic Loading Example 2 - Rendered Element
    [Documentation]    Test dynamic loading with element rendered after the fact
    [Tags]    functionality    dynamic_loading    example2
    Navigate To Dynamic Loading Example 2
    Test Rendered Element Loading

TC006 - Verify Loading States Example 1
    [Documentation]    Verify loading states and transitions in Example 1
    [Tags]    functionality    dynamic_loading    example1    validation
    Navigate To Dynamic Loading Example 1
    Verify Loading State Transitions

TC007 - Verify Loading States Example 2
    [Documentation]    Verify loading states and transitions in Example 2
    [Tags]    functionality    dynamic_loading    example2    validation
    Navigate To Dynamic Loading Example 2
    Verify Loading State Transitions

TC008 - Multiple Dynamic Loading Operations
    [Documentation]    Test multiple dynamic loading operations in sequence
    [Tags]    functionality    dynamic_loading    validation
    Navigate To Dynamic Loading Page
    # Test Example 1
    Click Dynamic Loading Example 1 Link
    Test Hidden Element Loading
    Go Back To Dynamic Loading Page
    # Test Example 2  
    Click Dynamic Loading Example 2 Link
    Test Rendered Element Loading
    Go Back To Dynamic Loading Page
    # Verify we're back on main page
    Verify Dynamic Loading Page Content