*** Variables ***
${BROWSER}                          chrome
${URL}                              http://wwww.amazon.com
${shopping_cart}                    id:nav-cart-count

*** Keywords ***
Begin Web Test
    Open Browser                    about:blank  ${BROWSER}  #headlesschrome för att köra utan att visa fönstret
    Set Selenium Speed              0.5
    Maximize Browser Window

Go To Web Page
    Load Page
    Verify Page Loaded

Load Page
    Go To                           ${URL}

Verify Page Loaded
    Wait Until Page Contains        Your Amazon.com

Search For Product
    [Arguments]                     ${search_term}      ${search_result}
    Enter Search Term               ${search_term}
    Submit Search
    Verify Search Complete          ${search_term}      ${search_result}

Enter Search Term
    [Arguments]                     ${search_term}
    Input Text                      id:twotabsearchtextbox  ${search_term}

Submit Search
    Click Button                    xpath://*[@id="nav-search"]/form/div[2]/div/input

Verify Search Complete
    [Arguments]                     ${search_term}      ${search_result}
    ${result_text} =                Set Variable        results for "${search_term}"
    Should Be Equal                 ${result_text}      ${search_result}

Click Add To Cart Button
    Click Button                    id:add-to-cart-button

Click View Cart
    Click Element                   xpath://*[@id="hlb-view-cart-announce"]

Verify Cart
    [Arguments]                     ${cart_result}
    Element Should Contain          xpath://span[@class='a-size-medium sc-product-title']   ${cart_result}

End Web Test
    Close Browser

user is at Amazon landingpage
    Load Page
    Verify Page Loaded

user search for ferrari 458
    Input Text                      id:twotabsearchtextbox  ferrari 458

user presses search buttton
    Click Button                    xpath://*[@id="nav-search"]/form/div[2]/div/input

results for ferrari 458 should show
    Wait Until Page Contains        results for "ferrari 458"
