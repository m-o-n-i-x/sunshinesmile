*** Settings ***
Resource    keywords_footer.robot
Suite teardown    Close All Browsers


*** Test Cases ***

Precondition
    [tags]    de    ch    uk    at
    Open SSS website

Validate footer links
    [tags]    de    ch    uk    at
    Verify Our aligners section
    Verify PlusDental section
