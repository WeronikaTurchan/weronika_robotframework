*** Settings ***
Library    SeleniumLibrary
Documentation    Suite description #automated tests for scout website
*** Variables ***
${LOGIN URL}    https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${EMAIL}        xpath=//*[@id='login']
${PASSWORD}     xpath=//*[@id='password']
${SIGNIN}       xpath=//span[1]
${PAGELOGO}     xpath=//*[@id="__next"]/form/div/div[1]/h5

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click On The Sign Button
    Assert dashboard

*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}         ${BROWSER}
    Title Should Be     Scouts panel - sign in

Type in email
    Input Text      ${EMAIL}        user05@getnada.com

Type in password
    Input Text      ${PASSWORD}     Test-1234

Click on the sign button
    Click Element       xpath=//span[1]

Assert dashboard
    Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be     Scouts panel - sign in
    Capture Page Screenshot     alert.png