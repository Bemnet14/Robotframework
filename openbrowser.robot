*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://demowebshop.tricentis.com/
${USERNAME}       Admin
${PASSWORD}       admin123

*** Keywords ***
Input username
   # [Arguments]    ${<input class}    ${${USERNAME}}
    

*** Test Cases ***
Login Test
    Open Browser    ${URL}    ${BROWSER}
    Click Link    /html/body/div[4]/div[1]/div[2]/ul[1]/li[1]/a
    Close Browser
