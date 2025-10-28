*** Settings ***
Documentation       JavaScript Alerts functionality tests for the-internet.herokuapp.com
Library             SeleniumLibrary
Resource            ../keywords/common_keywords.robot
Resource            ../keywords/homepage_keywords.robot
Resource            ../keywords/javascript_alerts_keywords.robot
Resource            ../resources/variables.robot

Test Setup          Open Browser And Setup
Test Teardown       Close Browser And Cleanup
Test Tags           javascript_alerts

*** Test Cases ***
TC001 - Check JavaScript Alerts Link Availability On Homepage
    [Documentation]    Verify that JavaScript Alerts link is available on homepage
    [Tags]    smoke    navigation    javascript_alerts
    Verify Homepage Is Loaded
    Verify Link Exists    JavaScript Alerts

TC002 - Navigate To JavaScript Alerts Page
    [Documentation]    Navigate from homepage to JavaScript Alerts page
    [Tags]    smoke    navigation    javascript_alerts
    Verify Homepage Is Loaded
    Click JavaScript Alerts Link
    Verify JavaScript Alerts Page Content

TC003 - Verify JavaScript Alerts Page Content
    [Documentation]    Verify that JavaScript Alerts page contains expected content and elements
    [Tags]    content    functionality    javascript_alerts
    Navigate To JavaScript Alerts Page
    Verify JavaScript Alerts Page Content
    Verify Page Header
    Test Basic JavaScript Alerts Functionality

TC004 - Test JavaScript Alert Dialog
    [Documentation]    Test basic JavaScript alert dialog
    [Tags]    functionality    javascript_alerts    alerts
    Navigate To JavaScript Alerts Page
    Test JS Alert

TC005 - Test JavaScript Confirm Dialog Accept
    [Documentation]    Test JavaScript confirm dialog with accept action
    [Tags]    functionality    javascript_alerts    alerts
    Navigate To JavaScript Alerts Page
    Test JS Confirm Accept

TC006 - Test JavaScript Confirm Dialog Dismiss
    [Documentation]    Test JavaScript confirm dialog with dismiss action
    [Tags]    functionality    javascript_alerts    alerts
    Navigate To JavaScript Alerts Page
    Test JS Confirm Dismiss

TC007 - Test JavaScript Prompt Dialog
    [Documentation]    Test JavaScript prompt dialog with text input
    [Tags]    functionality    javascript_alerts    alerts
    Navigate To JavaScript Alerts Page
    Test JS Prompt With Text    Hello Robot Framework!

TC008 - Multiple JavaScript Alerts Operations
    [Documentation]    Test multiple JavaScript alerts operations in sequence
    [Tags]    functionality    javascript_alerts    alerts    validation
    Navigate To JavaScript Alerts Page
    # Test alert
    Test JS Alert
    # Test confirm accept
    Test JS Confirm Accept
    # Test confirm dismiss
    Test JS Confirm Dismiss
    # Test prompt with different text
    Test JS Prompt With Text    Final Test Input