*** Settings ***
Library           SeleniumLibrary
Resource          ..resource/Locators.robot



*** Variables ***
${URL20}          https://demowebshop.tricentis.com/register  
${URL21}          https://www.funda.nl/
${password}       admin123
${BROWSER}    Chrome
${random_email}  Haarlem1



*** Test Cases ***
test email 
    Open Browser    ${URL21}    Chrome
    Maximize Browser Window
    Sleep    1
    Click Element    //*[@id="didomi-notice-agree-button"]/span
    Sleep    2
    Click Element    //*[@id="recaptcha-anchor"]/div[1]
    Reload Page
    Input Text    (//input[@id='autocomplete-input'])[1]    Haarlem
    Click Element    (//button[normalize-space()='Zoek'])[1]
    
#*** Test Cases ***
test email 
    Open Browser    ${URL20}    Chrome
    Maximize Browser Window
    Wait Until Page Contains    Register   
    Input Text    ${vnaam}     Haarlem 
    Click Element    ${vnaam}   input text ${random_email}
    Input Text    (//input[@id='Password'])[1]   ${password}
    Sleep    3
    Click Element    (//input[@value='Log in'])[1]
    Sleep    5
    Close Browser