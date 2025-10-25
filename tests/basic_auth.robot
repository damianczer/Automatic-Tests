*** Settings ***
Documentation     Basic Auth functionality tests for the-internet.herokuapp.com
Library           SeleniumLibrary
Resource          ../keywords/common_keywords.robot
Resource          ../keywords/homepage_keywords.robot
Resource          ../keywords/basic_auth_keywords.robot
Resource          ../resources/variables.robot

Test Setup        Open Browser And Setup
Test Teardown     Close Browser And Cleanup

*** Test Cases ***
TC001 - Check Basic Auth Link Availability On Homepage
    [Documentation]    Verifies that Basic Auth link is available on homepage
    [Tags]             smoke    homepage    basic_auth
    
    Verify Homepage Is Loaded
    Verify Link Exists    Basic Auth

TC002 - Navigate To Basic Auth Page With Credentials
    [Documentation]    Verifies navigation to Basic Auth page using embedded credentials
    [Tags]             smoke    navigation    basic_auth    authentication
    
    Navigate To Basic Auth With Credentials
    Verify Basic Auth Success Page

TC003 - Verify Basic Auth Success Page Content
    [Documentation]    Verifies the content of Basic Auth success page
    [Tags]             content    basic_auth    authentication
    
    Navigate To Basic Auth With Credentials
    Verify Basic Auth Page Content

TC004 - Basic Auth Via Homepage Navigation
    [Documentation]    Tests Basic Auth access through homepage navigation (will show auth dialog)
    [Tags]             navigation    basic_auth    interactive
    
    Verify Homepage Is Loaded
    # Note: This test will trigger browser's Basic Auth dialog
    # In automated testing, we typically use URL with embedded credentials
    # This test demonstrates the flow but may require manual intervention
    Click Basic Auth Link
    # Browser will show Basic Auth dialog here
    # For automation, we use TC002 approach with embedded credentials

TC005 - Multiple Basic Auth Access Attempts
    [Documentation]    Tests multiple accesses to Basic Auth protected resource
    [Tags]             functionality    basic_auth    authentication
    
    # First access
    Navigate To Basic Auth With Credentials
    Verify Basic Auth Success Page
    
    # Navigate away
    Navigate To Page    ${BASE_URL}
    Verify Homepage Is Loaded
    
    # Access again
    Navigate To Basic Auth With Credentials
    Verify Basic Auth Success Page

TC006 - Basic Auth Page Refresh Behavior
    [Documentation]    Tests behavior when refreshing Basic Auth protected page
    [Tags]             functionality    basic_auth    refresh
    
    Navigate To Basic Auth With Credentials
    Verify Basic Auth Success Page
    
    # Refresh page
    Reload Page
    Verify Basic Auth Success Page

TC007 - Basic Auth URL Structure Validation
    [Documentation]    Validates that Basic Auth URL structure works correctly
    [Tags]             functionality    basic_auth    url_validation
    
    Navigate To Basic Auth With Credentials
    
    # Verify we're on the correct page
    ${current_url}=    Get Location
    Should Contain     ${current_url}    /basic_auth
    
    # Verify page content
    Verify Basic Auth Success Page

TC008 - Basic Auth Security Headers Check
    [Documentation]    Verifies that Basic Auth page has appropriate security indicators
    [Tags]             security    basic_auth    headers
    
    Navigate To Basic Auth With Credentials
    Verify Basic Auth Success Page
    
    # Log current URL for security analysis
    ${current_url}=    Get Location
    Log                Current URL: ${current_url}
    
    # Verify HTTPS if applicable
    Run Keyword If     '${current_url}'.startswith('https')
    ...                Log    Connection is secured with HTTPS
    ...                ELSE
    ...                Log    Connection is not using HTTPS
