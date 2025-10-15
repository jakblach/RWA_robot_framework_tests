*** Settings ***
Resource   ../../../pages/RegisterPage.robot
Resource    ../../../pages/WelcomePage.robot
Resource    ../../../pages/Common.robot

Test Setup     Run Keywords  Open App
               ...  AND      Go To Signup Page
Test Teardown  Close Browser

*** Variables ***
${PASSWORD}     s3cret1
${UNIQUE_USER}

*** Test Cases ***
User can register and log in with a new account
    Go To Signup Page
    ${UNIQUE_USER}  Generate Unique Username

    # USER REGISTRATION
    Go To Signup Page
    Register User    TEST    USER    ${UNIQUE_USER}    ${PASSWORD}
    
    # LOGIN WITH NEWLY REGISTERED USER
    Fill Credentials    ${UNIQUE_USER}    ${PASSWORD}
    Click Sign In
    Expect Welcom Popup For New User