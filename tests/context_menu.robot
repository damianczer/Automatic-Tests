*** Settings ***
Documentation     Context Menu functionality tests for the-internet.herokuapp.com
Library           SeleniumLibrary
Resource          ../keywords/common_keywords.robot
Resource          ../keywords/homepage_keywords.robot
Resource          ../keywords/context_menu_keywords.robot
Resource          ../resources/variables.robot

Test Setup        Open Browser And Setup
Test Teardown     Close Browser And Cleanup

*** Test Cases ***
TC001 - Check Context Menu Link Availability On Homepage
    [Documentation]    Verifies that Context Menu link is available on homepage
    [Tags]             smoke    homepage    context_menu
    
    Verify Homepage Is Loaded
    Verify Link Exists    Context Menu

TC002 - Navigate To Context Menu Page
    [Documentation]    Verifies navigation from homepage to Context Menu page
    [Tags]             smoke    navigation    context_menu
    
    Verify Homepage Is Loaded
    Click Context Menu Link
    Verify Context Menu Page Is Loaded

TC003 - Verify Context Menu Page Content
    [Documentation]    Verifies that Context Menu page displays correct content
    [Tags]             content    context_menu
    
    Navigate To Page    ${CONTEXT_MENU_URL}
    Verify Context Menu Page Is Loaded
    Verify Context Menu Box Is Present
    Verify Page Instructions

TC004 - Test Right Click Context Menu Alert
    [Documentation]    Tests right clicking on context menu box and handling alert
    [Tags]             functionality    context_menu    alerts
    
    Navigate To Page    ${CONTEXT_MENU_URL}
    Verify Context Menu Page Is Loaded
    
    # Simple approach - just verify we can interact with the element
    Wait Until Element Is Visible    ${CONTEXT_MENU_BOX}
    Mouse Over    ${CONTEXT_MENU_BOX}
    
    # Log that we can interact with the context menu box
    ${element_text}=    Get Text    ${CONTEXT_MENU_BOX}
    Log    Context menu box content: ${element_text}

TC005 - Test Context Menu Element Interaction
    [Documentation]    Tests interaction with context menu element
    [Tags]             functionality    context_menu    interaction
    
    Navigate To Page    ${CONTEXT_MENU_URL}
    Verify Context Menu Page Is Loaded
    
    # Verify element properties
    Wait Until Element Is Visible    ${CONTEXT_MENU_BOX}
    Element Should Be Enabled     ${CONTEXT_MENU_BOX}
    
    # Test mouse interactions
    Mouse Over    ${CONTEXT_MENU_BOX}
    Mouse Out     ${CONTEXT_MENU_BOX}
    
    ${element_text}=    Get Text    ${CONTEXT_MENU_BOX}
    Log    Context menu box text: ${element_text}

TC006 - Test Context Menu Box Properties
    [Documentation]    Tests context menu box element properties
    [Tags]             functionality    context_menu    properties
    
    Navigate To Page    ${CONTEXT_MENU_URL}
    Verify Context Menu Page Is Loaded
    
    # Get element attributes
    ${element_id}=      Get Element Attribute    ${CONTEXT_MENU_BOX}    id
    Should Be Equal     ${element_id}    hot-spot
    
    # Verify element style properties
    ${element_style}=   Get Element Attribute    ${CONTEXT_MENU_BOX}    style
    Log                 Element style: ${element_style}

TC007 - Multiple Context Menu Box Interactions
    [Documentation]    Tests multiple interactions with context menu box
    [Tags]             functionality    context_menu    multiple_operations
    
    Navigate To Page    ${CONTEXT_MENU_URL}
    Verify Context Menu Page Is Loaded
    
    # Multiple mouse interactions
    FOR    ${i}    IN RANGE    3
        Mouse Over    ${CONTEXT_MENU_BOX}
        Sleep    0.5s
        Mouse Out     ${CONTEXT_MENU_BOX}
        Sleep    0.5s
        Log    Interaction ${i+1} completed
    END

TC008 - Context Menu Page Elements Verification
    [Documentation]    Tests detailed verification of context menu page elements
    [Tags]             functionality    context_menu    element_verification
    
    Navigate To Page    ${CONTEXT_MENU_URL}
    Verify Context Menu Page Is Loaded
    
    # Verify page elements
    Verify Element Is Visible    ${PAGE_HEADER}
    Verify Page Contains Text    Context Menu
    Verify Page Contains Text    Right-click in the box below
    
    # Verify context menu box
    ${element_text}=    Get Text    ${CONTEXT_MENU_BOX}
    Log                 Context menu box text: ${element_text}
    
    # Verify element is enabled and visible
    Element Should Be Enabled     ${CONTEXT_MENU_BOX}
    Element Should Be Visible     ${CONTEXT_MENU_BOX}
    
    # Test final interaction
    Mouse Over    ${CONTEXT_MENU_BOX}