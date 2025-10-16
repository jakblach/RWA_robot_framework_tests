*** Settings ***
Resource   ../../../pages/LoginPage.robot
Resource   ../../../pages/WelcomePage.robot
Resource   ../../../pages/BankAccountPage.robot
Resource   ../../../pages/RegisterPage.robot


Suite Setup  Run Keywords  Open App
                 ...  AND  Go To Signup Page
                 ...  AND  Register User    TestUser    AutomationUserson    ${USERNAME}   ${TEST_PASSWORD}
                 ...  AND  Fill In Credentials And Click Sign In  ${USERNAME}  ${TEST_PASSWORD}
                 ...  AND  Expect Welcom Popup For New User
                 ...  AND  Click Next In Welcome Popup
Suite Teardown  Close Browser

*** Variables ***
${BANK_NAME}        TestBank
${ROUTING_NUMBER}   123456789
${ACCOUNT_NUMBER}   987654321

${USERNAME}  TEST11165444
${TEST_PASSWORD}  s3cretpassword

*** Test Cases ***
User Can Create A Bank Account After Registration
    [Tags]    bankaccount    critical
    Create Bank Account    ${BANK_NAME}    ${ROUTING_NUMBER}    ${ACCOUNT_NUMBER}
    Click Done Button In Welcome Popup
    App Logo Should Be Visible

