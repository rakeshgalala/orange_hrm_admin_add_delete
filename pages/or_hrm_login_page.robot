*** Settings ***
Documentation    to do login to orange hrm
Library    SeleniumLibrary
Resource    ${EXECDIR}/data_files/variables_inputs_orange_hrm.robot

*** Variables ***
&{OHL_LOCATORS}
...    username_locator=css:input#txtUsername
...    password_locator=css:input#txtPassword
...    login_button_locator=css:input#btnLogin
...    verify_login_locator=xpath://*[text()='Dashboard']

*** Keywords ***
Login To Orange Hrm
    [Documentation]    login to orange hrm
    Input Text    ${OHL_LOCATORS.username_locator}    ${USER_NAME}
    Input Text    ${OHL_LOCATORS.password_locator}    ${PASSWORD}
    Click Element    ${OHL_LOCATORS.login_button_locator}    

Validate User Login
    [Documentation]    veify login is succesful or not    
    Element Text Should Be    ${OHL_LOCATORS.verify_login_locator}    Dashboard