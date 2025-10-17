*** Settings ***
Resource  ../../pages/ApiResource.robot

*** Test Cases ***
Successful Login
    ${userId}    Login User
    Log    User ID: ${userId}

Login With Invalid Password
    ${status}    Login As Invalid User    Dina20    wrongpassword
    Should Be Equal As Integers    ${status}    401