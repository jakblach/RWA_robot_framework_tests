*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BASE_URL}      http://localhost:3001

*** Keywords ***
Login User
    [Arguments]    ${username}    ${password}
    Create Session    api    ${BASE_URL}
    ${payload}  Create Dictionary    username=${username}    password=${password}
    ${response}   POST On Session    api    /login    json=${payload}
    ${status}  Convert To Integer    ${response.status_code}
    VAR  ${body}  ${response.json()}
    RETURN    ${status}    ${body}

*** Test Cases ***
Successful Login
    ${status}    ${body}=    Login User    Dina20    s3cret
    Should Be Equal As Integers    ${status}    200
    Should Be Equal    ${body['user']['username']}    Dina20
    Log    User ID: ${body['user']['id']}
    Log    Balance: ${body['user']['balance']}


Login With Invalid Password
    ${response}    ${status}=    Login User    Dina20    wrongpassword
    Should Be Equal As Integers    ${status}    401
