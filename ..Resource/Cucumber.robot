*** Settings ***
Documentation     Voorbeeld van BDD-tests voor de Demo Webshop
Library           SeleniumLibrary
Library           OperatingSystem
Suite Setup       Open Browser    https://demowebshop.tricentis.com/login    Chrome
Suite Teardown    Close Browser

*** Test Cases ***


Aanmelden met geldige gegevens
    [Documentation]    De gebruiker meldt zich aan met geldige gegevens.
  #  Given    De gebruiker is op de aanmeldingspagina van de Demo Webshop
   # When     De gebruiker hun geldige gebruikersnaam en wachtwoord invoert
   # And      De gebruiker klikt op de aanmeldknop
    #Then     De gebruiker zou moeten worden aangemeld

registreren met inlog
Feature: Klantregistratie op demowebshop.tricentis.com

  #  Scenario: Klant registreert zich op de website
    #    Given De gebruiker is op de registratiepagina
     #   When De gebruiker vult de registratiegegevens in
      #  And De gebruiker klikt op de registratieknop
       # Then wordt de gebruiker geregistreerd en ingelogd

Aanmelden met ongeldige gegevens
    [Documentation]    De gebruiker meldt zich aan met ongeldige gegevens.
   # Given    De gebruiker is op de aanmeldingspagina van de Demo Webshop
    #When     De gebruiker hun ongeldige gebruikersnaam en wachtwoord invoert
   # And      De gebruiker klikt op de aanmeldknop
    #Then     De gebruiker zou een foutmelding moeten zien

*** Keywords ***
De gebruiker is op de aanmeldingspagina van de Demo Webshop
    Go To    https://demowebshop.tricentis.com/login

De gebruiker hun geldige gebruikersnaam en wachtwoord invoert
    Input Text    id=Email    your_valid_email@example.com
    Input Text    id=Password    your_valid_password

De gebruiker hun ongeldige gebruikersnaam en wachtwoord invoert
    Input Text    id=Email    invalid_email@example.com
    Input Text    id=Password    invalid_password

De gebruiker klikt op de aanmeldknop
    Click Button    name=Log in

De gebruiker zou moeten worden aangemeld
    Wait Until Page Contains    Welcome to our store

De gebruiker zou een foutmelding moeten zien
    Wait Until Page Contains    Login was unsuccessful
