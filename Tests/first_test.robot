*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/custom_functions/functions.robot

*** Test Cases ***
Test : Login Functionality
    Login with Valid Data
    Login with Invalid Email
    Login with Invalid Password
    Login without Email
    Login without Password
    [Teardown]     Close Browser

Test : Logout Functionality
    Logout from the shop
    [Teardown]     Close Browser

Test : Search Functionality
    Search for a Valid Product
    Search for Invalid Product
    [Teardown]     Close Browser

Test : URL Verification
    Verify the URL by searching for a Product
    Verify the URL by Selecting a Catagory
    [Teardown]     Close Browser

Test : Product Listing
        Verify the product with all its details
        Verify the Number of Products do not Exceeds the Expected count
        Verifing The Customization Details
        [Teardown]     Close Browser

Test : Avaliability
        Verify that the Add to cart Button is Avaliable when the Product is Avaliable
        Verify that the Add to cart Button is not Avaliable when the Product is Out of Stock
        [Teardown]     Close Browser
        
         


    

    

    
    

   



    





