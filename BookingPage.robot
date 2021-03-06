*** Settings ***
Resource    keywords.robot
Suite teardown    Close All Browsers


*** Test Cases ***

Precondition
    [tags]    de    ch    uk    at
    Open SSS website

Google maps displayed
    [tags]    de    ch    uk    at
    Set global variable    ${first}    qa
    Set global variable    ${last}    test
    Choose location
    BuiltIn.run keyword if    '${country}' == 'de'    Choose Berlin location
    BuiltIn.run keyword if    '${country}' == 'uk'    Choose London location
    BuiltIn.run keyword if    '${country}' == 'ch'    Choose Bern location
    BuiltIn.run keyword if    '${country}' == 'at'    Choose Wien location
    Verify google maps shown

Move to next week of appointments
    [tags]    de    ch    uk    at
    Remember current week
    Move to next week
    Next week pattern
    Remember current week
    Verify movement to next week

Booking form filled
    [tags]    de
    Go to website
    Choose location
    Add filled form parameter to location url
    Choose random available time
    Verify form prefilled with customer data

Postal code as parameter
    [tags]    de
    Go to website
    BuiltIn.Set suite variable    ${zipcode}    44135
    Add zipCode parameter to location url
    Verify Dortmund location
    Go to website
    BuiltIn.Set suite variable    ${zipcode}    11111
    Add zipCode parameter to location url
    Verify all locations shown
