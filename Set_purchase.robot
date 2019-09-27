*** Settings ***
Resource    keywords.robot
Suite teardown    Close All Browsers


*** Test Cases ***

Precondition
    [Documentation]    Browser is opened only once for whole suite to9 reduce execution time
    [tags]    de
    Open SSS website

Set with Lastschrift
    [tags]    de
    Go to set url
	  Order set
    Generate random email
	  Fill set address form
	  Proceed to payment methods
	  Choose Lastschrift radio button
	  Insert Lastschrift data
    Proceed to set overview Lastchrift
    Accept Set checkboxes
    Proceed set order success
    Verify set order success

Set with Lastschrift and discount
    [tags]    de
    Go to set url
    Set global variable    ${voucher_code}    test
    Apply voucher
    Verify set voucher applied
    Order set
    Generate random email
    Fill set address form
    Proceed to payment methods
    Choose Lastschrift radio button
    Insert Lastschrift data
    Proceed to set overview Lastchrift
    Verify set price on order overview page
    Accept Set checkboxes
    Proceed set order success
    Verify set order success

Set with CC
    [tags]    de
    Delete all cookies
    Go to set url
    Order set
    Generate random email
    Fill set address form
    Proceed to payment methods
    Choose CC radio button
    Insert CC name
    Insert valid CC number
    Proceed to order overview
    Accept Set checkboxes
    Proceed set order success
    Verify set order success

Set with CC payment and discount
    [tags]    de
    SeleniumLibrary.Delete all cookies
    Go to set url
    Set global variable    ${voucher_code}    test
    Apply voucher
    Verify set voucher applied
    Order set
    Generate random email
    Fill set address form
    Proceed to payment methods
    Choose CC radio button
    Insert CC name
    Insert valid CC number
    Proceed to order overview
    Verify set price on order overview page
    Accept Set checkboxes
    Proceed set order success
    Verify set order success
