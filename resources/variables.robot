*** Variables ***
# URLs
${BASE_URL}              https://the-internet.herokuapp.com
${AB_TESTING_URL}        ${BASE_URL}/abtest
${ADD_REMOVE_URL}        ${BASE_URL}/add_remove_elements/

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
${ADD_ELEMENT_BUTTON}    xpath=//button[text()='Add Element']
${DELETE_BUTTON}         xpath=//button[contains(text(),'Delete')]
${PAGE_HEADER}           tag=h3
