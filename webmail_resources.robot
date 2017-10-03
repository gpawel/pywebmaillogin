*** Settings ***
#Test Template    Open Sign In Page

*** Variables ***
${HUB}  http://localhost:4445/wd/hub
${INIT_URL}    http://google.com


*** Keywords ***
Open WebBrowser    
    Open Browser  ${INIT_URL}  ${BROWSER}  alias=None  remote_url=${HUB}
	Maximize Browser Window
	Delete All Cookies
	
Close WebBrowser
    Close All Browsers

Open Sign In Page
     [Arguments]    ${URL}    ${IDENTITY_LOCATOR}
	 Go To    ${URL}
	 Wait Until Page Contains Element   ${IDENTITY_LOCATOR}
	 Wait Until Element Is Visible    ${IDENTITY_LOCATOR}
	 Page Should Contain Element    ${IDENTITY_LOCATOR}
	 
Open Login Form
    [Arguments]    ${SIGNIN_LOCATOR}    ${USER_NAME_LOCATOR}
    Wait Until Element Is Visible    ${SIGNIN_LOCATOR}
	Click Element    ${SIGNIN_LOCATOR}
	Wait Until Element Is Visible   ${USER_NAME_LOCATOR}

Enter User Name
	[Arguments]    ${USER_NAME_LOCATOR}    ${USER_NAME}
	Input Text     ${USER_NAME_LOCATOR}    ${USER_NAME}
	
Navigate To User Password
    [Arguments]    @{args}
	: FOR    ${item}    IN    @{args}
	\    Wait Until Element Is Visible    ${item}
    \    Click Element    ${item}

Enter User Password
    [Arguments]    ${USER_PASSWORD_LOCATOR}    ${USER_PASSWORD}
    Wait Until Element Is Visible    ${USER_PASSWORD_LOCATOR}
	Input Text  ${USER_PASSWORD_LOCATOR}  ${USER_PASSWORD}
	
Submit Login Form
    [Arguments]    @{args}
	: FOR    ${item}    IN    @{args}
	\    Wait Until Element Is Visible    ${item}
    \    Click Element    ${item}

Ensure Web Email Is Opened
	[Arguments]    @{args}
	: FOR    ${item}    IN    @{args}
	\    Wait Until Page Contains Element   ${item}
	\    Wait Until Element Is Visible    ${item}
    