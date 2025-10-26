*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/variables.robot
Resource          common_keywords.robot

*** Keywords ***
Verify Homepage Is Loaded
    [Documentation]    Verifies that the-internet homepage is loaded correctly
    Verify Element Is Visible    xpath=//h1[contains(text(), 'Welcome to the-internet')]
    Verify Page Contains Text     Available Examples

Click A/B Testing Link
    [Documentation]    Clicks A/B Testing link on homepage
    Click Element And Wait    ${AB_TESTING_LINK}

Verify Available Examples List
    [Documentation]    Verifies that examples list is visible
    Verify Element Is Visible    xpath=//ul
    ${links_count}=    Get Element Count    xpath=//ul/li/a
    Should Be True     ${links_count} > 0    Examples list should contain at least one element

Verify Link Exists
    [Documentation]    Verifies that specified link exists on homepage
    [Arguments]        ${link_text}
    Verify Element Is Visible    xpath=//a[contains(text(), '${link_text}')]

Click Add/Remove Elements Link
    [Documentation]    Clicks Add/Remove Elements link on homepage
    Click Element And Wait    ${ADD_REMOVE_LINK}

Click Basic Auth Link
    [Documentation]    Clicks Basic Auth link on homepage
    Click Element And Wait    ${BASIC_AUTH_LINK}

Click Checkboxes Link
    [Documentation]    Clicks Checkboxes link on homepage
    Click Element And Wait    ${CHECKBOXES_LINK}

Click Context Menu Link
    [Documentation]    Clicks Context Menu link on homepage
    Click Element And Wait    ${CONTEXT_MENU_LINK}
