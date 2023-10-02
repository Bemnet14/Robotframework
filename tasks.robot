*** Settings ***
Library    RPA.Browser.Selenium
Library    RPA.Desktop
*** Variables ***
${url}=    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${Browser}=   chrome
${USERNAME}       Admin
${PASSWORD}       admin123


*** Test Cases ***

Eerste Test Selenium
    Open Browser    ${url}    ${Browser}
Input Text    username   ${USERNAME} 
input Text     


