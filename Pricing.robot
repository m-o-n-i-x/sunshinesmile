*** Settings ***
Resource    keywords.robot
Suite teardown    Close All Browsers


*** Test Cases ***

User makes an appointment
    [tags]    de    ch    uk
    Set global variable    ${first}    sss
    Set global variable    ${last}    light
    Open SSS website
    Choose location
    BuiltIn.run keyword if    '${country}' == 'de'    Choose Berlin location
    BuiltIn.run keyword if    '${country}' == 'uk'    Choose London location
    BuiltIn.run keyword if    '${country}' == 'ch'    Choose Bern location
    Choose random available time
    Run keyword unless    '${country}' == 'uk'    Remember appointment time
    Run keyword if    '${country}' == 'uk'    Remember appointment time UK
    Fill appointment form
    Book appointment

SSS light
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
    Treatment quotation created intermediate
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
    SeleniumLibrary.Go to    ${site_url}
    ${email}    String.Replace string    ${email}    +    %2B
    BuiltIn.Set test variable    ${email}
    Go to account creation page
    Set account password
    Set account repeat password
    Create account
    User redirected to treatment plan after log in
    Close browser

User makes an appointment 2
    [tags]    de    ch    uk
    Open SSS website
    Set global variable    ${first}    sss
    Set global variable    ${last}    medium
    Choose location
    BuiltIn.run keyword if    '${country}' == 'de'    Choose Berlin location
    BuiltIn.run keyword if    '${country}' == 'uk'    Choose London location
    BuiltIn.run keyword if    '${country}' == 'ch'    Choose Bern location
    Choose random available time
    Run keyword unless    '${country}' == 'uk'    Remember appointment time
    Run keyword if    '${country}' == 'uk'    Remember appointment time UK
    Fill appointment form
    Book appointment

SSS medium
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
    Set suite variable    ${lower_jaw}    5
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
    Treatment quotation created intermediate
    Insert treatment link
    Allow customer to purchase
    Rate pay allowed
    Treatment quotation created
    Choose customer from main navigation
    Choose order for given user
    Remember customer id
    Verify treatment link saved

User creates account 2
    [tags]    de    ch    uk    at
    SeleniumLibrary.Go to    ${site_url}
    ${email}    String.Replace string    ${email}    +    %2B
    BuiltIn.Set test variable    ${email}
    Go to account creation page
    Set account password
    Set account repeat password
    Create account
    User redirected to treatment plan after log in
    Close browser

User makes an appointment 3
    [tags]    de    ch    uk
    Open SSS website
    Set global variable    ${first}    sss
    Set global variable    ${last}    complex
    Choose location
    BuiltIn.run keyword if    '${country}' == 'de'    Choose Berlin location
    BuiltIn.run keyword if    '${country}' == 'uk'    Choose London location
    BuiltIn.run keyword if    '${country}' == 'ch'    Choose Bern location
    Choose random available time
    Run keyword unless    '${country}' == 'uk'    Remember appointment time
    Run keyword if    '${country}' == 'uk'    Remember appointment time UK
    Fill appointment form
    Book appointment

SSS complex
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
    Set suite variable    ${lower_jaw}    13
    Set suite variable    ${upper_jaw}    20
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
    Treatment quotation created intermediate
    Insert treatment link
    Allow customer to purchase
    Rate pay allowed
    Treatment quotation created
    Choose customer from main navigation
    Choose order for given user
    Remember customer id
    Verify treatment link saved

User creates account 3
    [tags]    de    ch    uk    at
    SeleniumLibrary.Go to    ${site_url}
    ${email}    String.Replace string    ${email}    +    %2B
    BuiltIn.Set test variable    ${email}
    Go to account creation page
    Set account password
    Set account repeat password
    Create account
    User redirected to treatment plan after log in
    Close Browser

