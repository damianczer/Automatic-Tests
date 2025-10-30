*** Settings ***
Documentation    Keywords for Hovers functionality tests
Library          SeleniumLibrary
Resource         ../resources/variables.robot
Resource         common_keywords.robot

*** Keywords ***
Navigate To Hovers Page
    [Documentation]    Navigate to Hovers page
    Go To    ${HOVERS_URL}
    Wait Until Page Contains Element    ${USER_IMAGE_1}    timeout=${EXPLICIT_WAIT}
    Wait Until Page Contains    Hovers    timeout=${EXPLICIT_WAIT}

Verify Hovers Page Content
    [Documentation]    Verify Hovers page contains expected elements
    Page Should Contain    Hovers
    Page Should Contain    Hover over the image for additional information
    Element Should Be Visible    ${USER_IMAGE_1}
    Element Should Be Visible    ${USER_IMAGE_2}
    Element Should Be Visible    ${USER_IMAGE_3}

Verify All User Images Exist
    [Documentation]    Verify that all three user images are present
    Element Should Be Visible    ${USER_IMAGE_1}
    Element Should Be Visible    ${USER_IMAGE_2}
    Element Should Be Visible    ${USER_IMAGE_3}
    # Verify images have correct structure
    Page Should Contain Element    ${USER_FIGURE_1}
    Page Should Contain Element    ${USER_FIGURE_2}
    Page Should Contain Element    ${USER_FIGURE_3}

Hover Over User Image
    [Arguments]    ${user_number}
    [Documentation]    Hover over specific user image by number (1, 2, or 3)
    ${figure_locator}=    Set Variable If
    ...    ${user_number} == 1    ${USER_FIGURE_1}
    ...    ${user_number} == 2    ${USER_FIGURE_2}
    ...    ${user_number} == 3    ${USER_FIGURE_3}
    Mouse Over    ${figure_locator}
    Sleep    0.5s    # Small delay to allow hover effect to display

Verify User Info Displayed
    [Arguments]    ${user_number}
    [Documentation]    Verify that user info is displayed after hover
    ${caption_locator}=    Set Variable If
    ...    ${user_number} == 1    ${USER_CAPTION_1}
    ...    ${user_number} == 2    ${USER_CAPTION_2}
    ...    ${user_number} == 3    ${USER_CAPTION_3}
    Wait Until Element Is Visible    ${caption_locator}    timeout=5s
    Element Should Be Visible    ${caption_locator}
    Element Should Contain    ${caption_locator}    name: user${user_number}

Verify User Profile Link
    [Arguments]    ${user_number}
    [Documentation]    Verify that user profile link is present and correct
    ${link_locator}=    Set Variable If
    ...    ${user_number} == 1    ${USER_LINK_1}
    ...    ${user_number} == 2    ${USER_LINK_2}
    ...    ${user_number} == 3    ${USER_LINK_3}
    Element Should Be Visible    ${link_locator}
    ${href}=    Get Element Attribute    ${link_locator}    href
    Should Contain    ${href}    /users/${user_number}

Test Hover On User
    [Arguments]    ${user_number}
    [Documentation]    Complete test of hover functionality for specific user
    # Hover over user image
    Hover Over User Image    ${user_number}
    # Verify info is displayed
    Verify User Info Displayed    ${user_number}
    # Verify profile link
    Verify User Profile Link    ${user_number}

Verify All User Profile Links
    [Documentation]    Verify all three user profile links
    Hover Over User Image    1
    Verify User Profile Link    1
    Hover Over User Image    2
    Verify User Profile Link    2
    Hover Over User Image    3
    Verify User Profile Link    3

Get Page Header Text
    [Documentation]    Get the page header text
    ${header}=    Get Text    ${PAGE_HEADER}
    [Return]    ${header}

Verify Page Header
    [Documentation]    Verify the page header is correct
    ${header}=    Get Page Header Text
    Should Be Equal    ${header}    Hovers