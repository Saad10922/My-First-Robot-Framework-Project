*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/custom_functions/functions.robot
Test Setup    Open Chrome Browser 
Test Teardown        Close Browser Teardown

*** Test Cases ***
Test : Logout Functionality
    Logout from the shop
