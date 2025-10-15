*** Settings ***
Resource  ../pages/Basic.robot

*** Variables ***
${ERROR_MSG_CONTAINER}  //div[@data-test='signin-error']

*** Keywords ***
Expect Error Message
    [Arguments]    ${expected_text}
    Wait Until Element Contains    ${ERROR_MSG_CONTAINER}    ${expected_text}