*** Settings ***
Documentation     Login to ${SITE_NAME}.
Variables    data/${VAR_FILE}
Resource          webmail_resources.robot
Library           Selenium2Library  timeout=30.0  implicit_wait=0.0  run_on_failure=Capture Page Screenshot  screenshot_root_directory=None
Test Setup    Open WebBrowser
Test Teardown    Close WebBrowser

*** Test Cases ***
First Test
	Open Sign In Page    ${SITE_URL}    ${SIGNIN_LOCATOR}
    Open Login Form    ${SIGNIN_LOCATOR}    ${USER_NAME_LOCATOR}
	Enter User Name    ${USER_NAME_LOCATOR}    ${USER_NAME}
	Navigate To User Password    ${NEXT_BUTTON_LOCATOR}    ${USER_PASSWORD_LOCATOR}
    Enter User Password    ${USER_PASSWORD_LOCATOR}    ${USER_PASSWORD}
    Submit Login Form   ${SUBMIT_BUTTON_LOCATOR}
	Ensure Web Email Is Opened    ${COMPOSE_ELEMENT_LOCATOR}    ${CHECK_ELEMENT_LOCATOR}