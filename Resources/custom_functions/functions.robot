*** Settings ***
Library      SeleniumLibrary
Library    ../../robot-env/Lib/site-packages/robot/libraries/Process.py
Library    ../../robot-env/Lib/site-packages/robot/libraries/OperatingSystem.py
Library    ../../robot-env/Lib/site-packages/robot/libraries/Collections.py
Library    Custom_Functions.py
Resource    ../locators/locators.robot



*** Keywords ***
Open Chrome Browser
        [Documentation]    Opens Chrome browser and navigates to the login URL.

         Open Browser  ${Login_URL}  ${Browser}  

Close Browser Teardown
        [Documentation]    Closes the browser session after test completion.

        Close Browser
    
Open Browser and Select Computers Catagrory and then a Subcatagory of Desktops
        [Documentation]    Opens the browser and navigates to the 'Computers' category, selecting 'Desktops' as a subcategory.

        Click Link    ${Computers_catagory}
        Wait Until Element Is Visible    ${Catagory_Heading}
        Click Element    ${Desktop_Subcat}
        Wait Until Element Is Visible    ${Subcat_heading}

#        Keywords for Login Functionality
Login with Valid Data
    [Documentation]    Logs in with valid email and password credentials.

#     Open Browser     ${Login_URL}  ${Browser}
    Input Text       ${Login_Email_Field}    ${Valid_Email}
    Input Text    ${Password_Field}    ${Valid_Password}
    Select Checkbox    ${RemeberMe_Box}
    Click Button    ${Login_Button}
    Wait Until Location Is    ${Dashboard_URL}    timeout=5s
#     [Teardown]     Close Browser
Login with Invalid Email
    [Documentation]    Attempts login using an invalid email and checks for the appropriate error message.

    Go To    ${Login_URL}
    Input Text       ${Login_Email_Field}    ${Invalid_Email}
    Input Text       ${Password_Field}    ${Invalid_Pass}
    Select Checkbox    ${RemeberMe_Box}
    Click Button    ${Login_Button}
    Page Should Contain    ${Text_for_invalid}   
    
Login with Invalid Password
    [Documentation]    Attempts login using an invalid password and checks for the appropriate error message.

    Go To    ${Login_URL}
    Input Text       ${Login_Email_Field}    ${Invalid_Email}
    Input Text       ${Password_Field}    ${Valid_Password}
    Select Checkbox    ${RemeberMe_Box}
    Click Button    ${Login_Button}
    Page Should Contain    ${Text_for_invalid}   
   
Login without Email
    [Documentation]    Attempts login without entering an email and checks for the appropriate error message.

    Go To    ${Login_URL}
    Input Text       ${Password_Field}    ${Valid_Password}
    Select Checkbox    ${RemeberMe_Box}
    Click Button    ${Login_Button}
    Page Should Contain    ${Text_for_invalid}   
    

Login without Password
    [Documentation]    Attempts login without entering a password and verifies the error message.

    Go To    ${Login_URL}
    Input Text       ${Login_Email_Field}    ${Valid_Email}
    Select Checkbox    ${RemeberMe_Box}
    Click Button    ${Login_Button}
    Element Should Be Visible    ${login_incorrect}    


#        Keywords for Logout Functionlaity
Logout from the shop
    [Documentation]    Logs out from the shop and verifies if the login link is visible again.

    Login with Valid Data
    
    Click Link  ${logout_link}
    Element Should Be Visible    ${login_link}

#          Search Functionality
Search for a Valid Product
        [Documentation]    Searches for a valid product and verifies that the product image is visible in search results.

        Input Text    ${top_Searchbar}   ${Valid_product}
        Click Button    ${Search_button}
        Wait Until Element Is Visible    ${Searched_Product_img}
Search for Invalid Product
    [Documentation]    Searches for an invalid product and checks for a 'no results' message.

        Input Text    ${top_Searchbar}   ${Invalid_Product}
        Click Button    ${Search_button}
        Page Should Contain    ${Text_for_invalid_Search} 
Search with empty SearchBar
    [Documentation]    Clicks the search button with an empty search bar and verifies the error message.
        
        Click Button    ${Search_button}
        # Page Should Contain    ${Text_for_invalid_Search} 
         Handle Alert    accept  
        


