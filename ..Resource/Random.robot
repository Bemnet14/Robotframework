*** Settings ***
Library           SeleniumLibrary
Library            String
Resource    Homepage_POM.robot

*** Variables ***
${Shopping}     ((//span[normalize-space()='Shopping cart'])[1]]
${BROWSER}        Chrome
${URL1}            https://demowebshop.tricentis.com/register    
${USERNAME}       Admin
${PASSWORD}       admin123
${test}           Test
${login}          login 
${var}            
${expected_text}    Thank you
${actual_text}     (//h1[normalize-space()='Thank you'])[1]
${First nameR}    Bennie
${Last nameR}     Teper
${password}       Funnel100
${EmailR}         Bennieteper@hotmail.com
${City}          Haarlem
${Address 1:}    Van Loghemstraat 6
${Zip}           2022EE
${Phonenumber}    0642644374

*** Keywords ***
Generate Random First Name
    ${first_name} =    Evaluate    random.choice(["John", "Alice", "Bob", "Emma", "Michael"])
    [Return]    ${first_name}

Generate Random Last Name
    ${last_name} =    Evaluate    random.choice(["Smith", "Johnson", "Brown", "Lee", "Davis"])
    [Return]    ${last_name}


Open Webshop Register
    Open Browser    ${URL1}    ${BROWSER}    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Wait Until Page Contains    Register
    Click Element    (//input[@id='gender-male'])[1]
    Input Text    (//input[@id='FirstName'])[1]    ${First nameR} 
    Input Text    (//input[@id='LastName'])[1]    ${Last nameR}
    Input Text    (//input[@id='Email'])[1]    ${EmailR}
    Sleep    2
    Input Text    (//input[@id='Password'])[1]    ${password}
    Input Text    (//input[@id='ConfirmPassword'])[1]    ${password}
    Sleep    2
    Click Element    (//input[@id='register-button'])[1]


