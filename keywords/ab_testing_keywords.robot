*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/variables.robot
Resource          common_keywords.robot

*** Keywords ***
Verify A/B Testing Page Is Loaded
    [Documentation]    Verifies that A/B Testing page is loaded correctly
    Verify Page URL    ${AB_TESTING_URL}
    Verify Element Is Visible    ${PAGE_HEADER}

Check A/B Testing Variant
    [Documentation]    Checks which A/B Testing variant is displayed
    ${header_text}=    Get Text    ${PAGE_HEADER}
    Should Match Regexp    ${header_text}    ^A/B Test (Control|Variation 1)$
    [Return]           ${header_text}

Verify A/B Testing Page Description
    [Documentation]    Verifies that page contains appropriate description
    Verify Page Contains Text    Also known as split testing
    # More general check for paragraph content
    Verify Element Is Visible    xpath=//p
