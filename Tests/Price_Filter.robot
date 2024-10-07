*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/custom_functions/functions.robot
Test Setup    Open Chrome Browser 
Test Teardown        Close Browser Teardown

*** Test Cases ***

Test : Price Filters
        Verify that prices of all the displayed products should be According to the Filter Applied
