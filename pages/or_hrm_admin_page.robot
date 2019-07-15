*** Settings ***
Documentation    to add and delete an user
Library    SeleniumLibrary
Resource    ${EXECDIR}/data_files/variables_inputs_orange_hrm.robot

*** Variables ***
&{OR_ADMIN_LOCATORS}
...    add_user_locator=css:input#btnAdd
...    employee_name_locator=css:input#systemUser_employeeName_empName
...    new_user_name_locator=css:input#systemUser_userName
...    create_password_locator=css:input#systemUser_password
...    confirm_password_locator=css:input#systemUser_confirmPassword
...    save_button_locator=//input[@id='btnSave']
...    search_button_locator=//input[@id='searchBtn']
...    validate_added_uesr_locator=xpath://td[contains(@class, 'left') and text() = 'Enabled']
...    search_added_user_locator=css:input#searchSystemUser_userName
...    search_employee_locator=css:input#searchSystemUser_employeeName_empName 
...    delete_user_locator=xpath://td[.//a[text()='${NEW_USER}']]//preceding-sibling::td//input
...    click_delete_user_locator=css:input#btnDelete
...    accept_delete_user=css:input#dialogDeleteBtn

*** Keywords ***
Validate Admin Page
    [Documentation]    to validate admin page loaded or not 
    Page Should Contain    admin

Click On Add User
    [Documentation]    to add new user
    Wait Until Element Is Visible    ${OR_ADMIN_LOCATORS.add_user_locator} 
    Click Element    ${OR_ADMIN_LOCATORS.add_user_locator}

Fill New User Details
    [Documentation]    to fill the new user details
    [Arguments]    ${EMPLOYEE_NAME}    ${NEW_USER}    ${PASSWORD}    ${CONFIRM_PASSWORD}
    Input Text    ${OR_ADMIN_LOCATORS.employee_name_locator}    ${EMPLOYEE_NAME}
    Input Text    ${OR_ADMIN_LOCATORS.new_user_name_locator}    ${NEW_USER}
    Input Text    ${OR_ADMIN_LOCATORS.create_password_locator}    ${PASSWORD}
    Input Text    ${OR_ADMIN_LOCATORS.confirm_password_locator}    ${CONFIRM_PASSWORD}

Click Save Button
    [Documentation]    click on save button
    Wait Until Element Is Visible     ${OR_ADMIN_LOCATORS.save_button_locator} 
    Click Element    ${OR_ADMIN_LOCATORS.save_button_locator}

Search for Added User
    [Documentation]    search for added user
    [Arguments]    ${NEW_USER}    ${EMPLOYEE_NAME}
    Wait Until Element Is Visible    ${OR_ADMIN_LOCATORS.search_added_user_locator}
    Click Element    ${OR_ADMIN_LOCATORS.search_added_user_locator}   
    Input Text    ${OR_ADMIN_LOCATORS.search_added_user_locator}    ${NEW_USER}
    Input Text    ${OR_ADMIN_LOCATORS.search_employee_locator}    ${EMPLOYEE_NAME}

Click Search Button
    [Documentation]    click on search button
    Wait Until Element Is Visible     ${OR_ADMIN_LOCATORS.search_button_locator}   
    Click Element    ${OR_ADMIN_LOCATORS.search_button_locator}

Validate Added User
    [Documentation]    validate the added user
    Element Text Should Be    ${OR_ADMIN_LOCATORS.validate_added_uesr_locator}    Enabled

Select The User To Delete
    [Documentation]    search certain user to delete
    Select Checkbox    ${OR_ADMIN_LOCATORS.delete_user_locator}

Delete Selected User
    Click Element    ${OR_ADMIN_LOCATORS.click_delete_user_locator}      
    Click Element    ${OR_ADMIN_LOCATORS.accept_delete_user}     