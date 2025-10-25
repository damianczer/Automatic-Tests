*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/variables.robot
Resource          common_keywords.robot

*** Keywords ***
Navigate To Basic Auth With Credentials
    [Documentation]    Navigates to Basic Auth page using URL with embedded credentials
    Navigate To Page    ${BASIC_AUTH_URL_WITH_CREDS}

Verify Basic Auth Success Page
    [Documentation]    Verifies that Basic Auth was successful and success page is displayed
    Verify Page Contains Text    Congratulations! You must have the proper credentials

Verify Basic Auth Page Content
    [Documentation]    Verifies the content of Basic Auth success page
    Verify Page Contains Text    Basic Auth
    Verify Page Contains Text    Congratulations! You must have the proper credentials
