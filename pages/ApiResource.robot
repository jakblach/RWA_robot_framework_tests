*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BASE_URL}      http://localhost:3001
${USERNAME}      Dina20
${PASSWORD}      s3cret

*** Keywords ***
Login User
    [Arguments]    ${username}=${USERNAME}    ${password}=${PASSWORD}
    Create Session    api    ${BASE_URL}
    ${payload}    Create Dictionary    username    ${USERNAME}    password    ${PASSWORD}
    ${resp}    POST On Session    api    /login    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200
    ${body}    Evaluate    $resp.json()
    ${userId}    Set Variable    ${body['user']['id']}
    RETURN   ${userId}

Get Bank Accounts
    [Arguments]    ${userId}
    ${resp}    GET On Session    api    /bankAccounts
    Should Be Equal As Integers    ${resp.status_code}    200
    ${body}    Evaluate    $resp.json()
    ${accounts}    Set Variable    ${body['results']}
    RETURN    ${accounts}

Create Bank Account
    [Arguments]    ${bankName}    ${accountNumber}    ${routingNumber}
    ${payload}    Create Dictionary    bankName    ${bankName}    accountNumber    ${accountNumber}    routingNumber    ${routingNumber}
    ${resp}    POST On Session    api    /bankAccounts    json=${payload}
    Should Be True    ${resp.status_code} == 200 or ${resp.status_code} == 400
    ${body}    Evaluate    $resp.json()
    ${account}    Set Variable    ${body.get('account', {})}
    RETURN    ${resp}    ${account}

Delete Bank Account
    [Arguments]    ${bankAccountId}
    ${resp}    DELETE On Session    api    /bankAccounts/${bankAccountId}
    Should Be Equal As Integers    ${resp.status_code}    200

Login As Invalid User
    [Arguments]    ${username}    ${password}
    Create Session    api    ${BASE_URL}
    ${payload}    Create Dictionary    username    ${username}    password    ${password}
    ${resp}    POST On Session    api    /login    json=${payload}    expected_status=401
    RETURN    ${resp.status_code}
