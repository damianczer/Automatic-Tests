*** Settings ***
Documentation       File Upload functionality tests for the-internet.herokuapp.com
Library             SeleniumLibrary
Library             OperatingSystem
Resource            ../keywords/common_keywords.robot
Resource            ../keywords/homepage_keywords.robot
Resource            ../keywords/file_upload_keywords.robot
Resource            ../resources/variables.robot

Test Setup          Open Browser And Setup
Test Teardown       Close Browser And Cleanup
Test Tags           file_upload

*** Test Cases ***
TC001 - Check File Upload Link Availability On Homepage
    [Documentation]    Verify that File Upload link is available on homepage
    [Tags]    smoke    navigation    file_upload
    Verify Homepage Is Loaded
    Verify Link Exists    File Upload

TC002 - Navigate To File Upload Page
    [Documentation]    Navigate from homepage to File Upload page
    [Tags]    smoke    navigation    file_upload
    Verify Homepage Is Loaded
    Click File Upload Link
    Verify File Upload Page Content

TC003 - Verify File Upload Page Content
    [Documentation]    Verify that File Upload page contains expected content and elements
    [Tags]    content    functionality    file_upload
    Navigate To File Upload Page
    Verify File Upload Page Content
    Verify Page Header
    Test Basic File Upload Functionality

TC004 - Verify File Upload Elements Properties
    [Documentation]    Check properties of file upload form elements
    [Tags]    functionality    file_upload    forms
    Navigate To File Upload Page
    Verify File Input Properties
    Verify Upload Button Properties

TC005 - Upload Text File
    [Documentation]    Test uploading a text file
    [Tags]    functionality    file_upload    forms
    Navigate To File Upload Page
    Upload And Verify File    test_upload.txt    This is a test text file for upload testing.

TC006 - Upload Different File Types
    [Documentation]    Test uploading different file types
    [Tags]    functionality    file_upload    forms
    Navigate To File Upload Page
    # Test with CSV file
    ${csv_file}    Create Test File    test_data.csv    name,age,city\nJohn,25,New York\nJane,30,London
    ${absolute_path}    Normalize Path    ${EXECDIR}${/}${csv_file}
    Upload File    ${absolute_path}
    Verify File Upload Success    test_data.csv
    Cleanup Test File    ${csv_file}

TC007 - Multiple File Upload Operations
    [Documentation]    Test multiple file upload operations in sequence
    [Tags]    functionality    file_upload    forms
    Navigate To File Upload Page
    # Upload first file
    Upload And Verify File    first_file.txt    Content of first file
    # Navigate back and upload second file
    Navigate To File Upload Page
    Upload And Verify File    second_file.txt    Content of second file

TC008 - File Upload Form Validation
    [Documentation]    Verify file upload form behavior and validation
    [Tags]    functionality    file_upload    validation    forms
    Navigate To File Upload Page
    # Verify initial state
    Verify File Upload Page Content
    # Test form elements
    Element Should Be Visible    ${FILE_INPUT}
    Element Should Be Visible    ${UPLOAD_BUTTON}
    # Verify page structure
    ${header}    Get Page Header Text
    Should Be Equal    ${header}    File Uploader
    # Test upload functionality
    Upload And Verify File    validation_test.txt    File upload validation test content