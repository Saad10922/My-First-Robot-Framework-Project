*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/custom_functions/functions.robot
Test Setup    Open Chrome Browser 
Test Teardown        Close Browser Teardown

*** Test Cases ***

test : Checkout Process
    Login with Valid Data
    Verify the Delivery Cost Before Checkout
    



