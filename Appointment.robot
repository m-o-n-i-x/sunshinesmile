*** Settings ***
Resource    keywords.robot
Resource    keywords_backend.robot
Suite teardown    Close browser


*** Test Cases ***

Precondition
    [tags]    de    ch    uk    at
    Open SSS website

User makes an appointment
    [tags]    de    ch    uk    at
    Set global variable    ${first}    qa
    Set global variable    ${last}    test
    Choose location
    BuiltIn.run keyword if    '${country}' == 'de'    Choose Berlin location
    BuiltIn.run keyword if    '${country}' == 'uk'    Choose London location
    BuiltIn.run keyword if    '${country}' == 'ch'    Choose Bern location
    BuiltIn.run keyword if    '${country}' == 'at'    Choose Wien location
    Choose random available time
    Run keyword unless    '${country}' == 'uk'    Remember appointment time
    Run keyword if    '${country}' == 'uk'    Remember appointment time UK
    Fill appointment form
    Book appointment
    Verify appointment success

Verify original appointment not available
    [tags]    de    ch    uk    at
    Go to website
    Choose location
    BuiltIn.run keyword if    '${country}' == 'de'    Choose Berlin location
    BuiltIn.run keyword if    '${country}' == 'uk'    Choose London location
    BuiltIn.run keyword if    '${country}' == 'ch'    Choose Bern location
    BuiltIn.run keyword if    '${country}' == 'at'    Choose Wien location
    Verify original time slot not available

Verify appointment in backend
    [tags]    de    ch    uk    at
    Go to back-end admin
    Log in to back-end admin
    Choose Appointment from main navigation
    Search for appointment
    Enter details of chosen appointment
    Change appointment

User reschedules appointment
    [tags]    de    ch    uk    at
    SeleniumLibrary.Select Window    url=${appointment_url}
    Verify original appointment
    Reschedule appointment from interface
    Choose random available time
    Book rescheduled appointment
    Verify appointment success

User cancels appointment
    [tags]    de    ch    uk    at
    SeleniumLibrary.Go To    url=${appointment_url}
    Cancel appointment from interface
    Verify appointment cancelled

Verify cancelled appointment available
    [tags]    de    ch    uk    at
    Go to website
    Choose location
    BuiltIn.run keyword if    '${country}' == 'de'    Choose Berlin location
    BuiltIn.run keyword if    '${country}' == 'uk'    Choose London location
    BuiltIn.run keyword if    '${country}' == 'ch'    Choose Bern location
    BuiltIn.run keyword if    '${country}' == 'at'    Choose Wien location
    Verify cancelled time slot available
