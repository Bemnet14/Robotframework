*** Settings ***
Library    SeleniumLibrary
#Resource    ..resource\email.random.robot


*** Variables ***
${URL12}          https://demowebshop.tricentis.com/register  
${password}       admin123


*** Test Cases ***
Generate and Enter Random Name Register
    Open Browser    ${URL12}    Chrome
    Maximize Browser Window
    Wait Until Page Contains    Register
    Click Element    (//input[@id='gender-male'])[1]

    ${first_name}    Generate Random First Name
    ${last_name}     Generate Random Last Name

    Input Text    (//input[@id='FirstName'])[1]     ${first_name}
    Input Text    (//input[@id='LastName'])[1]      ${last_name}

    Sleep    2s  
    ${random_email}=    Execute JavaScript    return Math.random().toString(36).substring(7) + "@example.com"
    Input Text    (//input[@id='Email'])[1]    ${random_email}
    Sleep    3
    Input Text    (//input[@id='Password'])[1]    ${password}
    Input Text    (//input[@id='ConfirmPassword'])[1]    ${password}
    Sleep    2
    Click Element    (//input[@id='register-button'])[1]
    Sleep    2

*** Test Cases ***
Verify Test
    #Wait Until Page Contains    Your Shopping Cart is empty!
    ${expected_text}    Set Variable    Your registration completed
    ${actual_text}    Get Text    (//div[@class='result'])[1]   
    Should Be Equal    ${actual_text}    ${expected_text}
    Close Browser

*** Keywords ***
Generate Random First Name
    ${first_name} =    Evaluate    random.choice(["Emma", "Liam", "Olivia", "Noah", "Ava", "Isabella", "Sophia", "Mia", "Charlotte", "Amelia", "Harper", "Evelyn", "Abigail", "Emily", "Elizabeth", "Sofia", "Avery", "Ella", "Scarlett", "Grace", "Lily", "Chloe", "Zoey", "Penelope", "Victoria", "Madison", "Eleanor", "Addison", "Aubrey", "Layla", "Scarlett", "Lily", "Hannah", "Brooklyn", "Zoe", "Sofia", "Stella", "Aurora", "Violet", "Skylar", "Claire", "Nora", "Leah", "Hazel", "Lucy", "Paisley", "Savannah", "Riley", "Ariana", "Camila"])
    [Return]    ${first_name}

Generate Random Last Name
    ${last_name} =    Evaluate    random.choice(["Johnson", "Smith", "Williams", "Brown", "Jones", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin", "Lewis", "Allen", "Lee", "Young", "Turner", "Hall", "Wright", "King", "Green", "Baker", "Scott", "Adams", "Martinez", "Rodriguez", "Nelson", "Mitchell", "Perez", "Carter", "Perez", "Walker", "Hill", "Murphy", "Rivera", "Reed", "Phillips", "Bailey", "Collins", "Russell", "Hayes", "Foster", "Butler", "Long", "Hughes", "Foster"])
    [Return]    ${last_name}

Create first_name and last_name
    Open Browser    ${URL12}    Chrome
    Maximize Browser Window

    ${first_name}    Generate Random First Name
    ${last_name}     Generate Random Last Name

    Input Text    (//input[@id='FirstName'])[1]     ${first_name}
    Input Text    (//input[@id='LastName'])[1]      ${last_name}

Open Register Random Page
     Open Browser    ${URL12}    Chrome
    Maximize Browser Window
    Wait Until Page Contains    Register
    Click Element    (//input[@id='gender-male'])[1]

    ${first_name}    Generate Random First Name
    ${last_name}     Generate Random Last Name

    Input Text    (//input[@id='FirstName'])[1]     ${first_name}
    Input Text    (//input[@id='LastName'])[1]      ${last_name}

    Sleep    2s  
    ${random_email}=    Execute JavaScript    return Math.random().toString(36).substring(7) + "@example.com"
    Input Text    (//input[@id='Email'])[1]    ${random_email}
    Sleep    3
    Input Text    (//input[@id='Password'])[1]    ${password}
    Input Text    (//input[@id='ConfirmPassword'])[1]    ${password}
    Sleep    2
    Click Element    (//input[@id='register-button'])[1]
    Sleep    2

Verify register page
    ${expected_text}    Set Variable    Your registration completed
    ${actual_text}    Get Text    (//div[@class='result'])[1]    
    Should Be Equal    ${actual_text}    ${expected_text}