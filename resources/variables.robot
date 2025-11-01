*** Variables ***
# URLs
${BASE_URL}              https://the-internet.herokuapp.com
${AB_TESTING_URL}        ${BASE_URL}/abtest
${ADD_REMOVE_URL}        ${BASE_URL}/add_remove_elements/
${BASIC_AUTH_URL}        ${BASE_URL}/basic_auth
${CHECKBOXES_URL}        ${BASE_URL}/checkboxes
${CONTEXT_MENU_URL}      ${BASE_URL}/context_menu
${DROPDOWN_URL}          ${BASE_URL}/dropdown
${DRAG_AND_DROP_URL}     ${BASE_URL}/drag_and_drop
${FILE_UPLOAD_URL}       ${BASE_URL}/upload
${JS_ALERTS_URL}         ${BASE_URL}/javascript_alerts
${DYNAMIC_LOADING_URL}   ${BASE_URL}/dynamic_loading
${DYNAMIC_LOADING_EXAMPLE1_URL}    ${BASE_URL}/dynamic_loading/1
${DYNAMIC_LOADING_EXAMPLE2_URL}    ${BASE_URL}/dynamic_loading/2
${HOVERS_URL}            ${BASE_URL}/hovers
${INPUTS_URL}            ${BASE_URL}/inputs

# Basic Auth credentials
${BASIC_AUTH_USER}       admin
${BASIC_AUTH_PASS}       admin
${BASIC_AUTH_URL_WITH_CREDS}    https://${BASIC_AUTH_USER}:${BASIC_AUTH_PASS}@the-internet.herokuapp.com/basic_auth

# Browser settings
${BROWSER}               chrome
${HEADLESS}              False
${IMPLICIT_WAIT}         10
${EXPLICIT_WAIT}         30

# Window settings
${WINDOW_WIDTH}          1920
${WINDOW_HEIGHT}         1080

# Selectors
${AB_TESTING_LINK}       xpath=//a[@href='/abtest']
${ADD_REMOVE_LINK}       xpath=//a[@href='/add_remove_elements/']
${BASIC_AUTH_LINK}       xpath=//a[@href='/basic_auth']
${CHECKBOXES_LINK}       xpath=//a[@href='/checkboxes']
${CONTEXT_MENU_LINK}     xpath=//a[@href='/context_menu']
${DROPDOWN_LINK}         xpath=//a[@href='/dropdown']
${DRAG_AND_DROP_LINK}    xpath=//a[@href='/drag_and_drop']
${FILE_UPLOAD_LINK}      xpath=//a[@href='/upload']
${JS_ALERTS_LINK}        xpath=//a[@href='/javascript_alerts']
${DYNAMIC_LOADING_LINK}  xpath=//a[@href='/dynamic_loading']
${DYNAMIC_LOADING_EXAMPLE1_LINK}    xpath=//a[@href='/dynamic_loading/1']
${DYNAMIC_LOADING_EXAMPLE2_LINK}    xpath=//a[@href='/dynamic_loading/2']
${HOVERS_LINK}           xpath=//a[@href='/hovers']
${INPUTS_LINK}           xpath=//a[@href='/inputs']
${ADD_ELEMENT_BUTTON}    xpath=//button[text()='Add Element']
${DELETE_BUTTON}         xpath=//button[contains(text(),'Delete')]
${CHECKBOX_1}            xpath=//input[@type='checkbox'][1]
${CHECKBOX_2}            xpath=//input[@type='checkbox'][2]
${CONTEXT_MENU_BOX}      id=hot-spot
${DROPDOWN_SELECT}       id=dropdown
${DRAG_COLUMN_A}         id=column-a
${DRAG_COLUMN_B}         id=column-b
${FILE_INPUT}            id=file-upload
${UPLOAD_BUTTON}         id=file-submit
${UPLOADED_FILES}        id=uploaded-files
${JS_ALERT_BUTTON}       xpath=//button[contains(text(),'Click for JS Alert')]
${JS_CONFIRM_BUTTON}     xpath=//button[contains(text(),'Click for JS Confirm')]
${JS_PROMPT_BUTTON}      xpath=//button[contains(text(),'Click for JS Prompt')]
${RESULT_TEXT}           id=result
${START_BUTTON}          xpath=//button[text()='Start']
${LOADING_INDICATOR}     id=loading
${HELLO_WORLD_TEXT}      id=finish
${USER_FIGURE_1}         xpath=//div[@class='figure'][1]
${USER_FIGURE_2}         xpath=//div[@class='figure'][2]
${USER_FIGURE_3}         xpath=//div[@class='figure'][3]
${USER_IMAGE_1}          xpath=//div[@class='figure'][1]//img
${USER_IMAGE_2}          xpath=//div[@class='figure'][2]//img
${USER_IMAGE_3}          xpath=//div[@class='figure'][3]//img
${USER_CAPTION_1}        xpath=//div[@class='figure'][1]//h5
${USER_CAPTION_2}        xpath=//div[@class='figure'][2]//h5
${USER_CAPTION_3}        xpath=//div[@class='figure'][3]//h5
${USER_LINK_1}           xpath=//div[@class='figure'][1]//a
${USER_LINK_2}           xpath=//div[@class='figure'][2]//a
${USER_LINK_3}           xpath=//div[@class='figure'][3]//a
${NUMBER_INPUT}          xpath=//input[@type='number']
${PAGE_HEADER}           tag=h3
