*** Settings ***
Library           SeleniumLibrary
Resource    Regtest.robot

*** Variables ***
${Shopping}     ((//span[normalize-space()='Shopping cart'])[1]]
${BROWSER}        Chrome
${URL}            https://demowebshop.tricentis.com/
${USERNAME}       Admin
${PASSWORD}       admin123
${test}           Test
${login}          login 
${var}            
${expected_text}    Thank you
${actual_text}     (//h1[normalize-space()='Thank you'])[1]
${First name}    Ben
${sec_name}       Test 
${Last name}     blanko
${Email}         benblanko@gmail.com
${City}          Haarlem
${Address 1:}    Van laanstraat 10000
${Zip}           2022EE
${Phonenumber}    0689090909
${URL15}         https://demowebshop.tricentis.com/register  
${URL22}           https://demowebshop.tricentis.com/login
${URL25}            https://demowebshop.tricentis.com/

*** Keywords ***
Scenario: Basic Computer Purchase
Given the customer visits the website
    Open Browser    ${URL25}    Chrome
    Maximize Browser Window
    Wait Until Page Contains    Register   
    
When the customer selects a computer
     Click Element   (//a[normalize-space()='Computers'])[1] 
    Click Element    (//img[@title='Show products in category Desktops'])[1]   
    Click Element    (//input[@value='Add to cart'])[1]
    Wait Until Page Contains     Build your own cheap computer
    Sleep    2s
    Execute JavaScript    window.scrollTo(0, 750);
    Sleep    5s
    #Click Button    (//input[@id='add-to-cart-button-72'])[1]
    #Wait Until Element Is Visible    (//span[@class='cart-qty'])[1]
    #sleep     5s
   # Click Element    (//span[normalize-space()='Shopping cart'])[1]
And the customer adds the computer to the shopping cart
    Click Button    (//input[@id='add-to-cart-button-72'])[1]
    Wait Until Element Is Visible    (//span[@class='cart-qty'])[1]
    sleep     5s
    Click Element    (//span[normalize-space()='Shopping cart'])[1]
Then the customer should be able to purchase the computer
    #Click Element   (//span[normalize-space()='Shopping cart'])[1]
    #Sleep    3
     Click Button    (//input[@id='termsofservice'])[1]
    Click Button    (//button[normalize-space()='Checkout'])[1]
    Sleep     1s
    Click Button    (//input[@value='Checkout as Guest'])[1]
    Input Text    (//input[@id='BillingNewAddress_FirstName'])[1]    ${First name}
    Input Text    (//input[@id='BillingNewAddress_LastName'])[1]    ${Last name}
    Input Text    (//input[@id='BillingNewAddress_Email'])[1]    ${Email}
    Select From List By Label    BillingNewAddress_CountryId    Netherlands
    Input Text    (//input[@id='BillingNewAddress_City'])[1]    ${City}
    Input Text    (//input[@id='BillingNewAddress_Address1'])[1]    ${Address 1:}
    Input Text    (//input[@id='BillingNewAddress_ZipPostalCode'])[1]    ${Zip}
    Input Text    (//input[@id='BillingNewAddress_PhoneNumber'])[1]    ${Phonenumber}
    Sleep     2s    
    Click Button    (//input[@onclick='Billing.save()'])[1]
    Sleep    2
    Wait Until Element Is Visible    (//input[@onclick='Shipping.save()'])[1]
    Click Button    (//input[@onclick='Shipping.save()'])[1]
    Sleep    2
    Click Button    //*[@id="shipping-method-buttons-container"]/input
    Sleep    1
    Execute JavaScript    window.scrollTo(0, 750);
    Click Button    //*[@id="payment-method-buttons-container"]/input
    Sleep    1
    Click Button    //*[@id="payment-info-buttons-container"]/input
    Sleep    1
    Execute JavaScript    window.scrollTo(0, 750);
    Click Button     //*[@id="confirm-order-buttons-container"]/input
    sleep    3s
    




Given De Gebruiker is op de loginpagina
    Open Browser    ${URL22}    Chrome
    Maximize Browser Window
    Wait Until Page Contains    Register   

When De Gebruiker logt in met bestaand email
    Input Text    (//input[@id='Email'])[1]   ${random_email}
    Input Text    (//input[@id='Password'])[1]   ${password}
    Sleep    3
    Click Element    (//input[@value='Log in'])[1]

Then De Gebruiker is ingelogd
    Sleep    5
    Close Browser



Given De gebruiker is op de registratiepagina
    Open Browser    ${URL15}    Chrome
    Maximize Browser Window
    Wait Until Page Contains    Register
    
When De gebruiker vult de registratiegegevens in
    Click Element    (//input[@id='gender-male'])[1]

    ${first_name}    Generate Random First Name
    ${last_name}     Generate Random Last Name

    Input Text    (//input[@id='FirstName'])[1]     ${first_name}
    Input Text    (//input[@id='LastName'])[1]      ${last_name}

    Sleep    2s  #
    ${random_email}=    Execute JavaScript    return Math.random().toString(36).substring(7) + "@example.com"
    Input Text    (//input[@id='Email'])[1]    ${random_email}
    Set Global Variable    ${random_email}
    Sleep    3
    Input Text    (//input[@id='Password'])[1]    ${password}
    Input Text    (//input[@id='ConfirmPassword'])[1]    ${password}
    Sleep    2

And De gebruiker klikt op de registratieknop
    Click Element    (//input[@id='register-button'])[1]
    Sleep    3

Then wordt de gebruiker geregistreerd en ingelogd
    ${expected_text}    Set Variable    Your registration completed
    ${actual_text}    Get Text    (//div[@class='result'])[1]    
    Should Be Equal    ${actual_text}    ${expected_text}    

Open Webshop
    Open Browser    ${URL}    ${BROWSER}    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Wait Until Page Contains    Log in

Add Computer
    Click Element   (//a[normalize-space()='Computers'])[1] 
    Click Element    (//img[@title='Show products in category Desktops'])[1]   
    Click Element    (//input[@value='Add to cart'])[1]
    Wait Until Page Contains     Build your own cheap computer
    Sleep    2s
    Execute JavaScript    window.scrollTo(0, 750);
    Sleep    5s
    Click Button    (//input[@id='add-to-cart-button-72'])[1]
    Wait Until Element Is Visible    (//span[@class='cart-qty'])[1]
    sleep     5s
    Click Element    (//span[normalize-space()='Shopping cart'])[1]
Click Shopping
   Click Element   (//span[normalize-space()='Shopping cart'])[1]

Checkout
    Click Button    (//input[@id='termsofservice'])[1]
    Click Button    (//button[normalize-space()='Checkout'])[1]
    Sleep     1s
    Click Button    (//input[@value='Checkout as Guest'])[1]
    Input Text    (//input[@id='BillingNewAddress_FirstName'])[1]    ${First name}
    Input Text    (//input[@id='BillingNewAddress_LastName'])[1]    ${Last name}
    Input Text    (//input[@id='BillingNewAddress_Email'])[1]    ${Email}
    Select From List By Label    BillingNewAddress_CountryId    Netherlands
    Input Text    (//input[@id='BillingNewAddress_City'])[1]    ${City}
    Input Text    (//input[@id='BillingNewAddress_Address1'])[1]    ${Address 1:}
    Input Text    (//input[@id='BillingNewAddress_ZipPostalCode'])[1]    ${Zip}
    Input Text    (//input[@id='BillingNewAddress_PhoneNumber'])[1]    ${Phonenumber}
    Sleep     2s    
    Click Button    (//input[@onclick='Billing.save()'])[1]
    Sleep    2
    Wait Until Element Is Visible    (//input[@onclick='Shipping.save()'])[1]
    Click Button    (//input[@onclick='Shipping.save()'])[1]
    Sleep    2
    Click Button    //*[@id="shipping-method-buttons-container"]/input
    Sleep    1
    Execute JavaScript    window.scrollTo(0, 750);
    Click Button    //*[@id="payment-method-buttons-container"]/input
    Sleep    1
    Click Button    //*[@id="payment-info-buttons-container"]/input
    Sleep    1
    Execute JavaScript    window.scrollTo(0, 750);
    Click Button     //*[@id="confirm-order-buttons-container"]/input
    sleep    3s
    

Verify order
    ${expected_text}    Set Variable    Thank you
    ${actual_text}    Get Text    (//h1[normalize-space()='Thank you'])[1]    


    
    