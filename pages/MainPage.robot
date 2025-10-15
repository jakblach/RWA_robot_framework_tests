*** Settings ***
Resource  ../pages/Basic.robot
Resource  ../pages/LeftMenuPage.robot

*** Variables ***
${APP_LOGO}  //h1[@data-test='app-name-logo']

*** Keywords ***
Log Out
    Click Element  ${LOG_OUT_BUTTON}