*** Settings ***
Resource   ../../../pages/RegisterPage.robot
Resource   ../../../pages/FieldValidator.robot
Resource    ../../../pages/Common.robot

Suite Setup     Open App
Test Setup      Go To Signup Page
Suite Teardown  Close Browser

*** Variables ***
${PASSWORD}    s3cret1

*** Test Cases ***
Should Show Error When Username Is Empty
    Fill Registration Form    Test    User    ${EMPTY}    ${PASSWORD}
    Expect Helper Error For Field    username    Username is required
    Expect Sign Up Disabled

Should Show Error When Password Is Too Short
    ${unique_user}  Generate Unique Username
    Fill Registration Form    Test    Test    ${unique_user}    123
    Expect Helper Error For Field    password    Password must contain at least 4 characters
    Expect Sign Up Disabled

Should Show Error When Passwords Do Not Match
    ${unique_user}  Generate Unique Username
    Fill Registration Form    Test    User    ${unique_user}    ${PASSWORD}    different
    Expect Helper Error For Field    confirmPassword    Password does not match
    Expect Sign Up Disabled

Should Show Error When First Name Is Empty
    ${unique_user}  Generate Unique Username
    Fill Registration Form    ${EMPTY}    User    ${unique_user}    ${PASSWORD}
    Expect Helper Error For Field    firstName    First Name is required
    Expect Sign Up Disabled

Should Show Error When Last Name Is Empty
    ${unique_user}  Generate Unique Username
    Fill Registration Form    Test    ${EMPTY}    ${unique_user}    ${PASSWORD}
    Expect Helper Error For Field    lastName    Last Name is required
    Expect Sign Up Disabled