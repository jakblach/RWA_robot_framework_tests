*** Settings ***
Resource  ../pages/Basic.robot

*** Variables ***
${GET_STARTED_WITH_RWA_POPUP}  //h2[@data-test='user-onboarding-dialog-title']
${NEXT_STEP_RWA_POPUP}         //button[@data-test="user-onboarding-next"]
${DONE_STEP_RWA_POPUP}         //button[@data-test='user-onboarding-next']

*** Keywords ***
Expect Welcom Popup For New User
    Wait Until Page Contains Element    ${GET_STARTED_WITH_RWA_POPUP}

Click Next In Welcome Popup
    Wait Until Page Contains Element    ${NEXT_STEP_RWA_POPUP} 
    Click Element    ${NEXT_STEP_RWA_POPUP}

Click Done Button In Welcome Popup
    Wait Until Page Contains Element    ${DONE_STEP_RWA_POPUP}
    Click Element    ${DONE_STEP_RWA_POPUP}
    