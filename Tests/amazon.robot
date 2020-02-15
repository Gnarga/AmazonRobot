*** Settings ***
Documentation   Amazon.com search cases
Library     SeleniumLibrary
Resource    ../Resources/Keywords.robot
Test Setup  Begin Web Test
Test Teardown   End Web Test


*** Test Cases ***
#Add item to cart and check its there
    #[Documentation]               Access Amazon startpage
    #[Tags]                        Test 1
    #Go To Web Page
    #Search For Product            Nintendo Switch pikachu  results for "Nintendo Switch pikachu"
    #Click Element                 xpath://*[@id="search"]/div[1]/div[2]/div/span[4]/div[1]/div[1]/div/span/div/div/div[2]/div[1]/div/div/span/a/div/img
    #Click Button                  id:add-to-cart-button
    #Element Should Contain        id:nav-cart-count  1
    #Click Element                 xpath://*[@id="hlb-view-cart-announce"]
    #Element Should Contain         class:a-list-item    Nintendo Switch

#Computers & Accessories
    #[Documentation]                      Checkboxes
    #[Tags]                               Test 2
    #Go To Webpage
    #Click Element                        id: nav-hamburger-menu
    #Click Element                        xpath://*[@id="hmenu-content"]/ul[33]/li[21]
    #Click Element                        xpath: //*[@id="hmenu-content"]/ul[18]/li[4]/a
    #Click Element                        xpath: //*[@id="n/16225007011"]/span/a
    #Checkbox Should Not Be Selected      name=s-ref-checkbox-16741513011
    #Click Button                         name=s-ref-checkbox-16741513011
    #Checkbox Should Be Selected          xpath=//*[@id="p_n_amazon_certified/16741513011"]/span/a/div/label/input

#T#oday's Deals
    #[Documentation]             Deals and Promotion
    #[Tags]                      Test 3
    #Go To Webpage
    #Click Element               id:twotabsearchtextbox  #För att få bort pop-up`en över "Shop Today´s Deals"
    #Click Link                  xpath=//*[@id="navSwmHoliday"]/a
    #Page Should Contain         Deals and Promotions

Ferrari Search
    [Tags]                      Test 4
    Given user is at Amazon landingpage
    And user search for for ferrari 458
    When user presses search buttton
    Then results for ferrari 458 should show