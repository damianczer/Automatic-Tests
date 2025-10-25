*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/variables.robot
Resource          common_keywords.robot

*** Keywords ***
Verify Add/Remove Elements Page Is Loaded
    [Documentation]    Verifies that Add/Remove Elements page is loaded correctly
    Verify Page URL    ${ADD_REMOVE_URL}
    Verify Element Is Visible    ${PAGE_HEADER}
    Verify Page Contains Text    Add/Remove Elements

Verify Add Element Button Is Visible
    [Documentation]    Verifies that Add Element button is available
    Verify Element Is Visible    ${ADD_ELEMENT_BUTTON}

Click Add Element Button
    [Documentation]    Clicks Add Element button
    Click Element And Wait    ${ADD_ELEMENT_BUTTON}

Get Delete Buttons Count
    [Documentation]    Gets the number of Delete buttons on page
    ${count}=    Get Element Count    ${DELETE_BUTTON}
    [Return]     ${count}

Click Delete Button
    [Documentation]    Clicks the first available Delete button
    [Arguments]        ${index}=1
    Click Element And Wait    xpath=(//button[contains(text(),'Delete')])[${index}]

Verify No Delete Buttons Exist
    [Documentation]    Verifies that no Delete buttons exist on page
    ${count}=    Get Element Count    ${DELETE_BUTTON}
    Should Be Equal As Numbers    ${count}    0

Add Multiple Elements
    [Documentation]    Adds specified number of elements
    [Arguments]        ${count}
    FOR    ${i}    IN RANGE    ${count}
        Click Add Element Button
        Sleep    0.5s    # Short delay for stability
    END

Remove All Elements
    [Documentation]    Removes all added elements
    ${count}=    Get Delete Buttons Count
    FOR    ${i}    IN RANGE    ${count}
        ${current_count}=    Get Delete Buttons Count
        Exit For Loop If    ${current_count} == 0
        Click Delete Button
        Sleep    0.5s    # Short delay for stability
    END
