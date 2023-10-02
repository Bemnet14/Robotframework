*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Computer}=    (//a[@class='hover'])[1]

*** Keywords ***
Click Computer
    Click Element    ${Computer}
