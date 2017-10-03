*** Settings ***
Documentation     Login to GMAIL.

Resource          webmail_resources.robot
Library           Selenium2Library  timeout=30.0  implicit_wait=0.0  run_on_failure=Capture Page Screenshot  screenshot_root_directory=None
Test Setup    Open WebBrowser
Test Teardown    Close WebBrowser


*** Variables ***
${BROWSER}  firefox
${HUB}  http://localhost:4445/wd/hub
${INIT_URL}  http://google.com
${GMAIL_URL}  https://www.gmail.com/intl/en/mail/help/about.html
${GMAIL_SIGNIN_LOCATOR}  xpath=//a[@id='gmail-sign-in']
${GMAIL_USER_NAME_LOCATOR}   xpath=//input[@id='Email']
${GMAIL_NEXT_BUTTON_LOCATOR}   xpath=//input[@id='next']
${GMAIL_PASSWORD_LOCATOR}   xpath=//input[@id='Passwd']
${GMAIL_SUBMIT_BUTTON_LOCATOR}  xpath=//input[@id='signIn']
${GMAIL_USER_NAME}  qa1509161
${GMAIL_USER_PASSWORD}  1Qazxsw2!
${GMAIL_COMPOSE_ELEMENT_LOCATOR}   xpath=//div[text()='COMPOSE']
${GMAIL_INBOX_ELEMENT_LOCATOR}   xpath=//a[contains(@title,'Inbox')]

${MAIL_URL}    http://www.mail.com
${MAIL_SIGNIN_LOCATOR}   xpath=//a[@id='login-button']
${MAIL_USER_NAME_LOCATOR}   xpath=//input[@id="login-email"]
${MAIL_USER_PASSWORD_LOCATOR}   xpath=//input[@id="login-password"]
${MAIL_SUBMIT_BUTTON_LOCATOR}   xpath=//button/span[text()='Log in']
${MAIL_USER_NAME}   qa1509161
${MAIL_USER_PASSWORD}    1Qazxsw2!
${MAIL_AD_TEXT}    Upgrade your email experience now and save 33% with a yearly subscription.
${MAIL_GO_TO_EMAIL_LOCATOR}    xpath=//a[text()='go to mail.com']
${MAIL_COMPOSE_ELEMENT_LOCATOR}    xpath=//*[contains(text(),'E-mail')]
${MAIL_HOME_ELEMENT_LOCATOR}    xpath=//div[@id='navigator']//div[text()='Home']
#//div[@id='container']//div[@id='navigation']//a[@title='E-mail']
*** Test Cases ***
Login into GMAIL.COM
    Go To  ${GMAIL_URL}	
	Wait Until Page Contains Element  ${GMAIL_SIGNIN_LOCATOR}
	Click Element  ${GMAIL_SIGNIN_LOCATOR}
    Wait Until Page Contains Element  ${GMAIL_USER_NAME_LOCATOR}
	Wait Until Page Contains Element  ${GMAIL_NEXT_BUTTON_LOCATOR}
	#
	Input Text  ${GMAIL_USER_NAME_LOCATOR}  ${GMAIL_USER_NAME}
	Click Element   ${GMAIL_NEXT_BUTTON_LOCATOR}
	Wait Until Page Contains Element  ${GMAIL_PASSWORD_LOCATOR}
	Input Text  ${GMAIL_PASSWORD_LOCATOR}  ${GMAIL_USER_PASSWORD}
    Wait Until Page Contains Element  ${GMAIL_SUBMIT_BUTTON_LOCATOR}
	#	
	Click Element   ${GMAIL_SUBMIT_BUTTON_LOCATOR}
	Wait Until Page Contains Element   ${GMAIL_COMPOSE_ELEMENT_LOCATOR}
	Wait Until Page Contains Element   ${GMAIL_INBOX_ELEMENT_LOCATOR}
	
Login into MAIL.COM
    Log    Starting Login test into mail.com site
    Go To    ${MAIL_URL}
	Wait Until Page Contains Element    ${MAIL_SIGNIN_LOCATOR}
	#
	Click Element    ${MAIL_SIGNIN_LOCATOR}
	Wait Until Element Is Visible   ${MAIL_USER_NAME_LOCATOR}
	Wait Until Element Is Visible   ${MAIL_USER_PASSWORD_LOCATOR}
	Wait Until Element Is Visible   ${MAIL_SUBMIT_BUTTON_LOCATOR}
    #
	Element Should Be Visible    ${MAIL_USER_NAME_LOCATOR}     message=User name field is not visible
	Element Should Be Visible    ${MAIL_USER_PASSWORD_LOCATOR}    message=User password field is not visible
	Element Should Be Visible    ${MAIL_SUBMIT_BUTTON_LOCATOR}    message=Submit button is not visible
	#
	Input Text     ${MAIL_USER_NAME_LOCATOR}    ${MAIL_USER_NAME}
    Input Text     ${MAIL_USER_PASSWORD_LOCATOR}      ${MAIL_USER_PASSWORD}
	Click Element    ${MAIL_SUBMIT_BUTTON_LOCATOR}	
	#Page Should Contain Link    ${MAIL_GO_TO_EMAIL_LOCATOR}
	#Click Element    ${MAIL_GO_TO_EMAIL_LOCATOR}
	#Select Frame    
	Wait Until Page Contains Element   ${MAIL_HOME_ELEMENT_LOCATOR}
	Wait Until Page Contains Element   ${MAIL_COMPOSE_ELEMENT_LOCATOR}

	 
#*** Keywords ***
Open WebBrowser 
    Open Browser  ${INIT_URL}  ${BROWSER}  alias=gmail  remote_url=${HUB}
	Maximize Browser Window
	Delete All Cookies
	
	
Close WebBrowser
    Close All Browsers
