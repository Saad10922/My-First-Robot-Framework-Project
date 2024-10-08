*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/custom_functions/functions.robot
Test Setup    Open Chrome Browser 
Test Teardown        Close Browser Teardown

*** Test Cases ***

Test : Add to Cart
        Verify by adding multiple productsto Cart
        Verify by Increasing a Product's Quantity IN Cart

