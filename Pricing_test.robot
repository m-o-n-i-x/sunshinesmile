*** Settings ***
Resource    keywords.robot
Resource    keywords_backend.robot
Suite teardown    Close browser


*** Test Cases ***

Precondition
    [tags]    de    ch    uk
    Open SSS website

SSS light
    [tags]    de    ch    uk
    Go to    https://admin.sunshine-test-env.de/task/detail/e446b601346-446e-add2-48f9b777fda6
    Log in to back-end admin
    Sleep    5s
    Verify light package set
    Verify light package price
