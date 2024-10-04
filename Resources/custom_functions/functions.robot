*** Settings ***
Library      SeleniumLibrary
Library    ../../robot-env/Lib/site-packages/robot/libraries/Process.py
Library    ../../robot-env/Lib/site-packages/robot/libraries/OperatingSystem.py
Library    ../../robot-env/Lib/site-packages/robot/libraries/Collections.py
Resource    ../locators/locators.robot

*** Keywords ***

#        Keywords for Login Functionality
Login with Valid Data
    Open Browser     ${Login_URL}  ${Browser}
    Input Text       ${Login_Email_Field}    ${Valid_Email}
    Input Text    ${Password_Field}    ${Valid_Password}
    Select Checkbox    ${RemeberMe_Box}
    Click Button    ${Login_Button}
    Wait Until Location Is    ${Dashboard_URL}    timeout=5s
#     [Teardown]     Close Browser
Login with Invalid Email
    Go To    ${Login_URL}
    Input Text       ${Login_Email_Field}    ${Invalid_Email}
    Input Text       ${Password_Field}    ${Invalid_Pass}
    Select Checkbox    ${RemeberMe_Box}
    Click Button    ${Login_Button}
    Page Should Contain    ${Text_for_invalid}   
    
Login with Invalid Password
    Go To    ${Login_URL}
    Input Text       ${Login_Email_Field}    ${Invalid_Email}
    Input Text       ${Password_Field}    ${Valid_Password}
    Select Checkbox    ${RemeberMe_Box}
    Click Button    ${Login_Button}
    Page Should Contain    ${Text_for_invalid}   
   
Login without Email
    Go To    ${Login_URL}
    Input Text       ${Password_Field}    ${Valid_Password}
    Select Checkbox    ${RemeberMe_Box}
    Click Button    ${Login_Button}
    Page Should Contain    ${Text_for_invalid}   
    

Login without Password
    Go To    ${Login_URL}
    Input Text       ${Login_Email_Field}    ${Valid_Email}
    Select Checkbox    ${RemeberMe_Box}
    Click Button    ${Login_Button}
    Element Should Be Visible    ${login_incorrect}    


#        Keywords for Logout Functionlaity
Logout from the shop
    Login with Valid Data
    Click Link  ${logout_link}
    Element Should Be Visible    ${login_link}

#          Search Functionality
Search for a Valid Product
        Open Browser     ${Dashboard_URL}  ${Browser}
        Input Text    ${top_Searchbar}   ${Valid_product}
        Click Button    ${Search_button}
        Wait Until Element Is Visible    ${Searched_Product_img}
Search for Invalid Product
        Input Text    ${top_Searchbar}   ${Invalid_Product}
        Click Button    ${Search_button}
        Page Should Contain    ${Text_for_invalid_Search} 
        [Teardown]        Close Browser
Search with empty SearchBar
        Click Button    ${Search_button}
        Page Should Contain    ${Text_for_invalid_Search} 


#        URL Verification
Verify the URL by searching for a Product
        Open Browser     ${Dashboard_URL}  ${Browser}
        Input Text    ${top_Searchbar}   ${Short_term_search}
        Click Button    ${Search_button}
        Wait Until Element Is Visible    ${Searched_Product_img}
        ${Searched_URL}=    Get Location
        Log    ${Searched_URL}
        Log    ${Short_term_search}
        Should Contain     ${Searched_URL}    ${Short_term_search}
Verify the URL by Selecting a Catagory
        Go To    ${Dashboard_URL}
        Click Link    ${Computers_catagory}
        Wait Until Element Is Visible    ${Catagory_Heading}
        ${Searched_URL}=    Get Location
        Should Contain     ${Searched_URL}    computers



#        Keywords for Product Listing
Verify the product with all its details
        Open Browser    ${Dashboard_URL}    ${Browser}
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
         Open Browser     ${Dashboard_URL}  ${Browser}
        Input Text    ${top_Searchbar}   ${Simple Computer}
        Click Button    ${Search_button}
        Wait Until Element Is Visible    ${Search Heading}
        Click Element    ${Simple Computer img}
        Wait Until Element Is Visible    ${Searched Item Heading}
        Element Should Be Visible    ${Add to Cart Button}

Verify that the Add to cart Button is not Avaliable when the Product is Out of Stock
        Open Browser     ${Dashboard_URL}  ${Browser}
        Input Text    ${top_Searchbar}   ${Unavaliable product}
        Click Button    ${Search_button}
        Wait Until Element Is Visible    ${Search Heading}
        Click Element    ${Unavaliable Product Img}
        Wait Until Element Is Visible    ${Searched Item Heading}
        Element Should Not Be Visible    ${Add to Cart Button}
         




               
            
      
        