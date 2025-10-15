*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}              http://localhost:3000
${CHROME_BROWSER}   chrome
${FIREFOX_BROWSER}  firefox

*** Keywords ***
Open App
    [Arguments]   ${url}=${URL}  ${browser}=${CHROME_BROWSER}
    Open Browser  ${url}         ${browser}  