*** Settings ***
Documentation    click on admin tab
Library    SeleniumLibrary

*** Variables ***
&{COMMON_ACTION_LOCATORS}
...    admin_element_locator=css:a#menu_admin_viewAdminModule

*** Keywords ***
Click On Admin 
    [Documentation]    click on admin tab
    Wait Until Element Is Visible    ${COMMON_ACTION_LOCATORS.admin_element_locator}
    Click Element    ${COMMON_ACTION_LOCATORS.admin_element_locator}