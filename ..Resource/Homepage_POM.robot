*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Computer}=    (//a[@class='hover'])[1]
${Electronics}    (//a[@class='hover'])[1]

*** Keywords ***
Click Electronics
    Click Button    ${Electronics}
    
Click Computer
    Click Element    ${Computer}

    

