*** Settings ***
Resource    keywords.robot
Resource    keywords_backend.robot
Library         DebugLibrary
Suite teardown    Close browser


*** Test Cases ***

Precondition
    [tags]    de    ch    uk
    Open SSS website

User creates profile
    [tags]    de    ch    uk
    Create customer
    

User logs in
    [tags]    de    ch    uk
    Open login page
    Fill in login form
    Login
    Verify Login success

User logs out
    [tags]    de    ch    uk
    Click on logout link