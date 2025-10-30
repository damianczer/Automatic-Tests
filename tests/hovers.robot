*** Settings ***
Documentation       Hovers functionality tests for the-internet.herokuapp.com
Library             SeleniumLibrary
Resource            ../keywords/common_keywords.robot
Resource            ../keywords/homepage_keywords.robot
Resource            ../keywords/hovers_keywords.robot
Resource            ../resources/variables.robot

Test Setup          Open Browser And Setup
Test Teardown       Close Browser And Cleanup
Test Tags           hovers

*** Test Cases ***
TC001 - Check Hovers Link Availability On Homepage
    [Documentation]    Verify that Hovers link is available on homepage
    [Tags]    smoke    navigation    hovers
    Verify Homepage Is Loaded
    Verify Link Exists    Hovers

TC002 - Navigate To Hovers Page
    [Documentation]    Navigate from homepage to Hovers page
    [Tags]    smoke    navigation    hovers
    Verify Homepage Is Loaded
    Click Hovers Link
    Verify Hovers Page Content

TC003 - Verify Hovers Page Content
    [Documentation]    Verify that Hovers page contains expected content and elements
    [Tags]    content    functionality    hovers
    Navigate To Hovers Page
    Verify Hovers Page Content
    Verify Page Header
    Verify All User Images Exist

TC004 - Test Hover On User 1
    [Documentation]    Test hover interaction on first user image
    [Tags]    functionality    hovers    interactions
    Navigate To Hovers Page
    Test Hover On User    1

TC005 - Test Hover On User 2
    [Documentation]    Test hover interaction on second user image
    [Tags]    functionality    hovers    interactions
    Navigate To Hovers Page
    Test Hover On User    2

TC006 - Test Hover On User 3
    [Documentation]    Test hover interaction on third user image
    [Tags]    functionality    hovers    interactions
    Navigate To Hovers Page
    Test Hover On User    3

TC007 - Verify User Profile Links
    [Documentation]    Verify that user profile links work correctly
    [Tags]    functionality    hovers    links
    Navigate To Hovers Page
    Verify All User Profile Links

TC008 - Multiple Hover Operations
    [Documentation]    Test multiple hover operations in sequence
    [Tags]    functionality    hovers    validation
    Navigate To Hovers Page
    # Test hover on all users
    Test Hover On User    1
    Test Hover On User    2
    Test Hover On User    3
    # Verify profile links
    Verify All User Profile Links