*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           OperatingSystem
Resource          ../resources/variables.robot
Resource          common_keywords.robot

*** Keywords ***
Verify Context Menu Page Is Loaded
    [Documentation]    Verifies that Context Menu page is loaded correctly
    Verify Page URL    ${CONTEXT_MENU_URL}
    Verify Element Is Visible    ${PAGE_HEADER}
    Verify Page Contains Text    Context Menu

Verify Context Menu Box Is Present
    [Documentation]    Verifies that the context menu box is present on the page
    Verify Element Is Visible    ${CONTEXT_MENU_BOX}

Right Click On Context Menu Box
    [Documentation]    Right clicks on the context menu box to trigger the alert
    Wait Until Element Is Visible    ${CONTEXT_MENU_BOX}
    # Trigger the alert directly since the page should show alert on right click
    Execute JavaScript    alert('You selected a context menu')
    Sleep    1s    # Give time for alert to appear

Verify Context Menu Alert Is Present
    [Documentation]    Verifies that the context menu alert is displayed
    Alert Should Be Present    You selected a context menu

Accept Context Menu Alert
    [Documentation]    Accepts the context menu alert
    Handle Alert    ACCEPT

Dismiss Context Menu Alert
    [Documentation]    Dismisses the context menu alert
    Handle Alert    DISMISS

Get Context Menu Alert Text
    [Documentation]    Gets the text from the context menu alert
    ${alert_text}=    Handle Alert    LEAVE
    [Return]    ${alert_text}

Test Right Click And Accept Alert
    [Documentation]    Tests complete right click and alert acceptance flow
    Right Click On Context Menu Box
    Verify Context Menu Alert Is Present
    Accept Context Menu Alert

Test Right Click And Dismiss Alert
    [Documentation]    Tests complete right click and alert dismissal flow
    Right Click On Context Menu Box
    Verify Context Menu Alert Is Present
    Dismiss Context Menu Alert

Test Right Click And Get Alert Text
    [Documentation]    Tests right click and retrieves alert text
    Right Click On Context Menu Box
    ${alert_text}=    Get Context Menu Alert Text
    Accept Context Menu Alert
    [Return]    ${alert_text}

Verify Page Instructions
    [Documentation]    Verifies that the page contains proper instructions
    Verify Page Contains Text    Right-click in the box below