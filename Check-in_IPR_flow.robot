*** Settings ***
Resource    keywords.robot
Suite teardown    Close All Browsers


*** Test Cases ***

Precondition
    [tags]    de
    Open SSS website

User makes an appointment
    [tags]    de
    Set global variable    ${first}    ipr
    Set global variable    ${last}    light
    Choose location
    Choose Berlin location
    Choose random available time
    Remember appointment time
    Fill appointment form
    Book appointment

IPR light
    [tags]    de
    Go to back-end admin
    Log in to back-end admin
    Choose Check-in from main navigation
    Choose order for given user
    Click view link in process overview section
    Beam order to 'Check id' state
    Check id
    Insert date if birth
    Insert valid address
    Id checked
    Click Clinic Check-In link
    Beam order to 'check in complete' state
    Choose Clinic 3D-Scan from main navigation
    Choose order for given user
    Click view link in process overview section
    Medical check
    Tick IPR possible checkbox
    Choose pretreatment reason
    Pretreatment needed
    Click done
    Click Clinic 3D-Scan in process overview section
    Beam order to 'ipr clearing up' state
    Ipr clearing up
    Ipr wanted
    Setup done
    Choose Clinic 3D-Scan from main navigation
    Choose order for given user
    Click view link in process overview section
    Beam order to 'Shop scan process started' state
    Choose Shop Scan from main navigation
    Choose order for given user
    Click view link in process overview section
    Beam order to 'Ready for physician assignment' state
    Assign physician
    Choose SunshineSmile supplier
    Physician assigned
    Click done
    Set suite variable    ${lower_jaw}    4
    Set suite variable    ${upper_jaw}    10
    Insert treatment duration
    Insert number of aligner lower jaw
    Insert number of aligner upper jaw
    Fill IPR instructions
    Plan done
    Click done
    Click ok
    Choose valid until date
    Insert treatment link
    Allow customer to purchase
    Rate pay allowed
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
