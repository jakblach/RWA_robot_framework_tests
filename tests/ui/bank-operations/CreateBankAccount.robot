*** Settings ***
Resource   ../../../pages/LoginPage.robot
Resource   ../../../pages/WelcomePage.robot
Resource   ../../../pages/BankAccountPage.robot
Resource   ../../../pages/FieldValidator.robot
Resource   ../../../pages/RegisterPage.robot

Test Setup      Setup New User
Test Teardown   Close Browser

*** Variables ***
${BANK_NAME_VALID}       Valid Bank
${ROUTING_NUMBER_VALID}  123456789
${ACCOUNT_NUMBER_VALID}  987654321
${PASSWORD}              s3cret1
${USERNAME}

*** Test Cases ***
Bank Account - Validation: Empty Bank Name
    [Tags]    bankaccount    validation
    Expect Modal Header
    Fill Bank Account Form    ${EMPTY}    ${ROUTING_NUMBER_VALID}    ${ACCOUNT_NUMBER_VALID}
    Expect Helper Error For Field    bankaccount-bankName-input    Enter a bank name

Bank Account - Validation: Bank Name Too Short
    [Tags]    bankaccount    validation
    Expect Modal Header
    Fill Bank Account Form    abc    ${ROUTING_NUMBER_VALID}    ${ACCOUNT_NUMBER_VALID}
    Expect Helper Error For Field    bankaccount-bankName-input    Must contain at least 5 characters

Bank Account - Validation: Routing Number Too Short
    [Tags]    bankaccount    validation
    Expect Modal Header
    Fill Bank Account Form    ${BANK_NAME_VALID}    12345    ${ACCOUNT_NUMBER_VALID}
    Expect Helper Error For Field    bankaccount-routingNumber-input    Must contain a valid routing number

Bank Account - Validation: Account Number Too Short
    [Tags]    bankaccount    validation
    Expect Modal Header
    Fill Bank Account Form    ${BANK_NAME_VALID}    ${ROUTING_NUMBER_VALID}    12
    Expect Helper Error For Field    bankaccount-accountNumber-input    Must contain at least 9 digits

*** Keywords ***
Setup New User
    Open App
    Go To Signup Page
    ${USERNAME}=    Generate Unique Username
    Set Suite Variable    ${USERNAME}    ${USERNAME}
    Register User    TestUser    AutomationUserson    ${USERNAME}    ${PASSWORD}
    Fill In Credentials And Click Sign In    ${USERNAME}    ${PASSWORD}
    Expect Welcom Popup For New User
    Click Next In Welcome Popup