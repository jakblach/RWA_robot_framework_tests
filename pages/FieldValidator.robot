*** Settings ***
Resource  ../pages/Basic.robot

*** Keywords ***
Expect Helper Error For Field
    [Arguments]    ${field_id}    ${expected_text}
    ${field_validator_locator}    Set Variable    xpath=//p[@id='${field_id}-helper-text']
    Wait Until Element Contains    ${field_validator_locator}    ${expected_text}