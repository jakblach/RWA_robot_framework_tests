*** Settings ***
Resource  ../pages/Basic.robot
Resource  ../pages/LoginPage.robot

*** Variables ***
${SIGNUP_URL}            ${URL}/signup
${FIRST_NAME_FIELD}      id=firstName
${LAST_NAME_FIELD}       id=lastName
${CONFIRM_PASSWORD_FIELD}  id=confirmPassword
${SIGNUP_BUTTON}         xpath=//button[@data-test="signup-submit"]

*** Keywords ***
Go To Signup Page
    Go To    ${SIGNUP_URL}
    Wait Until Element Is Visible    ${SIGNUP_BUTTON}  5s

Fill Registration Form
    [Arguments]   ${firstName}    ${lastName}    ${username}    ${password}    ${confirmPassword}=${password}
    Input Text    ${FIRST_NAME_FIELD}    ${firstName}
    Input Text    ${LAST_NAME_FIELD}     ${lastName}
    Input Text    ${USERNAME_FIELD}      ${username}
    Input Text    ${PASSWORD_Field}      ${password}
    Input Text    ${CONFIRM_PASSWORD_FIELD}    ${confirmPassword}

Click Sign Up
    Click Button    ${SIGNUP_BUTTON}

Register User
    [Arguments]    ${firstName}    ${lastName}    ${username}    ${password}    ${confirmPassword}=${password}
    Fill Registration Form    ${firstName}    ${lastName}    ${username}    ${password}    ${confirmPassword}
    Expect Sign Up Enabled
    Click Sign Up
    Log To Console  User login: ${username}. User password: ${password}.

Expect Sign Up Enabled
    Element Should Be Enabled    ${SIGNUP_BUTTON}

Expect Sign Up Disabled
    Element Should Be Disabled    ${SIGNUP_BUTTON}

