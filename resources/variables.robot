*** Variables ***
# URLs
${BASE_URL}              https://the-internet.herokuapp.com
${AB_TESTING_URL}        ${BASE_URL}/abtest
${ADD_REMOVE_URL}        ${BASE_URL}/add_remove_elements/
${BASIC_AUTH_URL}        ${BASE_URL}/basic_auth
${CHECKBOXES_URL}        ${BASE_URL}/checkboxes
${CONTEXT_MENU_URL}      ${BASE_URL}/context_menu

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
${ADD_ELEMENT_BUTTON}    xpath=//button[text()='Add Element']
${DELETE_BUTTON}         xpath=//button[contains(text(),'Delete')]
${CHECKBOX_1}            xpath=//input[@type='checkbox'][1]
${CHECKBOX_2}            xpath=//input[@type='checkbox'][2]
${CONTEXT_MENU_BOX}      id=hot-spot
${PAGE_HEADER}           tag=h3