#        URL Verification
Verify the URL by searching for a Product
    [Documentation]    Verifies the URL contains the search term after searching for a product.

        Input Text    ${top_Searchbar}   ${Short_term_search}
        Click Button    ${Search_button}
        Wait Until Element Is Visible    ${Searched_Product_img}
        ${Searched_URL}=    Get Location
        Log    ${Searched_URL}
        Log    ${Short_term_search}
        Should Contain     ${Searched_URL}    ${Short_term_search}
Verify the URL by Selecting a Catagory
    [Documentation]    Verifies the URL contains the category name when navigating to a category.

        Go To    ${Dashboard_URL}
        Click Link    ${Computers_catagory}
        Wait Until Element Is Visible    ${Catagory_Heading}
        ${Searched_URL}=    Get Location
        Should Contain     ${Searched_URL}    computers



#        Keywords for Product Listing
Verify the product with all its details
    [Documentation]    Verifies the product image, link, rating, price, and add-to-cart button are displayed correctly.

        Click Link    ${Computers_catagory}
        Wait Until Element Is Visible    ${Catagory_Heading}
        Click Element    ${Desktop_Subcat}
        Wait Until Element Is Visible    ${Subcat_heading}
        Element Should Be Visible        ${Details_div}        ${Products_img}
        Element Should Be Visible        ${Details_div}        ${Product_link}
        Element Should Be Visible        ${Details_div}        ${Product_Rating}
        Element Should Be Visible        ${Details_div}        ${Products_price}
        Element Should Be Visible        ${Details_div}        ${Products_Add_Button}

        
Verify the Number of Products do not Exceeds the Expected count 
    [Documentation]    Verifies that the number of displayed products does not exceed the expected count.

        Go To    ${Dashboard_URL}
        Click Link    ${Computers_catagory}
        Wait Until Element Is Visible    ${Catagory_Heading}
        Click Element    ${Desktop_Subcat}
        Wait Until Element Is Visible    ${Subcat_heading}
        ${Expected_value}=           Get Selected List Label    ${Expected_count_box}
        ${Actual_Value}=            Get Element Count    ${item_Box}
        ${result}=    Evaluate    ${Expected_value}>=${Actual_Value}
        Should Be True    ${result}

Verifing The Customization Details
    [Documentation]    Verifies customization options like processor, RAM, HDD, and software for a selected product.

        Go To    ${Dashboard_URL}
        Input Text    ${top_Searchbar}   ${Simple Computer}
        Click Button    ${Search_button}
        Wait Until Element Is Visible    ${Search Heading}
        Click Element    ${Simple Computer img}
        Wait Until Element Is Visible    ${Searched Item Heading}
        Element Should Be Visible    ${Processor Customization}
        Element Should Be Visible    ${Ram Customization}
        Element Should Be Visible    ${HDD Customization}
        Element Should Be Visible    ${Software Customization}

#        Keywords for Verifing Product Avaliability
 Verify that the Add to cart Button is Avaliable when the Product is Avaliable
     [Documentation]    Verifies the 'Add to Cart' button is available for an in-stock product.

        Input Text    ${top_Searchbar}   ${Simple Computer}
        Click Button    ${Search_button}
        Wait Until Element Is Visible    ${Search Heading}
        Click Element    ${Simple Computer img}
        Wait Until Element Is Visible    ${Searched Item Heading}
        Element Should Be Visible    ${Add to Cart Button}

Verify that the Add to cart Button is not Avaliable when the Product is Out of Stock
    [Documentation]    Verifies the 'Add to Cart' button is not available for an out-of-stock product.

        Input Text    ${top_Searchbar}   ${Unavaliable product}
        Click Button    ${Search_button}
        Wait Until Element Is Visible    ${Search Heading}
        Click Element    ${Unavaliable Product Img}
        Wait Until Element Is Visible    ${Searched Item Heading}
        Element Should Not Be Visible    ${Add to Cart Button}
         
