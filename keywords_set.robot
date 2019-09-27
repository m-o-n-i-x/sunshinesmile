*** Settings ***
Resource    Variables.txt
Resource    keywords.robot


**Keywords**

Go to set url
    Go to    ${site_url}/set#voucher_code

Order set
    SeleniumLibrary.Click element    xpath=//button[@type="button"]
    SeleniumLibrary.Wait until element is visible    xpath=//input[@data-testid="address-input-first-name"]

Fill set address form
    Insert set first name
    Insert set last name
    Insert set street
    Insert set house number
    Insert set postal code
    Insert set city
    Insert set birthday
    Insert set email
    Insert set phone
    Accept set Terms&Conditions

Insert set first name
    SeleniumLibrary.Input text    xpath=//input[@data-testid="address-input-first-name"]    qa

Insert set last name
    SeleniumLibrary.Input text    xpath=//input[@data-testid="address-input-last-name"]    set

Insert set street
    SeleniumLibrary.Input text    xpath=//input[@data-testid="address-input-street"]    Teststr. 1

Insert set house number
    SeleniumLibrary.Input text    xpath=//input[@data-testid="address-input-house-number"]    20

Insert set postal code
    SeleniumLibrary.Input text    xpath=//input[@data-testid="address-input-zip"]    10589

Insert set city
    SeleniumLibrary.Input text    xpath=//input[@data-testid="address-input-city"]    Berlin

Insert set birthday
    SeleniumLibrary.Click element   xpath=//select[@data-testid="set-checkout-customer-detail-birthday-day"]
    SeleniumLibrary.Select from list by value    xpath=//select[@data-testid="set-checkout-customer-detail-birthday-day"]    1
    SeleniumLibrary.Click element    xpath=//select[@data-testid="set-checkout-customer-detail-birthday-month"]
    SeleniumLibrary.Select from list by value    xpath=//select[@data-testid="set-checkout-customer-detail-birthday-month"]    12
    SeleniumLibrary.Click element    xpath=//select[@data-testid="set-checkout-customer-detail-birthday-year"]
    SeleniumLibrary.Select from list by value    xpath=//select[@data-testid="set-checkout-customer-detail-birthday-year"]    1990

Insert set email
    SeleniumLibrary.Input text    xpath=//input[@data-testid="set-checkout-customer-detail-email"]    ${email}

Insert set phone
    SeleniumLibrary.Input text    xpath=//input[@data-testid="set-checkout-customer-detail-phone"]    0152215151515

Accept set Terms&Conditions
    SeleniumLibrary.Click element    xpath=//label[@for="dataProtection"]

Verify mandatory fields error messages
    SeleniumLibrary.Element should be visible    xpath=//div[@data-testid="error-message-firstName"]
    SeleniumLibrary.Element should be visible    xpath=//div[@data-testid="error-message-lastName"]
    SeleniumLibrary.Element should be visible    xpath=//div[@data-testid="error-message-street"]
    SeleniumLibrary.Element should be visible    xpath=//div[@data-testid="error-message-houseNumber"]
    SeleniumLibrary.Element should be visible    xpath=//div[@data-testid="error-message-zip"]
    SeleniumLibrary.Element should be visible    xpath=//div[@data-testid="error-message-city"]
    SeleniumLibrary.Element should be visible    xpath=//div[@data-testid="error-message-dobDay"]
    SeleniumLibrary.Element should be visible    xpath=//div[@data-testid="error-message-dobMonth"]
    SeleniumLibrary.Element should be visible    xpath=//div[@data-testid="error-message-dobYear"]
    SeleniumLibrary.Element should be visible    xpath=//div[@data-testid="error-message-email"]
    SeleniumLibrary.Element should be visible    xpath=//div[@data-testid="error-message-phone"]
    SeleniumLibrary.Element should be visible    xpath=//p[contains(@class, "CustomerDetail__ErrorMessage")]
