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
    Set global variable    ${first}    sss
    Set global variable    ${last}    light
    Choose location
    BuiltIn.run keyword if    '${country}' == 'de'    Choose Berlin location
    BuiltIn.run keyword if    '${country}' == 'uk'    Choose London location
    BuiltIn.run keyword if    '${country}' == 'ch'    Choose Bern location
    Choose random available time
    Remember appointment time
    Fill appointment form
    Book appointment

SSS light
    [tags]    de    ch    uk
    Go to back-end admin
    Log in to back-end admin
    Choose Check-in from main navigation
    Choose order for given user
    Click view link in process overview section
    Run keyword if    '${country}' == 'de'    Beam order to 'Check id' state
    Run keyword if    '${country}' == 'de'    Check id
    Run keyword if    '${country}' == 'de'    Insert date if birth
    Run keyword if    '${country}' == 'de'    Insert valid address
    Run keyword if    '${country}' == 'de'    Id checked
    Run keyword if    '${country}' == 'de'    Click Clinic Check-In link
    Beam order to 'check in complete' state
    Run keyword if    '${country}' == 'ch'    Choose customer from main navigation
    Run keyword if    '${country}' == 'ch'    Choose order for given user
    Run keyword if    '${country}' == 'ch'    Insert date if birth
    Run keyword if    '${country}' == 'ch'    Insert valid address             
    Choose Clinic 3D-Scan from main navigation
    Choose order for given user
    Click view link in process overview section
    Beam order to 'Provide treatment setup' state
    Beam order to 'Shop scan process started' state
    Choose Shop Scan from main navigation
    Choose order for given user
    Click view link in process overview section
    Beam order to 'Ready for physician assignment' state
    Assign physician
    Choose physician
    Choose SunshineSmile supplier
    Physician assigned
    Choose Shop Scan from main navigation
    Choose order for given user
    Click view link in process overview section
    Beam order to 'Create treatment plan' state
    Create treatment plan
    Set suite variable    ${lower_jaw}    4
    Set suite variable    ${upper_jaw}    10
    Insert treatment duration
    Insert number of aligner lower jaw
    Insert number of aligner upper jaw
    Plan done
    Click done
    Choose Shop Scan from main navigation
    Choose order for given user
    Click view link in process overview section
    Beam to 'Treatment plan ok for physician' state
    Create treatment quotation
    Choose valid until date
    Insert treatment link
    Rate pay allowed
    Allow customer to purchase
    Treatment quotation created
    Choose customer from main navigation
    Choose order for given user
    Remember customer id

User creates account
    [tags]    de    ch    uk
    ${email}    String.Replace string    ${email}    +    %2B
    BuiltIn.Set test variable    ${email}
    Go to account creation page
    Set account password
    Set account repeat password
    Create account
    User redirected to treatment plan after log in

User purchases treatment plan
    [tags]    de    ch    uk
    Proceed with checkout
    Proceed with checkout
    Choose one time payment
    Proceed with checkout
    Choose CC radio button
    Insert CC name
    Insert valid CC number
    Proceed to order overview
    Accept agreement checkboxes
    Purchase treatment
    Verify treatment purchase success
