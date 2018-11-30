*** Settings ***
Documentation  kkkkkk
Library  Selenium2Library
*** Variables ***
${SERVER}              172.27.242.50:8080
${BROWSER}             Chrome
${DELAY}               0
${VALID USER}          13606067800
${LOGINPAGE TITLE}	CDN 运营门户
${LOGIN URL}           http://${SERVER}/login
${WELCOME URL}         http://${SERVER}/loginSuccess
${CREATE_DOMAIN_URL}   http://${SERVER}/selfService/domain/ticket/create


*** Keywords ***
Login Page Should Be Open
    Title Should Be    ${LOGINPAGE TITLE}

Open Browser To Login Page
    Open Browser    ${LOGIN URL}     ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Submit Credentials
    Click Button    普通登录

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    CDN

Login Portal
    Open Browser To Login Page
    Input Text  username  ${VALID USER}
    Submit Credentials

Open Browser To Create Domain Page
    Login Portal
    sleep  10s
    Go To  http://172.27.242.50:8080/loginSuccess
    Go To  http://172.27.242.50:8080/appleDashboard/index
    Go To  http://172.27.242.50:8080/selfService/domain/index.html?productType=0
#    Go To  http://172.27.242.50:8080/selfService/domain/ticket/create


*** Test Cases ***
#测试
#   Login Page Should Be Open

*** Test Case ***
#Login Case
#    Open Browser To Login Page
#    Input Text  username  ${VALID USER}
#    Submit Credentials
#    Sleep    3s
#    Close Browser

Create Domain Case
    Open Browser To Create Domain Page