#        Keywords for Price Filters
Verify that prices of all the displayed products should be According to the Filter Applied
    [Documentation]    Verifies that all products are priced within the selected price range.

        Click Link    ${Computers_catagory}
        Wait Until Element Is Visible    ${Catagory_Heading}
        Click Element    ${Desktop_Subcat}
        Wait Until Element Is Visible    ${Subcat_heading}
        Click Link    ${Price Range}
        ${Price1}=        Get Text    ${Price of Product 1}
        ${Price2}=        Get Text    ${Price of Product 2}
        ${Price3}=        Get Text    ${Price of Product 3}
        
        ${Price_Max}=      Get Text    ${Max Price Tag}
        
        Should Be True    ${Price1}<=${Price_Max}
        Should Be True    ${Price2}<=${Price_Max}
        Should Be True    ${Price3}<=${Price_Max}
       
        
 #            Keywords for Sorting Functionality
 Verifing the Sorting OF Products from A to Z
     [Documentation]    Verifies that the products are sorted alphabetically from A to Z.

        Click Link    ${Computers_catagory}
        Wait Until Element Is Visible    ${Catagory_Heading}
        Click Element    ${Desktop_Subcat}
        Wait Until Element Is Visible    ${Subcat_heading}
         Select From List By Label    ${Sorting List}    Name: A to Z
         @{Products_List}    Get WebElements    ${Product Names}
         ${Actual_Product_Names}=    Create List
         FOR    ${element}    IN    @{Products_List}
             ${name}=     Get Text    ${element}
             Append To List    ${Actual_Product_Names}    ${name}
         END
         ${Expected list}=    Copy List    ${Actual_Product_Names}

         Sort List    ${Expected list}
         Should Be Equal As Strings    ${Actual_Product_Names}    ${Expected list}
 
 Verifing the Sorting OF Products from Z to A
     [Documentation]    Verifies that the products are sorted alphabetically from Z to A.

        Go To    ${Dashboard_URL}
        Click Link    ${Computers_catagory}
        Wait Until Element Is Visible    ${Catagory_Heading}
        Click Element    ${Desktop_Subcat}
        Wait Until Element Is Visible    ${Subcat_heading}
         Select From List By Label    ${Sorting List}    Name: Z to A
         @{Products_List}    Get WebElements    ${Product Names}
         ${Actual_Product_Names}=    Create List
         FOR    ${element}    IN    @{Products_List}
             ${name}=     Get Text    ${element}
             Append To List    ${Actual_Product_Names}    ${name}
         END
         ${Expected list}=    Copy List    ${Actual_Product_Names}

         Sort List    ${Expected list} 
         Reverse List    ${Expected list} 
         Should Be Equal As Strings    ${Actual_Product_Names}    ${Expected list}
 
 Verifing the Sorting OF Products Prices from Low to high
     [Documentation]    Verifies that the products are sorted by price in ascending order.

        Go To    ${Dashboard_URL}
        Click Link    ${Computers_catagory}
        Wait Until Element Is Visible    ${Catagory_Heading}
        Click Element    ${Desktop_Subcat}
        Wait Until Element Is Visible    ${Subcat_heading}
         Select From List By Label    ${Sorting List}    Price: Low to High
         @{Products_List}    Get WebElements    ${Product Prices}
         ${Actual_Product_Prices}=    Create List
         FOR    ${element}    IN    @{Products_List}
             ${name}=     Get Text    ${element}
             ${num}=    Convert To Number    ${name}
             Append To List    ${Actual_Product_Prices}       ${num}
         END
         ${Expected list}=    Copy List    ${Actual_Product_Prices}
        
         Sort List    ${Expected list} 
          
         Should Be Equal     ${Actual_Product_Prices}    ${Expected list}
 
 Verifing the Sorting OF Products Prices from High to Low
     [Documentation]    Verifies that the products are sorted by price in descending order.

        Go To    ${Dashboard_URL}
        Click Link    ${Computers_catagory}
        Wait Until Element Is Visible    ${Catagory_Heading}
        Click Element    ${Desktop_Subcat}
        Wait Until Element Is Visible    ${Subcat_heading}
         Select From List By Label    ${Sorting List}    Price: High to Low
         @{Products_List}    Get WebElements    ${Product Prices}
         ${Actual_Product_Prices}=    Create List
         FOR    ${element}    IN    @{Products_List}
             ${name}=     Get Text    ${element}
             ${num}=    Convert To Number    ${name}
             Append To List    ${Actual_Product_Prices}       ${num}
         END
         ${Expected list}=    Copy List    ${Actual_Product_Prices}
        
         Sort List    ${Expected list}
         Reverse List    ${Expected list} 
          
         Should Be Equal     ${Actual_Product_Prices}    ${Expected list}
 
 #        Keywords for Add to Cart Feature
