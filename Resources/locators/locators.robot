*** Settings ***
Library      SeleniumLibrary     
# Library      robotframework-faker
*** Variables ***
${EMAIL}            saadq10922@gmail.com
${PASSWORD}         109220 
${Login_URL}        https://demowebshop.tricentis.com/login
${Dashboard_URL}    https://demowebshop.tricentis.com/
${Browser}          chrome

#    Register Variables
${Register_URL}        https://demowebshop.tricentis.com/register
${Gender}                    id=gender-male
${FirstName_Field}           id=FirstName
${LastName_Field}            id=LastName
${Email_Field}               id=Email
${Password_Field}            id=Password
${ConfirmPass_Field}         id=ConfirmPassword


#     Login Variables
${Login_URL}        https://demowebshop.tricentis.com/login
${Valid_Email}        saadq10922@gmail.com
${Invalid_Email}        abcx1289@female.com
${Valid_Password}           109220 
${Invalid_Pass}        123xyz
${Login_Email_Field}   id=Email
${RemeberMe_Box}       id=RememberMe
${Password_Field}      id=Password
${Login_Button}        xpath=//input[@type="submit" and @value="Log in"]
${Dashboard_URL}    https://demowebshop.tricentis.com/
${Text_for_invalid}    No customer account found
${login_incorrect}     xpath=//li[.="The credentials provided are incorrect"]


#    Logout Variables
${logout_link}        xpath=//a[@class="ico-logout"]
${login_link}         xpath=//a[@class="ico-login"]

#      Search Variables
${Valid_product}        Phone Cover
${top_Searchbar}        id=small-searchterms
${Search_button}        xpath=//input[@class="button-1 search-box-button"]
${Searched_Product_img}      xpath=//img[@title="Show details for Phone Cover"]
${Invalid_Product}        123xyz
${Text_for_invalid_Search}        No products were found that matched your criteria.
${Alert_Msg_forEmptySearch}       Please enter some search keyword
${Short_term_search}        phone

#        Locators for URL verification
${top_Searchbar}        id=small-searchterms
${Search_button}        xpath=//input[@class="button-1 search-box-button"]
${Short_term_search}        phone
${Computers_catagory}        xpath=//a[@href="/computers"]
${Catagory_Heading}        xpath=//h1[.="Computers"]

#        Locators For Product Listing
${Desktop_Subcat}        xpath=//img[@title="Show products in category Desktops"]
${Subcat_heading}        xpath=//h1[.="Desktops"]
${Details_div}           xpath=//div[@class="product-item"][1]
${Products_img}          xpath=//img[@title="Show details for Build your own cheap computer"]
${Product_link}          xpath=(//a[@href="/build-your-cheap-own-computer"])[2]
${Product_Rating}        xpath=(//div[@class="rating"])[1]
${Products_price}        xpath=(//span[@class="price actual-price"])[1]
${Products_Add_Button}   xpath=(//input[@value="Add to cart"])[1]
${Expected_count_box}        id=products-pagesize
${item_Box}              xpath=//div[@class="item-box"]
${Processor Customization}        xpath=(//label[@class="text-prompt"])[1]
${Ram Customization}        xpath=(//label[@class="text-prompt"])[2]
${HDD Customization}        xpath=(//label[@class="text-prompt"])[3]
${Software Customization}        xpath=(//label[@class="text-prompt"])[4]

#     Locators for Verifing Avaliability
${Simple Computer}        Simple Computer 
${Search Heading}            xpath=//h1[.="Search"]
${Simple Computer img}      xpath=//img[@title="Show details for Simple Computer"]
${Searched Item Heading}        xpath=//h1[@itemprop="name"]
${Add to Cart Button}            //input[@class="button-1 add-to-cart-button"]
${Unavaliable product}            Custom T-Shirt
${Unavaliable Product Img}        xpath=//img[@title="Show details for Custom T-Shirt"]


#     Locators For Verifing Price Filters
${Max Price Tag}                    xpath=(//span[@class="PriceRange"])[1]       
${Price of Product 1}            xpath=(//span[@class="price actual-price"])[1]
${Price of Product 2}            xpath=(//span[@class="price actual-price"])[2]
${Price of Product 3}            xpath=(//span[@class="price actual-price"])[3]

${Price Range}                   xpath=//a[@href="https://demowebshop.tricentis.com/desktops?price=-1000"]


#         Locators for Products Sorting  
${Product Names}         xpath=//h2[@class="product-title"]//a
${Sorting List}            id=products-orderby
${Product Prices}        xpath=//span[@class="price actual-price"]



#        Locators for Add to Cart
${Notebook_Subcat}        xpath=(//a[@href="/notebooks"])[4]
${Notebook_Heading}       xpath=//h1[.="Notebooks"]
${Laptop Product link}       xpath=(//a[@href="/141-inch-laptop"])[2]
${Jewelry Catagory}        xpath=(//a[@href="/jewelry"])[3]
${Jewelry Heading}        xpath=//h1[.="Jewelry"]
${Dimond Heart}            xpath=(//img[@title="Show details for Black & White Diamond Heart"])[2]
${Product Heading}    xpath=//h1[@itemprop="name"]
${Add to Cart Button}        xpath=(//input[@type="button"])[3]
${Apperal and Shoes Cat}    xpath=//a[@href="/apparel-shoes"]
${Apperal and Shoes Heading}    xpath=//h1[.="Apparel & Shoes"]
${Casual Belt img}        xpath=//img[@title="Show details for Casual Golf Belt"]
${Casual Belt link}        xpath=//a[.="Casual Golf Belt"]
${Cart link}            xpath=(//span[@class="cart-label"])[1]
${Cart items}            xpath=//a[@class="product-name"]
${Cart product Checkbox}    xpath=//input[@name="removefromcart"]
${Update Checkbox}        xpath=//input[@name="updatecart"]