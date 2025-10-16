*** Settings ***
Resource   ../../../pages/LoginPage.robot
Resource   ../../../pages/BankAccountPage.robot

Test Setup  Run Keywords  Open App
                ...  AND  Fill In Credentials And Click Sign In    Dina20   s3cret
Suite Teardown    Close Browser

*** Variables ***
${TEST_BANK_NAME}       TESTBANKACCOUNTAMADIUS001
${TEST_ROUTING_NUMBER}  123456789
${TEST_ACCOUNT_NUMBER}  987654321

*** Test Cases ***
User Should Be Able To Remove New Created Bank Account
    Go To Bank Accounts Page
    Create Bank Account From Main Page
    Create Bank Account  ${TEST_BANK_NAME}  ${TEST_ROUTING_NUMBER}  ${TEST_ACCOUNT_NUMBER}
    Delete Bank Account  ${TEST_BANK_NAME}
