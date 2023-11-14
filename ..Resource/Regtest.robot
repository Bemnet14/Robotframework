*** Settings ***
Library    SeleniumLibrary
Library    RPA.RobotLogListener
#Resource    ..resource\email.random.robot


Resource    Homepage_POM.robot

*** Variables ***
${URL12}          https://demowebshop.tricentis.com/register  
${Url13}         https://demowebshop.tricentis.com/onepagecheckout
${URL19}        https://demowebshop.tricentis.com/
${URL16}          https://demowebshop.tricentis.com/login
${URL99}        https://mijn.cupraofficial.nl/plan_nu_jouw_proefrit?gad_source=1&gclid=CjwKCAjwv-2pBhB-EiwAtsQZFO3ArOtGOWcIap0lmpUp7ZahDdY3VXV5-wD9fdOLAeIXfCFF-U5IqxoC8i0QAvD_BwE&gclsrc=aw.ds
${BROWSER}        Chrome
${password}       admin123
${URL100}          https://demoqa.com/date-picker
${URL101}                 https://www.saucedemo.com/


*** Keywords ***
Generate Random First Name
    ${first_name} =    Evaluate    random.choice(["Emma", "Liam", "Olivia", "Noah", "Ava", "Isabella", "Sophia", "Mia", "Charlotte", "Amelia", "Harper", "Evelyn", "Abigail", "Emily", "Elizabeth", "Sofia", "Avery", "Ella", "Scarlett", "Grace", "Lily", "Chloe", "Zoey", "Penelope", "Victoria", "Madison", "Eleanor", "Addison", "Aubrey", "Layla", "Scarlett", "Lily", "Hannah", "Brooklyn", "Zoe", "Sofia", "Stella", "Aurora", "Violet", "Skylar", "Claire", "Nora", "Leah", "Hazel", "Lucy", "Paisley", "Savannah", "Riley", "Ariana", "Camila"])
    [Return]    ${first_name}

