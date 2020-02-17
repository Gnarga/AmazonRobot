*** Settings ***
Documentation                           Amazon.com search cases
Library                                 SeleniumLibrary
Resource                                ../Resources/Keywords.robot
Test Setup                              Begin Web Test
Test Teardown                           End Web Test


*** Test Cases ***
Add item to cart and check its there
    [Documentation]                     Access Amazon startpage
    [Tags]                              Test1
    Go To Web Page
    Search For Product                  ferrari 458  results for "ferrari 458"
    Click Element                       Xpath=//img[@alt='Ferrari 458 Italia Red 1/24 by Bburago 26003']
    Click Add To Cart Button
    Element Should Contain              ${shopping_cart}  1
    Click View Cart
    Verify Cart                         Ferrari 458

Computers & Accessories With Alexa
    [Documentation]                     Checkboxes
    [Tags]                              Test2
    Go To Webpage
    Click Element                       id: nav-hamburger-menu
    Click Element                       xpath://*[@id="hmenu-content"]/ul[33]/li[21]
    Click Element                       xpath: //*[@id="hmenu-content"]/ul[18]/li[4]/a
    Click Element                       xpath: //*[@id="n/16225007011"]/span/a
    Checkbox Should Not Be Selected     name=s-ref-checkbox-16741513011
    Click Button                        name=s-ref-checkbox-16741513011
    Checkbox Should Be Selected         xpath=//*[@id="p_n_amazon_certified/16741513011"]/span/a/div/label/input

Ferrari-Gherkin Search
    [Documentation]                     Gherkin syntax
    [Tags]                              Test3
    Given user is at Amazon landingpage
    And user search for ferrari 458
    When user presses search buttton
    Then results for ferrari 458 should show

Today's Deals
    [Documentation]                     Deals and Promotion, pop-up in the way
    [Tags]                              Test4
    Go To Webpage
    Click Element                       id:twotabsearchtextbox  #För att få bort pop-up`en över "Shop Today´s Deals"
    Click Link                          xpath=//*[@id="navSwmHoliday"]/a
    Page Should Contain                 Deals and Promotions

Shopping cart max
    [Documentation]                     +1 max
    [Tags]                              Test5
    Go To Web Page
    Search For Product                  ferrari 458  results for "ferrari 458"
    Click Element                       Xpath=//img[@alt='Ferrari 458 Italia Red 1/24 by Bburago 26003']
    Click Add To Cart Button
    Click View Cart
    Select From List By Value           name=quantity    9
    Element Should Contain              name=quantity    8
    Element Should Contain              ${shopping_cart}  8


