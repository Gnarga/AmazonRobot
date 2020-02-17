*** Variables ***
${BROWSER}   chrome
${URL}   http://wwww.amazon.com
${shopping_cart}    id:nav-cart-count

*** Keywords ***
Begin Web Test
    Open Browser                    about:blank  ${BROWSER}
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
    Click Button

End Web Test
    Close Browser

user is at Amazon landingpage
    Load Page
    Verify Page Loaded

user search for for ferrari 458
    Input Text                      id:twotabsearchtextbox  ferrari 458

user presses search buttton
    Click Button                    xpath://*[@id="nav-search"]/form/div[2]/div/input

results for ferrari 458 should show
    Wait Until Page Contains    results for "ferrari 458"
