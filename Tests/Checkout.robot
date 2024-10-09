*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/custom_functions/functions.robot
Test Setup    Open Chrome Browser 
Test Teardown        Close Browser Teardown

*** Test Cases ***
Test : Checkout Functionality
    Login with Valid Data
    Test the Checkout Functionality by giving all the valid credentials
