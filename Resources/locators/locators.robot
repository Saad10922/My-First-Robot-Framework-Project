*** Settings ***
Library      SeleniumLibrary     
# Library      robotframework-faker
*** Variables ***
${EMAIL}            saadq10922@gmail.com
${PASSWORD}         109220 
${Login_URL}        https://demowebshop.tricentis.com/login
${Dashboard_URL}    https://demowebshop.tricentis.com/
${Browser}          chrome
${Fname}        M Saad 
${Lname}        Masood
${City}        Sargodha
${Address}        Hno.15 Main Street Waris Town Sargodha
${Zipcode}        40100
${CHROME_OPTIONS}    --disable-save-password-bubble


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
${Notebook_Subcat}        xpath=//a[@href="/notebooks"]
${Notebook_Heading}       xpath=//h1[.="Notebooks"]
${Laptop Product link}       xpath=//h2[@class="product-title"]//a[.="14.1-inch Laptop"]
${Jewelry Catagory}        xpath=(//a[@href="/jewelry"])[3]
${Jewelry Heading}        xpath=//h1[.="Jewelry"]
${Dimond Heart}            xpath=(//img[@title="Show details for Black & White Diamond Heart"])[2]
${Product Heading}    xpath=//h1[@itemprop="name"]
${Add to Cart Button}        xpath=(//input[@type="button"])[3]
${Apperal and Shoes Cat}    xpath=//a[@href="/apparel-shoes"]
${Apperal and Shoes Heading}    xpath=//h1[.="Apparel & Shoes"]
${Casual Belt img}        xpath=//img[@src="https://demowebshop.tricentis.com/content/images/thumbs/0000217_casual-golf-belt_125.jpeg"]
${Casual Belt link}        xpath=//a[.="Casual Golf Belt"]
${Cart link}            xpath=//a[@class="ico-cart"]//span[.="Shopping cart"]
${Cart items}            xpath=//a[@class="product-name"]
${Cart product Checkbox}    xpath=//input[@name="removefromcart"]
${Update Checkbox}        xpath=//input[@name="updatecart"]
${Computers catagory}          xpath=(//a[@href="/computers"])[1]
${Laptop Quantity Field}        id=addtocart_31_EnteredQuantity
${Laptop Quantity in cart}        xpath=//td[@class="qty nobr"]//input[@class="qty-input"]
${Country Select}        id=CountryId
${State Select}        id=StateProvinceId
${ZipcodeField}        id=ZipPostalCode
${Estimate Shipping Button}        xpath=//input[@class="button-2 estimate-shipping-button"]
${Ground Cost}        xpath=(//strong[@class="option-name"])[1]
${NextDa Air Cost}        xpath=(//strong[@class="option-name"])[2]
${2nd Day Air Cost}        xpath=(//strong[@class="option-name"])[3]
${In Store Pickup Cost}        xpath=(//strong[@class="option-name"])[4]

#       Locators for Checkout 
${Accepting Terms and Conditions}        id=termsofservice
${Checkout Button}                    id=checkout
${Checkout Heading}        xpath=//h1[.="Checkout"]
${Select Billing Address}          id=billing-address-select
${Fname in Billing Add}        id=BillingNewAddress_FirstName
${Lname in Billing Add}        id=BillingNewAddress_LastName
${Country Selector in Billing Add}        id=BillingNewAddress_CountryId
${Store Pickup Statement}        xpath=//i[.="Pick up your items at the store (put your store address here)"]
${State Selector in Billing Add}           id=BillingNewAddress_StateProvinceId
${City in Billing Add}            id=BillingNewAddress_City
${Address1}            id=BillingNewAddress_Address1
${Zipcode in Billing Add}        id=BillingNewAddress_ZipPostalCode
${Phone Number in Billing Add}        id=BillingNewAddress_PhoneNumber
${Continue Button in Billing Add}        xpath=(//input[@class="button-1 new-address-next-step-button"])[1]
${Continue for Shipping Add}        xpath=//div[@id="shipping-buttons-container"]//input[@class="button-1 new-address-next-step-button"]
${Ground Shipping Method}        id=shippingoption_0
${Shipping Method}            shippingoption
${Shipping Option}            Ground___Shipping.FixedRate
${Shipping Method Continue Button}        xpath=//input[@class="button-1 shipping-method-next-step-button"]
${Billing Option}        xpath=//label[.="Cash On Delivery (COD) (7.00)"]
${Payment Method Group}        paymentmethod
${Cash On Delivery OPtion}            Payments.CashOnDelivery
${Continue Button for Billing Option}        xpath=//input[@class="button-1 payment-method-next-step-button"]
${Payment Ingormation}        xpath=//p[.="You will pay by COD"]
${Continue Button for Payment Information}        xpath=//input[@class="button-1 payment-info-next-step-button"]
${Product pic in Confirm Section}        xpath=//img[@src="https://demowebshop.tricentis.com/content/images/thumbs/0000217_casual-golf-belt_80.jpeg"]
${Final Order Confirmation Button}        xpath=//input[@class="button-1 confirm-order-next-step-button"]
${Order Confirmation Statement}        xpath=//strong[.="Your order has been successfully processed!"]
${Order Number}        xpath=(//ul[@class="details"]//li)[1]
${Continue and Accept Confirmation}    xpath=//input[@class="button-2 order-completed-continue-button"]
      
#    Locators for Order History
${Account link}        xpath=//div[@class="header-links"]//a[@class="account"]
${Account Heading}        xpath=//h1[.="My account - Customer info"]
${Orders Link}            xpath=(//a[.="Orders"])[1]
${Account Orders Head}    xpath=//h1[.="My account - Orders"]
