*** Settings ***
Resource    keywords.robot
Resource    keywords_backend.robot
Library         DebugLibrary
Suite teardown    Close browser


*** Test Cases ***

Precondition
    [tags]    de    ch    uk    at
    Open SSS website

User creates profile
    [tags]    de    ch    uk    at
    Create customer
    Click on logout link

User logs in
    [tags]    de    ch    uk    at
    Open login page
    Fill in login form
    Login
    Verify Login success

User logs out
    [tags]    de    ch    uk    at
    Click on logout link
