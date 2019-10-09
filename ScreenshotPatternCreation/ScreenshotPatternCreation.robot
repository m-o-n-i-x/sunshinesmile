*** Settings ***
Resource        keywords.robot
Suite teardown    Close All Browsers

*** Test Cases ***

Precondition
    [tags]    de    at    ch    uk
    Open SSS website

Create 3Shape Screenshot Pattern
    [tags]    de    at    ch    uk
    Go to back-end admin
    Log in to back-end admin
    Search for 3Shape customer
    Open SSS website
    Open login page
    SeleniumLibrary.Input text    name=email-login    ${email}
    SeleniumLibrary.Input text    name=password-login    ${qa_backend_password}
    Login
    Make Desktop 3Shape TopNavigation Reference Screenshot
    Make Desktop 3Shape LeftNavigation Reference Screenshot
    Make Desktop 3Shape RightNavigation Reference Screenshot
    Make Desktop 3Shape BottomNavigation Reference Screenshot
    Make Desktop 3Shape CenterNavigation Reference Screenshot

    Make Mobile 3Shape TopNavigation Reference Screenshot
    Make Mobile 3Shape LeftNavigation Reference Screenshot
    Make Mobile 3Shape RightNavigation Reference Screenshot
    Make Mobile 3Shape BottomNavigation Reference Screenshot
    Make Mobile 3Shape CenterNavigation Reference Screenshot

Create Onyceph Screenshot Pattern
    [tags]    de    at    ch    uk
    Go to back-end admin
    Log in to back-end admin
    Search for Onyceph customer
    Open SSS website
    Open login page
    SeleniumLibrary.Input text    name=email-login    ${email}
    SeleniumLibrary.Input text    name=password-login    ${qa_backend_password}
    Login
    Make Desktop Onyceph TopNavigation Reference Screenshot
    Make Desktop Onyceph LeftNavigation Reference Screenshot
    Make Desktop Onyceph RightNavigation Reference Screenshot
    Make Desktop Onyceph BottomNavigation Reference Screenshot
    Make Desktop Onyceph CenterNavigation Reference Screenshot

    Make Mobile Onyceph TopNavigation Reference Screenshot
    Make Mobile Onyceph LeftNavigation Reference Screenshot
    Make Mobile Onyceph RightNavigation Reference Screenshot
    Make Mobile Onyceph BottomNavigation Reference Screenshot
    Make Mobile Onyceph CenterNavigation Reference Screenshot