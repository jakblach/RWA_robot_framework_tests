*** Settings ***
Resource  ../pages/Basic.robot
Resource  ../pages/MainPage.robot

*** Variables ***
${USERNAME_FIELD}   id=username
${PASSWORD_FIELD}   id=password
${SIGN_IN_BUTTON}   xpath=//button[@data-test="signin-submit"]

*** Keywords ***
Fill Credentials
    [Arguments]  ${username}  ${password}
    Input Text   ${USERNAME_FIELD}    ${username}
    Input Text   ${PASSWORD_FIELD}    ${password}

Click Sign In
    Wait Until Element Is Enabled  ${SIGN_IN_BUTTON}  5s
    Click Button                   ${SIGN_IN_BUTTON}

Fill In Credentials And Click Sign In
    [Arguments]       ${username}  ${password}
    Fill Credentials  ${username}  ${password}
    Click Sign In