User makes an appointment 4
    [tags]    de    ch    uk
    Open SSS website
    Set global variable    ${first}    hat
    Set global variable    ${last}    light
    Choose location
    BuiltIn.run keyword if    '${country}' == 'de'    Choose Berlin location
    BuiltIn.run keyword if    '${country}' == 'uk'    Choose London location
    BuiltIn.run keyword if    '${country}' == 'ch'    Choose Bern location
    Choose random available time
    Run keyword unless    '${country}' == 'uk'    Remember appointment time
    Run keyword if    '${country}' == 'uk'    Remember appointment time UK
    Fill appointment form
    Book appointment

HAT light
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
    Choose HAT supplier
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
    Treatment quotation created intermediate
    Insert treatment link
    Allow customer to purchase
    Rate pay allowed
    Treatment quotation created
    Choose customer from main navigation
    Choose order for given user
    Remember customer id
    Verify treatment link saved

User creates account 4
    [tags]    de    ch    uk    at
    SeleniumLibrary.Go to    ${site_url}
    ${email}    String.Replace string    ${email}    +    %2B
    BuiltIn.Set test variable    ${email}
    Go to account creation page
    Set account password
    Set account repeat password
    Create account
    User redirected to treatment plan after log in
    Close browser

User makes an appointment 5
    [tags]    de    ch    uk
    Open SSS website
    Set global variable    ${first}    hat
    Set global variable    ${last}    medium
    Choose location
    BuiltIn.run keyword if    '${country}' == 'de'    Choose Berlin location
    BuiltIn.run keyword if    '${country}' == 'uk'    Choose London location
    BuiltIn.run keyword if    '${country}' == 'ch'    Choose Bern location
    Choose random available time
    Run keyword unless    '${country}' == 'uk'    Remember appointment time
    Run keyword if    '${country}' == 'uk'    Remember appointment time UK
    Fill appointment form
    Book appointment

HAT medium
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
    Choose HAT supplier
    Physician assigned
    Choose Shop Scan from main navigation
    Choose order for given user
    Click view link in process overview section
    Beam order to 'Create treatment plan' state
    Create treatment plan
    Set suite variable    ${lower_jaw}    5
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
    Treatment quotation created intermediate
    Insert treatment link
    Allow customer to purchase
    Rate pay allowed
    Treatment quotation created
    Choose customer from main navigation
    Choose order for given user
    Remember customer id
    Verify treatment link saved

User creates account 5
    [tags]    de    ch    uk    at
    SeleniumLibrary.Go to    ${site_url}
    ${email}    String.Replace string    ${email}    +    %2B
    BuiltIn.Set test variable    ${email}
    Go to account creation page
    Set account password
    Set account repeat password
    Create account
    User redirected to treatment plan after log in
    Close browser

User makes an appointment 6
    [tags]    de    ch    uk
    Open SSS website
    Set global variable    ${first}    hat
    Set global variable    ${last}    complex
    Choose location
    BuiltIn.run keyword if    '${country}' == 'de'    Choose Berlin location
    BuiltIn.run keyword if    '${country}' == 'uk'    Choose London location
    BuiltIn.run keyword if    '${country}' == 'ch'    Choose Bern location
    Choose random available time
    Run keyword unless    '${country}' == 'uk'    Remember appointment time
    Run keyword if    '${country}' == 'uk'    Remember appointment time UK
    Fill appointment form
    Book appointment

HAT complex
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
    Choose HAT supplier
    Physician assigned
    Choose Shop Scan from main navigation
    Choose order for given user
    Click view link in process overview section
    Beam order to 'Create treatment plan' state
    Create treatment plan
    Set suite variable    ${lower_jaw}    13
    Set suite variable    ${upper_jaw}    20
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
    Treatment quotation created intermediate
    Insert treatment link
    Allow customer to purchase
    Rate pay allowed
    Treatment quotation created
    Choose customer from main navigation
    Choose order for given user
    Remember customer id
    Verify treatment link saved

User creates account 6
    [tags]    de    ch    uk    at
    SeleniumLibrary.Go to    ${site_url}
    ${email}    String.Replace string    ${email}    +    %2B
    BuiltIn.Set test variable    ${email}
    Go to account creation page
    Set account password
    Set account repeat password
    Create account
    User redirected to treatment plan after log in
