*** Settings ***
Library    SeleniumLibrary
Resource   name_generator.py

*** Variables ***
${URL5}          https://demowebshop.tricentis.com/register
${first_name}    RandomNameGenerator.Generate Random First Name
${last_name}     RandomNameGenerator.Generate Random Last Name 

*** Keywords ***
Open Example Page1
    Open Browser    ${URL5}    Chrome

Generate and Enter Random Name1
    [Documentation]    Generates and enters random first name and last name.
    #Generate Random First Name
   # Generate Random Last Name
    Input Text    l(//input[@id='FirstName'])[1]    ${first_name}
    Input Text    l(//input[@id='LastName'])[1]    ${last_name}
Generate Random First Name1
    [Return]    ${first_name}    NameGenerator().generate_random_first_name()

Generate Random Last Name1
    [Return]    ${last_name}    NameGenerator().generate_random_last_name()
