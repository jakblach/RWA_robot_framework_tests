*** Settings ***
Resource  ../pages/Basic.robot

*** Variables ***
${HEADER}                     css=[data-test="user-onboarding-dialog-title"]
${BANK_NAME_FIELD}            id=bankaccount-bankName-input
${ROUTING_NUMBER_FIELD}       id=bankaccount-routingNumber-input
${ACCOUNT_NUMBER_FIELD}       id=bankaccount-accountNumber-input
${SAVE_BUTTON}                //div/button[@data-test='bankaccount-submit']
${CREATE_BANK_ACCOUNT_BUTTON}   //div/a[@data-test="bankaccount-new"]
${DELETE_BUTTON}              xpath=//button[normalize-space(text())="Delete"]
${BANK_ACCOUNT_ITEM}          css=li[data-test^="bankaccount-list-item"]

*** Keywords ***
Create Bank Account From Main Page
    Click Element  ${CREATE_BANK_ACCOUNT_BUTTON}

Expect Modal Header
    Wait Until Element Is Visible    ${HEADER}
    Element Text Should Be           ${HEADER}    Create Bank Account

Fill Bank Account Form
    [Arguments]    ${bankName}    ${routing}    ${account}
    Wait Until Element Is Visible    ${BANK_NAME_FIELD}
    Input Text    ${BANK_NAME_FIELD}       ${bankName}
    Input Text    ${ROUTING_NUMBER_FIELD}  ${routing}
    Input Text    ${ACCOUNT_NUMBER_FIELD}  ${account}

Create Bank Account
    [Arguments]    ${bankName}    ${routing}    ${account}
    Fill Bank Account Form    ${bankName}    ${routing}    ${account}
    Wait Until Element Is Enabled    ${SAVE_BUTTON}    timeout=10s
    Click Button    ${SAVE_BUTTON}    

Delete Bank Account
    [Arguments]    ${bankAccountName}
    ${delete_button}  Set Variable    xpath=//p[text()='${bankAccountName}']/following::button[@data-test='bankaccount-delete'][1]
    Wait Until Element Is Visible    ${delete_button}    timeout=20s
    Click Button    ${delete_button}
    ${deleted_label}  Set Variable    xpath=//p[contains(normalize-space(.),"${bankAccountName} (Deleted)")]
    Wait Until Element Is Visible    ${deleted_label}    timeout=10s