Verify by adding multiple productsto Cart
    [Documentation]    Adds multiple products to the cart and verifies they are listed correctly in the cart.

        Login with Valid Data
        Go To    ${Dashboard_URL}
        Mouse Over      ${Computers catagory}  
        Click Element    ${Notebook_Subcat}
        Wait Until Element Is Visible    ${Notebook_Heading}
        Scroll Element Into View    ${Laptop Product link}
        Click Element       ${Laptop Product link}
        Wait Until Element Is Visible    ${Product Heading}
        Click Button    ${Add to Cart Button}
        ${Cart}=     Create List
        ${item}=     Get Text    ${Product Heading}
        Append To List    ${Cart}       ${item}
        Click link    ${Apperal and Shoes Cat}
        Wait Until Element Is Visible    ${Apperal and Shoes Heading}
        Click Element   ${Casual Belt img}
        Wait Until Element Is Visible    ${Product Heading}
        Click Button    ${Add to Cart Button}
        ${item}=     Get Text    ${Product Heading}
        Append To List    ${Cart}       ${item}
        sleep     3s
        Click Element   ${Cart link}
        @{Cart items tags}    Get WebElements    ${Cart items}
        ${Cart items names}=    Create List
        FOR    ${element}    IN    @{Cart items tags}
            ${name}=    Get Text    ${element}
            Append To List    ${Cart items names}    ${name}
            
        END
        Should Be Equal    ${Cart items names}   ${Cart}
        @{checkbox}    Get WebElements    ${Cart product Checkbox}
        FOR    ${element}    IN    @{checkbox}
            Select Checkbox    ${element}
        END
        Click Button    ${Update Checkbox}


Verify by Increasing a Product's Quantity IN Cart
    [Documentation]    Add same product in more Quantity and Verify the total Quantity from the cart

        
        Go To    ${Dashboard_URL}
        Mouse Over      ${Computers catagory}  
        Click Element    ${Notebook_Subcat}
        Wait Until Element Is Visible    ${Notebook_Heading}
        Scroll Element Into View    ${Laptop Product link}
        Click Element       ${Laptop Product link}
        Wait Until Element Is Visible    ${Product Heading}
        Input Text    ${Laptop Quantity Field}    10
        Click Button    ${Add to Cart Button}
        Click Element   ${Cart link}
        ${Quantity}=       Get Value    ${Laptop Quantity in cart}
        Should Be Equal    ${Quantity}    10
        Select Checkbox    ${Cart product Checkbox}
        Click Button    ${Update Checkbox}


#     Keywords for Delivery Estimation

Verify the Delivery Cost Before Checkout
        [Documentation]    Adding a producty to Cart and then Checking the Estimated Delivery in selected Country
           
        Go To    ${Dashboard_URL}
        Click link    ${Apperal and Shoes Cat}
        Wait Until Element Is Visible    ${Apperal and Shoes Heading}
        Click Element   ${Casual Belt img}
        Wait Until Element Is Visible    ${Product Heading}
        Click Button    ${Add to Cart Button}
        Click Element   ${Cart link}
        Select From List By Value    ${Country Select}    57
        Input Text    ${ZipcodeField}    40100
        Click Button    ${Estimate Shipping Button}
        Element Should Be Visible    ${Ground Cost}
        Element Should Be Visible    ${NextDa Air Cost}
        Element Should Be Visible    ${2nd Day Air Cost}
        Element Should Be Visible    ${In Store Pickup Cost}
        Select Checkbox    ${Cart product Checkbox}
        Click Button    ${Update Checkbox}


#    Keywords for Checkout Functionality

