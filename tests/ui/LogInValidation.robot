*** Settings ***
Resource  ../../pages/LoginPage.robot
Resource    ../../pages/ErrorMessage.robot
Resource    ../../pages/FieldValidator.robot

Suite Setup     Open App
Suite Teardown  Close Browser
Library    Screenshot

*** Variables ***
${TEST_USER_LOGIN}     Dina20
${TEST_USER_PASSWORD}  s3cret


*** Test Cases ***
Should not log in with invalid password
    Fill In Credentials And Click Sign In  ${TEST_USER_LOGIN}     wrongPassword
    Expect Error Message    Username or password is invalid

Should not log in with invalid username
    Fill In Credentials And Click Sign In  wrongUsername    ${TEST_USER_PASSWORD} 
    Expect Error Message    Username or password is invalid

Field validation should be displayed when fields are empty
    Click Sign In
    Expect Helper Error For Field    username    Username is required