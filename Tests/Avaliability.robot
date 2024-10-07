*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/custom_functions/functions.robot
Test Setup    Open Chrome Browser 
Test Teardown        Close Browser Teardown

*** Test Cases ***
Test : Avaliability
        Verify that the Add to cart Button is Avaliable when the Product is Avaliable
        Verify that the Add to cart Button is not Avaliable when the Product is Out of Stock
