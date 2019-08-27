*** Settings ***
Resource    keywords.robot
Resource    keywords_backend.robot
#Suite teardown    Close browser


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
    #No pre treatment needed
    #Setup done
    Click set link
    Beam order to 'Treatment plan ok for physician' state
    Fill in Treatment Quotation form
    Treatment quotation created
    Go to customer overview
    Remember customer id

User creates account
    [tags]    de
    ${email}    String.Replace string    ${email}    +    %2B
    BuiltIn.Set test variable    ${email}
    Go to account creation page
    Set account password
    Create account
    User redirected to treatment plan after log in

#User buys treatment
    #[tags]    de
    #Buy now
