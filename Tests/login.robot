*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/custom_functions/functions.robot
Test Setup    Open Chrome Browser 
Test Teardown        Close Browser Teardown

*** Test Cases ***
Test : Login Functionality
    Login with Valid Data
    Login with Invalid Email
    Login with Invalid Password
    Login without Email
    Login without Password
    
