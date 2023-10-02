*** Settings ***
Library           SeleniumLibrary
Resource        ..Resource/Regtest.robot


*** Variables ***
${URL12}          https://demowebshop.tricentis.com/register  
${password}       admin123



** Test Cases ***
open site
    regtest.Open Register page enter same email
    regtest.Login existing customer



       



    







    


    

    
        
    