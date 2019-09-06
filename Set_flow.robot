*** Settings ***
Resource    keywords.robot
Resource    keywords_backend.robot
Suite teardown    Close browser


*** Test Cases ***

Precondition
    [Documentation]    Browser is opened only once for whole suite to9 reduce execution time
    [tags]    de
    Open SSS website

User orders set
    [tags]    de
    Go to set url
	  Order set
	  Fill delivery address form
	  Proceed to payment methods
	  Choose Lastschrift radio button
	  Insert Lastschrift data
    Proceed to set overview
    Accept Set checkboxes
    Proceed set order success
    Verify set order success

Back end process for set order
    [tags]    de
    Go to back-end admin
    Log in to back-end admin
    Choose Sets from main navigation
    Choose set order for given user
    Click view link in process overview section
    Beam order to 'Ready for physician assignment' state
    Assign physician
    Choose physician
    Choose SunshineSmile supplier
    Physician assigned
    No pre treatment needed
    Setup done
    Click done
    Set suite variable    ${lower_jaw}    5
    Set suite variable    ${upper_jaw}    10
    Insert treatment duration
    Insert number of aligner lower jaw
    Insert number of aligner upper jaw
    Plan done
    Click done
    Choose Sets from main navigation
    Choose set order for given user
    Click view link in process overview section
    Beam order to 'Treatment plan ok for physician' state
    Create treatment quotation
    Choose valid until date
    Insert treatment link
    Rate pay allowed
    Allow customer to purchase
    Treatment quotation created
    Go to customer overview
    Remember customer id

User creates account
    [tags]    de
    ${email}    String.Replace string    ${email}    +    %2B
    BuiltIn.Set test variable    ${email}
    Go to account creation page
    Set account password
    Set account repeat password
    Create account
    User redirected to treatment plan after log in

#User buys treatment
    #[tags]    de
    #Buy now
