*** Settings ***
Resource  ../pages/Basic.robot

*** Variables ***

*** Keywords ***
Generate Unique Username
    ${timestamp}   Get Time    epoch
    ${username}    Set Variable    user_${timestamp}
    RETURN   ${username}

