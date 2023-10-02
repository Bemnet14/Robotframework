*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL13}          https://demowebshop.tricentis.com/register  



*** Test Cases ***
Generate Random Email
    Open Browser    ${URL13}    Chrome
    Maximize Browser Window
    ${random_email}=    Execute JavaScript    return Math.random().toString(36).substring(7) + "@example.com"
    Input Text    (//input[@id='Email'])[1]    ${random_email}
    Sleep     5s
   # Log    Random Email: ${random_email}
    Close Browser

*** Keywords ***
Create Random Email
    ${random_email}=    Execute JavaScript    return Math.random().toString(36).substring(7) + "@example.com"
    Input Text    (//input[@id='Email'])[1]    ${random_email}