*** Settings ***
Documentation     A/B Testing functionality tests for the-internet.herokuapp.com
Library           SeleniumLibrary
Resource          ../keywords/common_keywords.robot
Resource          ../keywords/homepage_keywords.robot
Resource          ../keywords/ab_testing_keywords.robot
Resource          ../resources/variables.robot

Test Setup        Open Browser And Setup
Test Teardown     Close Browser And Cleanup

*** Test Cases ***
TC001 - Check A/B Testing Link Availability On Homepage
    [Documentation]    Verifies that A/B Testing link is available on homepage
    [Tags]             smoke    homepage    ab_testing
    
    Verify Homepage Is Loaded
    Verify Link Exists    A/B Testing

TC002 - Navigate To A/B Testing Page
    [Documentation]    Verifies navigation from homepage to A/B Testing page
    [Tags]             smoke    navigation    ab_testing
    
    Verify Homepage Is Loaded
    Click A/B Testing Link
    Verify A/B Testing Page Is Loaded

TC003 - Verify A/B Testing Page Content
    [Documentation]    Verifies that A/B Testing page displays correct content
    [Tags]             content    ab_testing
    
    Navigate To Page    ${AB_TESTING_URL}
    Verify A/B Testing Page Is Loaded
    Verify A/B Testing Page Description

TC004 - Check A/B Testing Variant Display
    [Documentation]    Verifies which A/B Testing variant is displayed
    [Tags]             functionality    ab_testing
    
    Navigate To Page    ${AB_TESTING_URL}
    Verify A/B Testing Page Is Loaded
    ${variant}=        Check A/B Testing Variant
    Log                Displayed variant: ${variant}

TC005 - Test A/B Testing Page Refresh Behavior
    [Documentation]    Verifies that page refresh may change A/B Testing variant
    [Tags]             functionality    ab_testing    refresh
    
    Navigate To Page    ${AB_TESTING_URL}
    Verify A/B Testing Page Is Loaded
    ${variant1}=       Check A/B Testing Variant
    
    # Refresh page several times to check different variants
    FOR    ${i}    IN RANGE    5
        Reload Page
        Sleep    1s
        ${variant}=    Check A/B Testing Variant
        Log    Iteration ${i+1}: ${variant}
    END