Test the Checkout Functionality by giving all the valid credentials
        [Documentation]    This test validates the checkout process from adding a product to cart, filling out the billing details, selecting the shipping method, and confirming the final order.

        Go To    ${Dashboard_URL}
        Click link    ${Apperal and Shoes Cat}
        Wait Until Element Is Visible    ${Apperal and Shoes Heading}
        Click Element   ${Casual Belt img}
        Wait Until Element Is Visible    ${Product Heading}
        Click Button    ${Add to Cart Button}
        Click Element   ${Cart link}
        Select From List By Value    ${Country Select}    57
        Input Text    ${ZipcodeField}    40100
        Select Checkbox    ${Accepting Terms and Conditions}
        Click Button    ${Checkout Button}
        Select From List By Label    ${Select Billing Address}    New Address
        Input Text   ${Fname in Billing Add}    ${Fname}
        Input Text    ${Lname in Billing Add}    ${Lname}
        Select From List By Value   ${Country Selector in Billing Add}    57
        Select From List By Value    ${State Selector in Billing Add}      0
        Input Text    ${City in Billing Add}    ${City} 
        Input Text    ${Address1}    ${Address}
        Input Text    ${Zipcode in Billing Add}    ${Zipcode}
        Input Text    ${Phone Number in Billing Add}       03267553848
        Click Button    ${Continue Button in Billing Add}
        Wait Until Element Is Visible    ${Store Pickup Statement}
        Click Button    ${Continue for Shipping Add}
        Wait Until Element Is Visible    ${Ground Shipping Method}
        Select Radio Button    ${Shipping Method}    ${Shipping Option}
        Click Button    ${Shipping Method Continue Button}
        Wait Until Element Is Visible    ${Billing Option}
        Select Radio Button    ${Payment Method Group}    ${Cash On Delivery OPtion}
        Click Button    ${Continue Button for Billing Option}
        Wait Until Element Is Visible    ${Payment Ingormation}
        Click Button    ${Continue Button for Payment Information}
        Wait Until Element Is Visible    ${Product pic in Confirm Section}
        Click Button    ${Final Order Confirmation Button}
        Wait Until Element Is Visible    ${Order Confirmation Statement}
        ${Current Order Number}=     Get Text    ${Order Number}
        Click Button    ${Continue and Accept Confirmation}

 
#        Keywords for Ordr History
Verify that the order you have confirmed appears in the Order History
        [Documentation]    This test validates that the confirmed order appears in the order history section of the user account.

        Go To    ${Dashboard_URL}
        Click link    ${Apperal and Shoes Cat}
        Wait Until Element Is Visible    ${Apperal and Shoes Heading}
        Click Element   ${Casual Belt img}
        Wait Until Element Is Visible    ${Product Heading}
        Click Button    ${Add to Cart Button}
        Click Element   ${Cart link}
        Select From List By Value    ${Country Select}    57
        Input Text    ${ZipcodeField}    40100
        Select Checkbox    ${Accepting Terms and Conditions}
        Click Button    ${Checkout Button}
        Select From List By Label    ${Select Billing Address}    New Address
        Input Text   ${Fname in Billing Add}    ${Fname}
        Input Text    ${Lname in Billing Add}    ${Lname}
        Select From List By Value   ${Country Selector in Billing Add}    57
        Select From List By Value    ${State Selector in Billing Add}      0
        Input Text    ${City in Billing Add}    ${City} 
        Input Text    ${Address1}    ${Address}
        Input Text    ${Zipcode in Billing Add}    ${Zipcode}
        Input Text    ${Phone Number in Billing Add}       03267553848
        Click Button    ${Continue Button in Billing Add}
        Wait Until Element Is Visible    ${Store Pickup Statement}
        Click Button    ${Continue for Shipping Add}
        Wait Until Element Is Visible    ${Ground Shipping Method}
        Select Radio Button    ${Shipping Method}    ${Shipping Option}
        Click Button    ${Shipping Method Continue Button}
        Wait Until Element Is Visible    ${Billing Option}
        Select Radio Button    ${Payment Method Group}    ${Cash On Delivery OPtion}
        Click Button    ${Continue Button for Billing Option}
        Wait Until Element Is Visible    ${Payment Ingormation}
        Click Button    ${Continue Button for Payment Information}
        Wait Until Element Is Visible    ${Product pic in Confirm Section}
        Click Button    ${Final Order Confirmation Button}
        Wait Until Element Is Visible    ${Order Confirmation Statement}
        ${Current Order Number}=     Get Text    ${Order Number}
        Click Button    ${Continue and Accept Confirmation}
        Go To    ${Dashboard_URL}
        Click Element    ${Account link}
        Wait Until Element Is Visible    ${Account Heading}
        Click Element    ${Orders Link}
        Wait Until Element Is Visible    ${Account Orders Head}
        ${Recent_Order}=    Get Text    ${Order_Number_in_Recent}
        ${Result}=    Compare Strings Text    ${Current Order Number}    ${Recent_Order}
        Should Be True    ${Result}
        
        
       
        
        



        



           









        