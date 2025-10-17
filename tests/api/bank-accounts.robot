*** Settings ***
Resource  ../../pages/ApiResource.robot

*** Test Cases ***
Get List Of Bank Accounts
    ${userId}   Login User
    ${accounts}  Get Bank Accounts    ${userId}
    ${userIds}   Evaluate    [a['userId'] for a in $accounts]
    Should Contain    ${userIds}    ${userId}

Create New Bank Account
    ${userId}    Login User
    ${resp}    ${account}=   Create Bank Account   TESTbankRWA    1234567890    987654321
    Should Be Equal    ${account['userId']}    ${userId}
    Log To Console    Created bank account ID: ${account['id']}

Delete Bank Account
    ${userId}    Login User
    ${resp}    ${account}   Create Bank Account    Delete Bank Api Test    000111222    333444555
    ${bankAccountId}=   Set Variable    ${account['id']}
    Delete Bank Account    ${bankAccountId}
    Log To Console    Deleted bank account ID: ${bankAccountId}

Create Bank Account With Empty Fields
    [Tags]  bug002  backednd  
    ${userId}  Login User
    ${resp}    ${account}  Create Bank Account    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Should Be Equal As Integers    ${resp.status_code}    400