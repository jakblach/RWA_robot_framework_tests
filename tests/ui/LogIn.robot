*** Settings ***
Resource  ../../pages/LoginPage.robot

Suite Setup     Open App
Suite Teardown  Close Browser

*** Variables ***
${TEST_USER_LOGIN}     Dina20
${TEST_USER_PASSWORD}  s3cret

*** Test Cases ***
User can log in successfully
    Fill In Credentials And Click Sign In  ${TEST_USER_LOGIN}  ${TEST_USER_PASSWORD}
    Wait Until Page Contains Element       ${APP_LOGO}