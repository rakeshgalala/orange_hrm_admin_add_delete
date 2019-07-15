*** Settings ***
Documentation    all test cases of orange hrm
Resource    ${EXECDIR}/pages/or_hrm_login_page.robot
Resource    ${EXECDIR}/pages/or_hrm_admin_page.robot
Resource    ${EXECDIR}/commom_actions/common_actions.robot
Resource    ${EXECDIR}/data_files/variables_inputs_orange_hrm.robot
Library    SeleniumLibrary

*** Variables ***
${EMPLOYEE_NAME}    Linda Anderson
${NEW_USER}    raveendra
${USER_PASSWORD}    virat@123
${CONFIRM_PASSWORD}    virat@123


*** Test Cases ***
ORANGE HRM TEST CASES 
    [Documentation]    all test cases of orange hrm
    [Setup]    Test Setup
    Validate login Page Loading
    Login To Orange Hrm
    Validate User Login
    Click On Admin
    Validate Admin Page
    Click On Add User
    Fill New User Details    ${EMPLOYEE_NAME}    ${NEW_USER}    ${USER_PASSWORD}    ${CONFIRM_PASSWORD}
    Click Save Button
    Search for Added User    ${NEW_USER}    ${EMPLOYEE_NAME}
    Click Search Button
    Validate Added User
    Select The User To Delete
    Delete Selected User    
    [Teardown]    Test Teardown

*** Keywords ***
Test Setup
    [Documentation]    To launch a browser
    Open Browser    ${OP_BR_URL}    ${BROWSER}
    Maximize Browser Window
    
Validate login Page Loading
    Location Should Contain    orangehrmlive

Test Teardown
    [Documentation]    To close the current browser 
    Close Browser