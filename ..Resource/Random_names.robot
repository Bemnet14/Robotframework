*** Settings ***
Library    SeleniumLibrary
Library    name_generator.py    WITH NAME    RandomNameGenerator
   

*** Test Cases ***
Generate and Enter Random Name
    Open Browser    https://demowebshop.tricentis.com/register   Chrome
    Maximize Browser Window

   
   # ${first_name}    RandomNameGenerator.Generate Random First Name
    #${last_name}     RandomNameGenerator.Generate Random Last Name

    Input Text    l(//input[@id='FirstName'])[1]    ${first_name11}
    Input Text    l(//input[@id='LastName'])[1]    ${last_name111}

    Sleep    2s  # Geef tijd om de namen te bekijken (verwijder dit in een echte test)
    Close Browser
