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
${LANGUAGE}     xpath=//*[@class='MuiListItemText-root']/span
${DASHBOARD}    https://scouts-test.futbolkolektyw.pl/en
${PAGELOGO_D}   xpath=//*[@id="__next"]/div[1]/header/div/h6
${PLAYERS}      xpath=//*/ul[1]/div[2]/div[2]/span

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click On The Sign Button
    Assert dashboard
    [Teardown]      Close Browser

Change language
    Open Login Page
    Type In Email
    Type In Password
    Click On The Sign Button
    Open Dashboard
    Click On The Language Button
    [Teardown]      Close Browser

Show Players
    Open Login Page
    Type In Email
    Type In Password
    Click On The Sign Button
    Open Dashboard
    Click On The Players Button
    [Teardown]    Close Browser

Login To The System With Invalid Data
    Open Login Page
    Type In Invalid Email
    Type In Password
    Click On The Sign Button
    Show info
    [Teardown]    Close Browser


*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}         ${BROWSER}
    Title Should Be     Scouts panel - sign in

Type in email
    Input Text      ${EMAIL}        user05@getnada.com

Type in invalid email
    Input Text      ${EMAIL}        user05@getnada.comm

Type in password
    Input Text      ${PASSWORD}     Test-1234

Click on the sign button
    Click Element       xpath=//span[1]

Open dashboard
    Wait Until Element Is Visible       ${PAGELOGO_D}
    #Open Browser    ${DASHBOARD}        ${BROWSER}
    Title Should Be    Scouts panel

Assert dashboard
    Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be     Scouts panel - sign in
    Capture Page Screenshot     alert.png

Click on the language button
    Click Element        xpath=//*[@class='MuiListItemText-root']/span

Click on the players button
    Click Element       xpath=//*/ul[1]/div[2]/div[2]/span

Show info
    Wait Until Page Contains        Identifier or password invalid.