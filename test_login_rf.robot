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
${ADD PLAYER}  xpath=//*[text()='Add player']
${ADD PLAYER URL}   https://scouts-test.futbolkolektyw.pl/en/players/add
${ADD PLAYER LOGO}  xpath=//*[@id="__next"]/div[1]/main/div[2]/form/div[1]/div/span
${EMAIL_P}      xpath=//*[@name='email']
${NAME}     xpath=//*[@name='name']
${SURNAME}      xpath=//*[@name='surname']
${PHONE}        xpath=//*[@name='phone']
${WEIGHT}       xpath=//*[@name='weight']
${HEIGHT}       xpath=//*[@name='height']
${AGE}      xpath=//*[@name='age']
${LEG}      xpath=//*[@id='mui-component-select-leg']
${LEFT_LEG}     xpath=//*[@id='menu-leg']/div[3]/ul/li[2]
${CLUB}     xpath=//*[@name='club']
${POSITION}     xpath=//*[@name='mainPosition']
${DISTRICT}     xpath=//*[@id='mui-component-select-district']
${CHOSEN_DISTRICT}      xpath=//*[@id='menu-district']/div[3]/ul/li[8]
${ACHIEVEMENTS}     xpath=//*[@name='achievements']
${ADD_LANGUAGE}     xpath=//*[text()='Add language']
${ENTER_LANGUAGE}       xpath=//*/div[15]/div/div/div/input
${SUBMIT}       xpath=//*/div[3]/button[1]/span[1]

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

Add Player
    Open Login Page
    Type In Email
    Type In Password
    Click On The Sign Button
    Open Dashboard
    Click on the Add Player Button
    Open Add Player Page
    Type In Player's Email
    Type in Name
    Type in Surname
    Type in Phone
    Type in Weight
    Type in Height
    Type in Age
    Type in Leg
    Select Leg
    Type in Club
    Type in position
    Type in District
    Select District
    Type in achievements
    Type in language
    Click Submit Button
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
Click on the add player button
    Click Element       xpath=//*[text()='Add player']
    Sleep    3s
Open add player page
    Wait Until Element Is Visible    ${ADD PLAYER LOGO}
    Title Should Be     Add player
Type in player's email
    Input Text      ${EMAIL_P}      karol.lis@gmail.com
Type in name
    Input Text      ${NAME}     Karol
Type in surname
    Input Text      ${SURNAME}      Lis
Type in phone
    Input Text      ${PHONE}        +48 243 908 111
Type in weight
    Input Text      ${WEIGHT}       95
Type in height
    Input Text      ${HEIGHT}       192
Type in age
    Input Text      ${AGE}          17.05.1999
Type in leg
    Click Element     ${LEG}
Select leg
    Click Element    ${LEFT_LEG}
Type in club
    Input Text    ${CLUB}       Manchester
Type in position
    Input Text    ${POSITION}   Goalkeeper
Type in district
    Click Element    ${DISTRICT}
Select district
    Click Element    ${CHOSEN_DISTRICT}
Type in achievements
    Input Text    ${ACHIEVEMENTS}   None
Type in language
    Click Element    ${ADD_LANGUAGE}
    Input Text      ${ENTER_LANGUAGE}       Polish
Click Submit Button
    Click Element    ${SUBMIT}