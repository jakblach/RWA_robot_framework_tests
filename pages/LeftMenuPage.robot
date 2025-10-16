*** Settings ***
Resource  ../pages/Basic.robot

*** Variables ***
${LOG_OUT_BUTTON}  //div[@data-test="sidenav-signout"]

${HOME}          //div/span[text()='Home']
${MY_ACCOUNT}    //div/span[text()='My Acconut']
${NOTIFICATIONS}  //div/span[text()='Notifications']
${BANK_ACCOUNT}  //div/span[text()='Bank Accounts']
${ACCOUNT_BALANCE}    //div/span[text()='Home']

*** Keywords ***
Go To Home Page
    Click Element   ${HOME} 

Go To My Account Page
    Click Element    ${MY_ACCOUNT}

Go To Notifications Page
    Click Element    ${NOTIFICATIONS}

Go To Bank Accounts Page
    Wait Until Page Contains Element  ${BANK_ACCOUNT}
    Click Element    ${BANK_ACCOUNT}

Get Account Balance Value
    ${text}=    Get Text    ${ACCOUNT_BALANCE}
    ${value}=    Convert To Number    ${text.replace("$","").replace(",","")}
    Log    Account balance: ${value}
    RETURN   ${value}