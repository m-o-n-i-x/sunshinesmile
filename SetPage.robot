*** Settings ***
Resource    keywords.robot
Suite teardown    Close All Browsers


*** Test Cases ***

Precondition
    [tags]    de    at
    Open SSS website

Verify mandatory fields for set ordering
    [tags]    de    at
    Go to set url
	  Order set
    Proceed to payment methods
    Verify mandatory fields error messages
