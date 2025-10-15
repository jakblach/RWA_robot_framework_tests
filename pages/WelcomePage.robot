*** Settings ***
Resource  ../pages/Basic.robot

*** Variables ***
${GET_STARTED_WITH_RWA_POPUP}  //h2[@data-test='user-onboarding-dialog-title']

*** Keywords ***
Expect Welcom Popup For New User
    Wait Until Page Contains Element    ${GET_STARTED_WITH_RWA_POPUP}