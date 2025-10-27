*** Settings ***
Documentation    Keywords for File Upload functionality tests
Library          SeleniumLibrary
Library          OperatingSystem
Resource         ../resources/variables.robot
Resource         common_keywords.robot

*** Keywords ***
Navigate To File Upload Page
    [Documentation]    Navigate to File Upload page
    Go To    ${FILE_UPLOAD_URL}
    Wait Until Page Contains Element    ${FILE_INPUT}    timeout=${EXPLICIT_WAIT}
    Wait Until Page Contains Element    ${UPLOAD_BUTTON}    timeout=${EXPLICIT_WAIT}
    Wait Until Page Contains    File Uploader    timeout=${EXPLICIT_WAIT}

Verify File Upload Page Content
    [Documentation]    Verify File Upload page contains expected elements
    Page Should Contain    File Uploader
    Element Should Be Visible    ${FILE_INPUT}
    Element Should Be Visible    ${UPLOAD_BUTTON}
    Element Should Be Enabled    ${FILE_INPUT}
    Element Should Be Enabled    ${UPLOAD_BUTTON}

Create Test File
    [Arguments]    ${filename}=test_file.txt    ${content}=This is a test file for upload testing.
    [Documentation]    Create a test file for upload testing
    Create File    ${filename}    ${content}
    File Should Exist    ${filename}
    [Return]    ${filename}

Upload File
    [Arguments]    ${file_path}
    [Documentation]    Upload a file using the file input element
    Choose File    ${FILE_INPUT}    ${file_path}
    Click Element    ${UPLOAD_BUTTON}
    Wait Until Page Contains Element    ${UPLOADED_FILES}    timeout=${EXPLICIT_WAIT}

Get Uploaded File Names
    [Documentation]    Get list of uploaded file names
    ${uploaded_text}    Get Text    ${UPLOADED_FILES}
    [Return]    ${uploaded_text}

Verify File Upload Success
    [Arguments]    ${expected_filename}
    [Documentation]    Verify that file upload was successful
    Page Should Contain    File Uploaded!
    ${uploaded_files}    Get Uploaded File Names
    Should Contain    ${uploaded_files}    ${expected_filename}

Get Page Header Text
    [Documentation]    Get the page header text
    ${header}    Get Text    ${PAGE_HEADER}
    [Return]    ${header}

Verify Page Header
    [Documentation]    Verify the page header is correct
    ${header}    Get Page Header Text
    Should Be Equal    ${header}    File Uploader

Test Basic File Upload Functionality
    [Documentation]    Test basic file upload functionality
    Verify File Upload Page Content
    Verify Page Header

Cleanup Test File
    [Arguments]    ${filename}
    [Documentation]    Remove test file after testing
    Remove File    ${filename}

Upload And Verify File
    [Arguments]    ${filename}=test_upload.txt    ${content}=Test content for file upload
    [Documentation]    Create, upload and verify file upload
    ${test_file}    Create Test File    ${filename}    ${content}
    ${absolute_path}    Normalize Path    ${EXECDIR}${/}${test_file}
    Upload File    ${absolute_path}
    Verify File Upload Success    ${filename}
    Cleanup Test File    ${test_file}

Verify File Input Properties
    [Documentation]    Verify properties of file input element
    Element Should Be Visible    ${FILE_INPUT}
    Element Should Be Enabled    ${FILE_INPUT}
    ${input_type}    Get Element Attribute    ${FILE_INPUT}    type
    Should Be Equal    ${input_type}    file

Verify Upload Button Properties
    [Documentation]    Verify properties of upload button
    Element Should Be Visible    ${UPLOAD_BUTTON}
    Element Should Be Enabled    ${UPLOAD_BUTTON}
    ${button_value}    Get Element Attribute    ${UPLOAD_BUTTON}    value
    Should Be Equal    ${button_value}    Upload