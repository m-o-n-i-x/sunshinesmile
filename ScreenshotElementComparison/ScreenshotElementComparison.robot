*** Settings ***
Resource        keywords.robot
Suite teardown    Close All Browsers

*** Test Cases ***

Precondition
    [tags]    de    at    ch    uk
    Open SSS website

Create 3Shape Screenshot
    [tags]    de    at    ch    uk
    Go to back-end admin
    Log in to back-end admin
    Search for 3Shape customer
    Open SSS website
    Open login page
    SeleniumLibrary.Input text    name=email-login    ${email}
    SeleniumLibrary.Input text    name=password-login    Sunshine123#
    Login
    Make Desktop 3Shape TopNavigation Test Screenshot
    Make Desktop 3Shape LeftNavigation Test Screenshot
    Make Desktop 3Shape RightNavigation Test Screenshot
    Make Desktop 3Shape BottomNavigation Test Screenshot
    Make Desktop 3Shape CenterNavigation Test Screenshot

    Make Mobile 3Shape TopNavigation Test Screenshot
    Make Mobile 3Shape LeftNavigation Test Screenshot
    Make Mobile 3Shape RightNavigation Test Screenshot
    Make Mobile 3Shape BottomNavigation Test Screenshot
    Make Mobile 3Shape CenterNavigation Test Screenshot

Create Onyceph Screenshot Pattern
    [tags]    de    at    ch    uk
    Go to back-end admin
    Log in to back-end admin
    Search for Onyceph customer
    Open SSS website
    Open login page
    SeleniumLibrary.Input text    name=email-login    ${email}
    SeleniumLibrary.Input text    name=password-login    Sunshine123#
    Login
    Make Desktop Onyceph TopNavigation Test Screenshot
    Make Desktop Onyceph LeftNavigation Test Screenshot
    Make Desktop Onyceph RightNavigation Test Screenshot
    Make Desktop Onyceph BottomNavigation Test Screenshot
    Make Desktop Onyceph CenterNavigation Test Screenshot

    Make Mobile Onyceph TopNavigation Test Screenshot
    Make Mobile Onyceph LeftNavigation Test Screenshot
    Make Mobile Onyceph RightNavigation Test Screenshot
    Make Mobile Onyceph BottomNavigation Test Screenshot
    Make Mobile Onyceph CenterNavigation Test Screenshot

3Shape Screenshot Comparison
    [tags]    de    at    ch    uk
    Desktop 3Shape TopNavigation Comparison
    Desktop 3Shape LeftNavigation Comparison
    Desktop 3Shape RightNavigation Comparison
    Desktop 3Shape BottomNavigation Comparison
    Desktop 3Shape CenterNavigation Comparison

    Mobile 3Shape TopNavigation Comparison
    Mobile 3Shape LeftNavigation Comparison
    Mobile 3Shape RightNavigation Comparison
    Mobile 3Shape BottomNavigation Comparison
    Mobile 3Shape CenterNavigation Comparison

Onyceph Screenshot Comparison
    [tags]    de    at    ch    uk
    Desktop Onyceph TopNavigation Comparison
    Desktop Onyceph LeftNavigation Comparison
    Desktop Onyceph RightNavigation Comparison
    Desktop Onyceph BottomNavigation Comparison
    Desktop Onyceph CenterNavigation Comparison

    Mobile Onyceph TopNavigation Comparison
    Mobile Onyceph LeftNavigation Comparison
    Mobile Onyceph RightNavigation Comparison
    Mobile Onyceph BottomNavigation Comparison
    Mobile Onyceph CenterNavigation Comparison