*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}        https://reqres.in/

*** Test Cases ***
get name
    Create Session    mijnsessie    ${base_url}
    ${Response}=    Get Request    mijnsessie     /api/users/2

   Log To Console    ${Response.status_code}
   Log To Console    ${Response.content}
   # Log To Console    ${Response.headers}
    
    #validation
    
    ${Status_code}=    convert to String    ${Response.status_code}
    Should Be Equal    ${Status_code}    200
    
    ${Body}=     convert to string    ${Response.content}
    Should Contain    ${Body}    janet

*** Test Cases ***
post name
    Create Session    postsessie    ${base_url}
    #${Body}=    Create Dictionary    "name": "morpheus    "job": "leader"
    ${Body}=    Create Dictionary    name=morpheus    job=leader
    ${Header}=  Create Dictionary    Content-Type=application/json

    ${Response}=    Post Request    postsessie    /api/users     data=${Body} headers=${Header}

    Log To Console    ${Response.status_code}
    Log To Console    ${Response.content}

    ${Status_code}=    convert to String    ${Response.status_code}
    Should Be Equal    ${Status_code}    201

    ${res_body}=    Convert To String    ${Response.content}
    Should Contain    ${res_body}    morpheus


*** Test Cases ***
Create User Test
    Create Session    reqres_session    https://reqres.in

    ${user_data}=    Create Dictionary
    Set To Dictionary    ${user_data}    name=morpheus
    Set To Dictionary    ${user_data}    job=leader

    ${headers}=    Create Dictionary    Content-Type=application/json

    ${response}=    Post Request    reqres_session    /api/users    json=${user_data}    headers=${headers}

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    Should Be Equal As Strings    ${response.status_code}    201    # Verwachte statuscode voor succesvolle creatie



