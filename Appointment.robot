*** Settings ***
Resource    keywords.robot
Resource    keywords_backend.robot
Suite teardown    Close browser


*** Test Cases ***

Precondition
    [tags]    de    ch    uk
    Open SSS website

User makes an appointment
    [tags]    de    ch    uk
    Choose location
    BuiltIn.run keyword if    '${country}' == 'de'    Choose Berlin location
    BuiltIn.run keyword if    '${country}' == 'uk'    Choose London location
    Choose random available time
    Remember appointment time
    Fill appointment form
    Book appointment

Verify appointment in backend
    [tags]    de    ch    uk
    Go to back-end admin
    Log in to back-end admin
    Choose Appointment from main navigation
    Search for appointment
    Enter details of chosen appointment
    Change appointment

User reschedules appointment
    [tags]    de    ch    uk
    SeleniumLibrary.Select Window    url=${appointment_url}
    Verify original appointment
    SeleniumLibrary.Close Window

User cancels appointment
    [tags]    de    ch    uk
