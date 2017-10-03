*** Settings ***
Documentation     Login to GMAIL.
Variables    data/${VAR_FILE}
Resource          webmail_resources.robot
Library           Selenium2Library  timeout=30.0  implicit_wait=0.0  run_on_failure=Capture Page Screenshot  screenshot_root_directory=None
Test Setup    Open WebBrowser
Test Teardown    Close WebBrowser

*** Test Cases ***
Templated test case
	[Template]    Open Sign In Page
    http://mail.com    xpath=//a[@id='login-button']
	https://www.gmail.com/intl/en/mail/help/about.html     xpath=//a[@id='gmail-sign-in']

    
