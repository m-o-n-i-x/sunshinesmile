*** Settings ***
Resource    keywords.robot
Suite teardown    Close All Browsers


*** Test Cases ***

Precondition
    [tags]    de    ch    uk    at    es
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
    Verify appointment success

Verify original appointment not available
    [tags]    de    ch    uk    at    es
    Go to website
    Choose location
    BuiltIn.run keyword if    '${country}' == 'de'    Choose Berlin location
    BuiltIn.run keyword if    '${country}' == 'uk'    Choose London location
    BuiltIn.run keyword if    '${country}' == 'ch'    Choose Bern location
    BuiltIn.run keyword if    '${country}' == 'at'    Choose Wien location
    BuiltIn.run keyword if    '${country}' == 'es'    Choose Madrid1 location
    Verify original time slot not available

Verify appointment in backend
    [tags]    de    ch    uk    at    es
    Go to back-end admin
    Log in to back-end admin
    Choose Appointment from main navigation
    Search for appointment
    Enter details of chosen appointment
    Change appointment

User reschedules appointment
    [tags]    de    ch    uk    at    es
    SeleniumLibrary.Select Window    url=${appointment_url}
    Run keyword if    '${country}' == 'uk'    Close cookie consent
    Run keyword unless    '${country}' == 'es'    Verify original appointment
    Reschedule appointment from interface
    Choose random available time
    Book rescheduled appointment
    Verify appointment success

User cancels appointment
    [tags]    de    ch    uk    at    es
    SeleniumLibrary.Go To    url=${appointment_url}
    Cancel appointment from interface
    Verify appointment cancelled

Verify cancelled appointment available
    [tags]    de    ch    uk    at    es
    Go to website
    Choose location
    BuiltIn.run keyword if    '${country}' == 'de'    Choose Berlin location
    BuiltIn.run keyword if    '${country}' == 'uk'    Choose London location
    BuiltIn.run keyword if    '${country}' == 'ch'    Choose Bern location
    BuiltIn.run keyword if    '${country}' == 'at'    Choose Wien location
    BuiltIn.run keyword if    '${country}' == 'es'    Choose Madrid1 location
    Verify cancelled time slot available
