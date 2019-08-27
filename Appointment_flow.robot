*** Settings ***
Resource    keywords.robot
Resource    keywords_backend.robot
#Suite teardown    Close browser


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
    Fill appointment form
    Book appointment

User cancels appointment
    [tags]    de    ch    uk
