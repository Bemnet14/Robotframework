*** Settings ***
Library           SeleniumLibrary
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
${First name}    Bemnet
${Last name}     Tewolde
${Email}         Bemnettewolde@hotmail.com
${City}          Haarlem
${Address 1:}    Van Loghemstraat 10
${Zip}           2022EE
${Phonenumber}    0642688371


*** Test Cases ***

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
  



    


    

    
        
    