Generate Random Last Name
    ${last_name} =    Evaluate    random.choice(["Johnson", "Smith", "Williams", "Brown", "Jones", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin", "Lewis", "Allen", "Lee", "Young", "Turner", "Hall", "Wright", "King", "Green", "Baker", "Scott", "Adams", "Martinez", "Rodriguez", "Nelson", "Mitchell", "Perez", "Carter", "Perez", "Walker", "Hill", "Murphy", "Rivera", "Reed", "Phillips", "Bailey", "Collins", "Russell", "Hayes", "Foster", "Butler", "Long", "Hughes", "Foster"])
    [Return]    ${last_name}

Generate Random City
    ${City_1} =    Evaluate    random.choice(["Assen", "Emmen", "Hoogeveen", "Meppel", "Almere", "Lelystad", "Dronten", "Zeewolde", "Leeuwarden", "Heerenveen", "Sneek", "Drachten", "Arnhem", "Nijmegen", "Apeldoorn", "Ede", "Doetinchem", "Groningen", "Hoogezand-Sappemeer", "Stadskanaal", "Winschoten", "Maastricht", "Venlo", "Sittard", "Roermond", "Heerlen", "Eindhoven", "Tilburg", "Breda", "'s-Hertogenbosch", "Helmond", "Amsterdam", "Haarlem", "Alkmaar", "Hilversum", "Zaanstad", "Enschede", "Zwolle", "Deventer", "Hengelo", "Almelo", "Utrecht", "Amersfoort", "Nieuwegein", "Veenendaal", "Zeist", "Middelburg", "Vlissingen", "Goes", "Terneuzen", "Rotterdam", "Den Haag", "Leiden", "Dordrecht", "Zoetermeer"])
    [Return]    ${City_1}

Generate Random Adress
    ${Adress_1} =    Evaluate    random.choice(["Straatnaam 1", "Straatnaam 2", "Straatnaam 3", "Straatnaam 4", "Straatnaam 5", "Straatnaam 6", "Straatnaam 7", "Straatnaam 8", "Straatnaam 9", "Straatnaam 10", "Straatnaam 11", "Straatnaam 12", "Straatnaam 13", "Straatnaam 14", "Straatnaam 15", "Straatnaam 16", "Straatnaam 17", "Straatnaam 18", "Straatnaam 19", "Straatnaam 20", "Straatnaam 21", "Straatnaam 22", "Straatnaam 23", "Straatnaam 24", "Straatnaam 25", "Straatnaam 26", "Straatnaam 27", "Straatnaam 28", "Straatnaam 29", "Straatnaam 30", "Straatnaam 31", "Straatnaam 32", "Straatnaam 33", "Straatnaam 34", "Straatnaam 35", "Straatnaam 36", "Straatnaam 37", "Straatnaam 38", "Straatnaam 39", "Straatnaam 40", "Straatnaam 41", "Straatnaam 42", "Straatnaam 43", "Straatnaam 44", "Straatnaam 45", "Straatnaam 46", "Straatnaam 47", "Straatnaam 48", "Straatnaam 49", "Straatnaam 50"])
    [Return]    ${Adress_1}   
Create first_name and last_name
    Open Browser    ${URL12}    Chrome
    Maximize Browser Window

    ${first_name}    Generate Random First Name
    ${last_name}     Generate Random Last Name

    Input Text    (//input[@id='FirstName'])[1]     ${first_name}
    Input Text    (//input[@id='LastName'])[1]      ${last_name}


Open Chrome With Pop-up Blocking And Detach
    ${CHROME_OPTIONS}=    Evaluate    {'chromeOptions': {'args': ['--disable-popup-blocking'], 'detach': True}}

Open Register page enter details 
    Open Browser    ${URL12}    Chrome
    Maximize Browser Window
    Wait Until Page Contains    Register
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
    Click Element    (//input[@id='register-button'])[1]
    Sleep    3


Open Register page enter same email
    Open Browser    ${URL12}    Chrome
    Maximize Browser Window
    Wait Until Page Contains    Register
    Click Element    (//input[@id='gender-male'])[1]

    ${first_name}    Generate Random First Name
    ${last_name}     Generate Random Last Name

    Input Text    (//input[@id='FirstName'])[1]     ${first_name}
    Input Text    (//input[@id='LastName'])[1]      ${last_name}

    Sleep    2s  #
    ${random_email}=    Execute JavaScript    return Math.random().toString(36).substring(7) + "@example.com"
    Input Text    (//input[@id='Email'])[1]    ${random_email}
    #opslaan
    Set Global Variable    ${random_email}
    Sleep    3
    Input Text    (//input[@id='Password'])[1]    ${password}
    Input Text    (//input[@id='ConfirmPassword'])[1]    ${password}
    Sleep    2
    Click Element    (//input[@id='register-button'])[1]
    Sleep    3


Login existing customer
    Open Browser    ${URL16}    Chrome
    Maximize Browser Window
    Wait Until Page Contains    Register   
    Input Text    (//input[@id='Email'])[1]   ${random_email}
    Input Text    (//input[@id='Password'])[1]   ${password}
    Click Element    (//input[@value='Log in'])[1]
    Sleep    5
    Close Browser

    
Verify register page
    ${expected_text}    Set Variable    Your registration completed
    ${actual_text}    Get Text    (//div[@class='result'])[1]    
    Should Be Equal    ${actual_text}    ${expected_text}    

Generate Random 10-Digit Number
    ${digits}=    Evaluate    ''.join(random.choice('0123456789') for _ in range(10))
    [Return]    ${digits}

{day_locator} =
    [Arguments]    ${Set Variable}    ${(//div[@class}
    

*** Test Cases ***

Login Demo Swag Labs
    Open Browser    ${URL101}    Chrome    options=add_experimental_option("detach", True)	
    Maximize Browser Window
    Wait Until Page Contains    Swag Labs
    Input Text    (//input[@id='user-name'])[1]    standard_user
    Input Text    (//input[@id='password'])[1]    secret_sauce
    Click Element    (//input[@id='login-button'])[1]
    Sleep    3
    Click Element    (//button[@id='add-to-cart-sauce-labs-bike-light'])[1]
    Click Element    (//a[@class='shopping_cart_link'])[1]
    Sleep    2
    Click Element    (//button[normalize-space()='Checkout'])[1]

    ${first_name}    Generate Random First Name
    ${last_name}     Generate Random Last Name

    Input Text    (//input[@id='first-name'])[1]    ${first_name}
    Input Text    (//input[@id='last-name'])[1]      ${last_name}
    Input Text    (//input[@id='postal-code'])[1]    2033xr
    Click Element    (//input[@id='continue'])[1]
    Click Element    (//button[normalize-space()='Finish'])[1]
     Sleep    2s 
    Execute JavaScript    window.scrollTo(0, 750);
    

    ${expected_text}    Set Variable    Thank you for your order!
    ${actual_text}    Get Text    (//h2[normalize-space()='Thank you for your order!'])[1]   
    Should Be Equal    ${actual_text}    ${expected_text}

    Close Browser








Open datumplanner
    Open Browser    ${URL100}    Chrome    options=add_experimental_option("detach", True)	
    Maximize Browser Window
    Wait Until Page Contains    Date Picker
    Sleep    5
    Click Element    (//input[@id='dateAndTimePickerInput'])[1]
    Sleep    2
    Click Element    (//div[@aria-label='Choose Thursday, November 9th, 2023'])[1]
    Click Element    (//li[normalize-space()='14:15'])[1]
    




Open Proefritplanner
    Open Browser    ${URL99}    Chrome
    Maximize Browser Window
    Wait Until Page Contains    Plan jouw proefrit
    Sleep    3
    Click Element    (//a[normalize-space()='Alles accepteren'])[1]
    Sleep    5
    #Wait Until Element Is Visible    delivery-0Hh4H000000k9gZSAQ-33
    Click Element    delivery-0Hh4H000000k9gZSAQ-33
    Sleep    2
    Wait Until Element Is Visible    0Hn4H000000CcuZSAS-76
    Click Element    0Hn4H000000CcuZSAS-76

     FOR    ${day}    IN RANGE    1    32   # Ga ervan uit dat er maximaal 31 dagen zijn
        ${day_locator} =    Set Variable    (//div[@class='section slds-grid slds-gutters slds-wrap'])[${day}]
        ${is_day_clickable} =    Run Keyword And Return Status    Element Should Be Visible    ${day_locator}
        ${is_day_in_future} =    Run Keyword And Return Status    Element Should Be Visible    ${day_locator}
        Run Keyword If ${is_day_clickable} and ${is_day_in_future}
            Click Element    ${day_locator}
            Exit For Loop
      END

    Click Element    (//button[normalize-space()='28'])[1]
    Click Element    (//button[normalize-space()='13:00'])[1]
    Click Element    (//button[normalize-space()='Persoonsgegevens invullen'])[1]
    Sleep    5

    ${first_name}    Generate Random First Name
    ${last_name}     Generate Random Last Name

    Input Text    (//button[normalize-space()='Persoonsgegevens invullen'])[1]     ${first_name}
    Input Text    (//input[@id='input-255'])[1]      ${last_name}
    
    Sleep    2s  #
    ${random_email}=    Execute JavaScript    return Math.random().toString(36).substring(7) + "@example.com"
    Input Text    (//input[@id='input-260'])[1]]    ${random_email}
    #opslaan
    Set Global Variable    ${random_email}
    
    Input Text    (//input[@id='input-260'])[1]    0641414141
           


Open Register page enter same email
    Open Browser    ${URL12}    Chrome
    Maximize Browser Window
    Wait Until Page Contains    Register
    Click Element    (//input[@id='gender-male'])[1]

    ${first_name}    Generate Random First Name
    ${last_name}     Generate Random Last Name

    Input Text    (//input[@id='FirstName'])[1]     ${first_name}
    Input Text    (//input[@id='LastName'])[1]      ${last_name}

    Sleep    2s  #
    ${random_email}=    Execute JavaScript    return Math.random().toString(36).substring(7) + "@example.com"
    Input Text    (//input[@id='Email'])[1]    ${random_email}
    #opslaan
    Set Global Variable    ${random_email}

    Sleep    3
    Input Text    (//input[@id='Password'])[1]    ${password}
    Input Text    (//input[@id='ConfirmPassword'])[1]    ${password}
    Sleep    2
    Click Element    (//input[@id='register-button'])[1]
    Sleep    3
    Close Browser    


*** Test Cases ***
Login existing customer
    Open Browser    ${URL16}    Chrome
    Maximize Browser Window
    Wait Until Page Contains    Register   
    Input Text    (//input[@id='Email'])[1]   ${random_email}
    Input Text    (//input[@id='Password'])[1]   ${password}
    Sleep    3
    Click Element    (//input[@value='Log in'])[1]
    Sleep    5
    Close Browser

#*** Test Cases ***
Checkout random
    Open Browser    ${URL19}    ${BROWSER}    options=add_experimental_option("detach", True)
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
    Sleep    4s

    Click Button    (//input[@id='termsofservice'])[1]
    Click Button    (//button[normalize-space()='Checkout'])[1]
    Click Button    (//input[@value='Checkout as Guest'])[1]
    Sleep  2s

    ${first_name}    Generate Random First Name
    ${last_name}     Generate Random Last Name

    Input Text    (//input[@id='BillingNewAddress_FirstName'])[1]     ${first_name}
    Input Text    (//input[@id='BillingNewAddress_LastName'])[1]      ${last_name}

    Sleep    2s  #
    ${random_email}=    Execute JavaScript    return Math.random().toString(36).substring(7) + "@example.com"
    Input Text    (//input[@id='BillingNewAddress_Email'])[1]    ${random_email}
    Select From List By Label    BillingNewAddress_CountryId    Netherlands

    ${City_1}    Generate Random City

    Input Text    (//input[@id='BillingNewAddress_City'])[1]    ${City_1}

    ${Adress_1}    Generate Random Adress

     Input Text    (//input[@id='BillingNewAddress_Address1'])[1]    ${Adress_1}


    #${City_Random}=    Execute JavaScript    return Math.random().toString(36).substring(7) 
    #Input Text    (//input[@id='BillingNewAddress_City'])[1]    ${City_Random}

    #${Address 1_Random:}=    Execute JavaScript    return Math.random().toString(36).substring(7) 
    #Input Text    (//input[@id='BillingNewAddress_Address1'])[1]    ${Address 1_Random:}

     ${zipcode}=    Execute JavaScript
    ...    function generateRandomZipcode() {
    ...        const digits = Array.from({ length: 4 }, () => Math.floor(Math.random() * 10)).join('');
    ...        const letters = Array.from({ length: 2 }, () => String.fromCharCode(65 + Math.floor(Math.random() * 26)));
    ...        return digits + letters;
    ...    }
    ...    return generateRandomZipcode();
   
    Input Text    (//input[@id='BillingNewAddress_ZipPostalCode'])[1]    ${zipcode}

     ${random_number}=    Execute JavaScript
    ...    function generateRandomZipcode() {
    ...        const digits = Array.from({ length: 10 }, () => Math.floor(Math.random() * 10)).join('');
    ...        const letters = Array.from({ length: 0 }, () => String.fromCharCode(65 + Math.floor(Math.random() * 26)));
    ...        return digits + letters;
    ...    }
    ...    return generateRandomZipcode();
    ...   
    Input Text    (//input[@id='BillingNewAddress_PhoneNumber'])[1]   ${random_number}
    Sleep    3  
    Click Button    (//input[@onclick='Billing.save()'])[1]
    Sleep    3
    Sleep     2s    
    Click Button    //*[@id="shipping-buttons-container"]/input
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
    

