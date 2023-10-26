*** Settings ***
Library           SeleniumLibrary
Library    RPA.HTTP
Resource        ..Resource/Checkout.robot
Resource        ..Resource/Register.robot
Resource        ..Resource/Name.robot
Resource    ..Resource/Regtest.robot




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
${First name}    Bennie
${Last name}     Toper
${Email}         Benok@gmail.com
${City}          Haarlem
${Address 1:}    Van Loghemstraat 1000
${Zip}           2022EE
${Phonenumber}    06426848484


*** Test Cases ***

Scenario: Klant registreert zich op de website
    Checkout.Given De gebruiker is op de registratiepagina
    Checkout.When De gebruiker vult de registratiegegevens in
    Checkout.And De gebruiker klikt op de registratieknop
    Checkout.Then wordt de gebruiker geregistreerd en ingelogd
    Sleep     5
    Close Browser

Scenario: Basic Computer Purchase
    Checkout.Given the customer visits the website
    Checkout.When the customer selects a computer
    Checkout.And the customer adds the computer to the shopping cart
    Checkout.Then the customer should be able to purchase the computer
    Sleep    3
    Close Browser


Scenario: Bestaande Klant registreert zich op de website
    Checkout.Given De Gebruiker is op de loginpagina
    Checkout.When De Gebruiker logt in met bestaand email
    Checkout.Then De Gebruiker is ingelogd
    Sleep    3
    Close Browser

Test 1
    Checkout.Open Webshop
    Checkout.Add Computer 
    Checkout.Checkout
    Checkout.Verify order
    Sleep    3
    Close Browser
    


** Test Cases ***
Test Registerpage
    Register.Open Webshop Register
  



    


    

    
        
    