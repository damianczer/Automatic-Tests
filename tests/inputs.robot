*** Settings ***
Documentation       Inputs functionality tests for the-internet.herokuapp.com
Library             SeleniumLibrary
Resource            ../keywords/common_keywords.robot
Resource            ../keywords/homepage_keywords.robot
Resource            ../keywords/inputs_keywords.robot
Resource            ../resources/variables.robot

Test Setup          Open Browser And Setup
Test Teardown       Close Browser And Cleanup
Test Tags           inputs

*** Test Cases ***
TC001 - Check Inputs Link Availability On Homepage
    [Documentation]    Verify that Inputs link is available on homepage
    [Tags]    smoke    navigation    inputs
    Verify Homepage Is Loaded
    Verify Link Exists    Inputs

TC002 - Navigate To Inputs Page
    [Documentation]    Navigate from homepage to Inputs page
    [Tags]    smoke    navigation    inputs
    Verify Homepage Is Loaded
    Click Inputs Link
    Verify Inputs Page Content

TC003 - Verify Inputs Page Content
    [Documentation]    Verify that Inputs page contains expected content and elements
    [Tags]    content    functionality    inputs
    Navigate To Inputs Page
    Verify Inputs Page Content
    Verify Page Header
    Verify Number Input Exists

TC004 - Test Number Input With Valid Number
    [Documentation]    Test entering valid number in input field
    [Tags]    functionality    inputs    validation
    Navigate To Inputs Page
    Enter Number In Input    12345
    Verify Number Input Value    12345

TC005 - Test Number Input With Negative Number
    [Documentation]    Test entering negative number in input field
    [Tags]    functionality    inputs    validation
    Navigate To Inputs Page
    Enter Number In Input    -999
    Verify Number Input Value    -999

TC006 - Test Number Input With Zero
    [Documentation]    Test entering zero in input field
    [Tags]    functionality    inputs    validation
    Navigate To Inputs Page
    Enter Number In Input    0
    Verify Number Input Value    0

TC007 - Test Number Input Increment And Decrement
    [Documentation]    Test using arrow keys to increment and decrement values
    [Tags]    functionality    inputs    interactions
    Navigate To Inputs Page
    Enter Number In Input    10
    Increment Number Input
    Verify Number Input Value    11
    Decrement Number Input
    Verify Number Input Value    10

TC008 - Multiple Input Operations
    [Documentation]    Test multiple input operations in sequence
    [Tags]    functionality    inputs    validation
    Navigate To Inputs Page
    # Test various numbers
    Enter Number In Input    100
    Verify Number Input Value    100
    Clear Number Input
    Enter Number In Input    -50
    Verify Number Input Value    -50
    Clear Number Input
    Enter Number In Input    0
    Verify Number Input Value    0