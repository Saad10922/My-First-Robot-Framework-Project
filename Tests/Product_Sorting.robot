
*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/custom_functions/functions.robot
Test Setup    Open Chrome Browser 
Test Teardown        Close Browser Teardown

*** Test Cases ***


Test : Sorting Functionlaity
     Verifing the Sorting OF Products from A to Z
     Verifing the Sorting OF Products from Z to A
      Verifing the Sorting OF Products Prices from Low to high
      Verifing the Sorting OF Products Prices from High to Low

