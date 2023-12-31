*** Settings ***
Library           SeleniumLibrary
Resource        Resource\Homepage_POM.robot


*** Variables ***
${BROWSER}        Chrome
${URL}            https://demowebshop.tricentis.com/
${USERNAME}       Admin
${PASSWORD}       admin123
${test}           Test
${login}          login 
${var}            
${expected_text}    Thank you
${actual_text}     (//h1[normalize-space()='Thank you'])[1]
${First name}    Bemnet
${Last name}     Tewolde
${Email}         Bemnettewolde@hotmail.com
${City}          Haarlem
${Address 1:}    Van Loghemstraat 10
${Zip}           2022EE
${Phonenumber}    0642688371



*** Test Cases ***
Login Test
    Open Browser    ${URL}    ${BROWSER}    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Wait Until Page Contains    Log in
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
    #Click Element    (//input[@name='removefromcart'])[1]
    #Click Element    (//input[@name='updatecart'])[1]
    
*** Test Cases ***
Verify Test
    #Wait Until Page Contains    Your Shopping Cart is empty!
    ${expected_text}    Set Variable    Thank you
    ${actual_text}    Get Text    (//h1[normalize-space()='Thank you'])[1]   
    Should Be Equal    ${actual_text}    ${expected_text}

    #Click Link    (//input[@id='add-to-cart-button-72'])[1]
    #Click Button    (//input[@id='add-to-cart-button-72'])[1]

*** Test Cases ***
Verify order
    Click Element    (//a[normalize-space()='Click here for order details.'])[1]
    Capture Page Screenshot    C:\Users\Bemnet\Robotframework\Screenshot




