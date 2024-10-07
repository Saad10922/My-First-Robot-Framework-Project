*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/custom_functions/functions.robot
Test Setup    Open Chrome Browser 
Test Teardown        Close Browser Teardown

*** Test Cases ***

Test : Product Listing
        Verify the product with all its details
        Verify the Number of Products do not Exceeds the Expected count
        Verifing The Customization Details
