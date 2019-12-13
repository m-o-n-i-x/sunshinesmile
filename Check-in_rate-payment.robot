*** Settings ***
Resource    keywords.robot
Suite teardown    Close All Browsers


*** Test Cases ***

Precondition
    [tags]    de    ch    uk    at
    Open SSS website

User makes an appointment
    [tags]    de    ch    uk    at
    Set global variable    ${first}    sss
    Set global variable    ${last}    ${country}
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

SSS order
    [tags]    de    ch    uk    at
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
    Run keyword unless    '${country}' == 'de'    Choose customer from main navigation
    Run keyword unless    '${country}' == 'de'    Choose order for given user
    Run keyword unless    '${country}' == 'de'    Insert date if birth
    Run keyword unless    '${country}' == 'de'    Insert valid address
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
    Allow customer to purchase
    Rate pay allowed
    Treatment quotation created
    Choose customer from main navigation
    Choose order for given user
    Remember customer id
    Verify treatment link saved

User creates account
    [tags]    de    ch    uk    at
    ${email}    String.Replace string    ${email}    +    %2B
    BuiltIn.Set test variable    ${email}
    Go to account creation page
    Set account password
    Set account repeat password
    Create account
    User redirected to treatment plan after log in

User purchases treatment plan
    [tags]    de    ch    uk    at
    Proceed with checkout
    Verify voucher code page shown
    Proceed with checkout
    Verify payment rate or one time shown
    Choose random rate option
    Remember chosen rate option
    Proceed with checkout
    Verify treatment overview page shown
    Remember rate details in checkout overview
    Verify rate details in checkout overview
    Accept agreement checkboxes
    Check agreement zab
    Purchase treatment rate payment
    Verify treatment purchase success

User purchases retainer
    [tags]    de    ch    at
    Return to home page
    Purchase retainer
    Verify retainer voucher code page shown
    Proceed to retainer payment
    Verify retainer payment page shown
    Choose CC radio button
    Insert CC name
    Insert valid CC number
    Proceed to order overview
    Verify retainer overview page shown
    Accept retainer checkboxes
    Buy retainer
    Verify retainer purchase success
