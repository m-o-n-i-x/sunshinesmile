*** Settings ***
Resource    keywords.robot
Resource    keywords_backend.robot
Suite teardown    Close All Browsers


*** Test Cases ***

Precondition
    [tags]    de    ch    uk    at
    Open SSS website

Locations ordered alphabetically
    [tags]    de    ch    uk    at
    Choose location
    Get available locations
    Verify locations ordered alphabetically
