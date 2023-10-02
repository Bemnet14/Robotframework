*** Settings ***
Library           SeleniumLibrary


*** Variables ***
${BROWSER}        Chrome
${URL}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USERNAME}       Admin
${PASSWORD}       admin123
${test}           Test
${login}          login 

*** Test Cases ***
Login Test
    Open Browser    ${URL}    ${BROWSER}    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Wait Until Page Contains    Login
    Input Text      (//input[@placeholder='Username'])[1]    ${USERNAME}     # XPath-selector voor het gebruikersnaamveld
    Input Password  (//input[@placeholder='Password'])[1]    ${PASSWORD}     # XPath-selector voor het wachtwoordveld
    Click Element   (//button[normalize-space()='Login'])[1]                 # XPath-selector voor de aanmeldknop
    Wait Until Page Contains Element    (//h6[normalize-space()='Dashboard'])[1]
    Page Should Contain    Time at Work
    Sleep    5s    # Wacht 5 seconden
    Click Element    (//i[@class='oxd-icon bi-caret-down-fill oxd-userdropdown-icon'])[1]
    Click Element    (//a[normalize-space()='Logout'])[1]
    
#${login}    Run Keyword And Return Status    Page Should Contain  login    
#Should Be True    ${login}    Inlog
   Log    Successful login with valid credentials
    ## Sleep     10s  
    
   # Wait Until Page Contains    Login
   
