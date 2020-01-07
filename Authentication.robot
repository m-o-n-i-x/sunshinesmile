*** Settings ***
Resource    keywords.robot
Suite teardown    Close All Browsers


*** Test Cases ***

Precondition
    [tags]    de    at    ch    uk    es
    Open SSS website

User makes an appointment
    [tags]    de    ch    uk    at    es
    Set global variable    ${first}    qa
    Set global variable    ${last}    test
    Choose location
    BuiltIn.run keyword if    '${country}' == 'de'    Choose Berlin location
    BuiltIn.run keyword if    '${country}' == 'uk'    Choose London location
    BuiltIn.run keyword if    '${country}' == 'ch'    Choose Bern location
    BuiltIn.run keyword if    '${country}' == 'at'    Choose Wien location
    BuiltIn.run keyword if    '${country}' == 'es'    Choose Madrid1 location
    Sleep    5s
    Choose random available time
    Run keyword if    '${country}' == 'de' or '${country}' == 'at' or '${country}' == 'ch'    Remember appointment time
    Run keyword if    '${country}' == 'uk'    Remember appointment time UK
    Run keyword if    '${country}' == 'es'    Remember appointment time ES
    Fill appointment form
    Book appointment

SSS order
    [tags]    de    ch    uk    at    es
    Go to back-end admin
    Log in to back-end admin
    Choose customer from main navigation
    Choose order for given user
    Remember customer id

User creates account
    [tags]    de    ch    uk    at    es
    ${email}    String.Replace string    ${email}    +    %2B
    BuiltIn.Set test variable    ${email}
    Go to account creation page
    Set account password
    Set account repeat password
    Create account
    Verify user logged in

User logs out
    [tags]    de    ch    uk    at    es
    Click on logout link
    Verify user logged off

User logs in
    [tags]    de    ch    uk    at    es
    Open login page
    Fill in login form
    Login
    Verify user logged in
