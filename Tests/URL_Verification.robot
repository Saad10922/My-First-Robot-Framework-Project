*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/custom_functions/functions.robot
Test Setup    Open Chrome Browser 
Test Teardown        Close Browser Teardown


*** Test Cases ***
Test : URL Verification
    Verify the URL by searching for a Product
    Verify the URL by Selecting a Catagory
