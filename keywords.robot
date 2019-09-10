*** Settings ***
Resource    Variables.txt
Library    SeleniumLibrary    30
Library    String
Library    Collections
Library    DateTime
Library    OperatingSystem
Library    RequestsLibrary
#Library    HttpLibrary
#Library    JsonValidator
#Library    jsonschema
#Library    JSONSchemaLibrary schemas



**Keywords**

Set site url
    BuiltIn.Run keyword if    '${country}' == 'uk' and '${env}' == 'staging'    BuiltIn.Set global variable    ${staging_url}    https://sunshine-test-env.co.uk
    BuiltIn.Run keyword if    '${country}' == 'uk' and '${env}' == 'production'    BuiltIn.Set global variable    ${production_url}    https://sunshinesmile.co.uk
    Run keyword if    '${env}' == 'staging'    Set global variable    ${site_url}    ${staging_url}
	  Run keyword if    '${env}' == 'production'    Set global variable    ${site_url}    ${production_url}

Open SSS website
    Set site url
    SeleniumLibrary.Open Browser    ${site_url}    ${browser}
    Sleep    3s
    #SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Set Window Size    1920         1800

Choose location
    SeleniumLibrary.Click element    xpath=//a[@href="/location"]

Choose Berlin location
    SeleniumLibrary.Click element    xpath=//a[@data-testid="location-link-berlin-mitte"]/div/p
    SeleniumLibrary.Wait until element is visible    xpath=//div[contains(@data-testid, "booking-day-picker")]
    Sleep    3s

Choose London location
    SeleniumLibrary.Click element    xpath=//a[@data-testid="location-link-london-central"]/div/p

Choose Bern location
    SeleniumLibrary.Click element    xpath=//a[@data-testid="location-link-bern"]/div/p

Choose random available time
    Count available times
    ${random_time}    Evaluate    random.randint(1, ${available_times_count})    modules=random
    SeleniumLibrary.Click element    xpath=//*[@class="Grid__Container-sc-168em1b-1 eaOSAN"][${random_time}]
    #${chosen_time_slot}    SeleniumLibrary.Get text    css=.Grid__Container-sc-168em1b-1:nth-child(${random_time}) > .sc-bdVaJa > .sc-bdVaJa > .sc-bdVaJa
    ${chosen_time_slot}    SeleniumLibrary.Get text    xpath=//*[@class="Grid__Container-sc-168em1b-1 eaOSAN"][${random_time}]
    BuiltIn.Set global variable    ${chosen_time_slot}

Get time slot
    #${time_slot}    SeleniumLibrary.Get text    css=.Grid__Container-sc-168em1b-1:nth-child(${i}) > .sc-bdVaJa > .sc-bdVaJa > .sc-bdVaJa
    ${time_slot}    SeleniumLibrary.Get text    xpath=//div[@data-testid="booking-slot-${i}"]
    BuiltIn.Set global variable    ${time_slot}

Get all time slots
    @{time_slots}    BuiltIn.Create list
   :FOR    ${i}    IN RANGE    0    ${available_times_count}
   \    BuiltIn.Set global variable    ${i}
   \    Get time slot
   \    Collections.Append to list    ${time_slots}    ${time_slot}
   BuiltIn.Set global variable    @{time_slots}

Verify original time slot not available
    Count available times
    Get all time slots
    Collections.Should not contain match    ${time_slots}    ${chosen_time_slot}

Verify cancelled time slot available
    Count available times
    Get all time slots
    Collections.Should contain match    ${time_slots}    ${chosen_time_slot}

Count available times
    SeleniumLibrary.Wait Until Element Is Visible    xpath=//*[@class="Grid__Container-sc-168em1b-1 eaOSAN"]
    ${available_times_count}    SeleniumLibrary.Get element count    xpath=//*[@class="Grid__Container-sc-168em1b-1 eaOSAN"]
    BuiltIn.Set global variable    ${available_times_count}

Remember appointment time
    ${appointment}    SeleniumLibrary.Get text    css=.bciecc
    @{appointment_string}    String.Split string    ${appointment}     :    max_split=1
    BuiltIn.Set global variable    ${appointment}    @{appointment_string}[1]
    ${appointment}    String.Strip string    ${appointment}
    BuiltIn.Set global variable    ${appointment}
    @{appointment_saparated}    String.Split string    ${appointment}    ,
    BuiltIn.Set global variable    ${appointment_date}    @{appointment_saparated}[0]
    ${appointment_date}    String.Strip string    ${appointment_date}
    Set global variable    ${appointment_date}
    BuiltIn.Set global variable    ${appointment_time}    @{appointment_saparated}[1]
    ${appointment_time}    String.Strip string    ${appointment_time}
    BuiltIn.Set global variable    ${appointment_time}

Remember appointment time UK
    ${appointment}    SeleniumLibrary.Get text    css=.bciecc
    @{appointment_string}    String.Split string    ${appointment}     :    max_split=1
    BuiltIn.Set global variable    ${appointment}    @{appointment_string}[1]
    ${appointment}    String.Strip string    ${appointment}
    BuiltIn.Set global variable    ${appointment}
    @{appointment_saparated}    String.Split String From Right    ${appointment}    ${SPACE}    max_split=1
    BuiltIn.Set global variable    ${appointment_date}    @{appointment_saparated}[0]
    ${appointment_date}    String.Strip string    ${appointment_date}
    Set global variable    ${appointment_date}
    BuiltIn.Set global variable    ${appointment_time}    @{appointment_saparated}[1]
    ${appointment_time}    String.Strip string    ${appointment_time}
    BuiltIn.Set global variable    ${appointment_time}

Verify original appointment
    SeleniumLibrary.Wait until element is visible    css=.sc-bdVaJa:nth-child(1) > .sc-bdVaJa > .Grid__Container-sc-168em1b-1:nth-child(2) > .sc-bdVaJa > .sc-bdVaJa > .sc-bdVaJa
    SeleniumLibrary.Element Should Contain    css=.sc-bdVaJa:nth-child(1) > .sc-bdVaJa > .Grid__Container-sc-168em1b-1:nth-child(2) > .sc-bdVaJa > .sc-bdVaJa > .sc-bdVaJa    ${appointment_date}
    SeleniumLibrary.Element Should Contain    css=.sc-bdVaJa:nth-child(1) > .sc-bdVaJa > .Grid__Container-sc-168em1b-1:nth-child(2) > .sc-bdVaJa > .sc-bdVaJa > .sc-bdVaJa    ${appointment_time}

Fill appointment form
    Select booking salutation
	  Insert booking email
	  Insert booking first name
	  Insert booking last name
	  Insert booking mobile phone
    Confirm 18 years old

Confirm 18 years old
    SeleniumLibrary.Click element    css=.gFYOeV

Select booking salutation
    Sleep    3s
    SeleniumLibrary.Scroll Element Into View    css=.RadioGroup__ListItem-sc-14x04bd-1:nth-child(1) .Checkable__CheckableLabel-tbicms-0
    SeleniumLibrary.Click element    css=.RadioGroup__ListItem-sc-14x04bd-1:nth-child(1) .Checkable__CheckableLabel-tbicms-0


Insert booking email
    ${random_string}   Generate Random String    5    [LETTERS]
    SeleniumLibrary.Input text    xpath=//input[@data-testid="booking-form-email"]    monika.krawiec+${country}_${random_string}@sunshinesmile.de
    BuiltIn.Set global variable    ${email}    monika.krawiec+${country}_${random_string}@sunshinesmile.de

Insert booking first name
    SeleniumLibrary.Input text    xpath=//input[@data-testid="booking-form-first-name"]    ${first}

Insert booking last name
    SeleniumLibrary.Input text    xpath=//input[@data-testid="booking-form-last-name"]    ${last}

Insert booking mobile phone
    SeleniumLibrary.Input text    xpath=//input[@data-testid="booking-form-phone"]    0152215151515

Book appointment
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    3s
    SeleniumLibrary.Click element    xpath=//button[@data-testid="booking-form-submit"]
	SeleniumLibrary.Wait Until Element Is Visible    xpath=//a[@data-testid="booking-success-confirm-button"]
    Sleep    3s

Book rescheduled appointment
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    3s
    SeleniumLibrary.Wait Until Element Is Visible    xpath=//button[@data-testid="reschedule-booking-submit"]
    SeleniumLibrary.Click element    xpath=//button[@data-testid="reschedule-booking-submit"]
    Sleep    3s

Verify appointment success
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    SeleniumLibrary.Wait until element is visible    xpath=//a[@data-testid="booking-success-confirm-button"]
    SeleniumLibrary.Element should be visible    xpath=//a[@data-testid="booking-success-confirm-button"]
    Run keyword if    '${country}' == 'de'    SeleniumLibrary.Location should be    https://sunshine-test-env.de/booking/3d-scan/berlin-mitte/success
    Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Location should be    https://sunshine-test-env.co.uk/booking/3d-scan/london-central/success
    Run keyword if    '${country}' == 'ch'    SeleniumLibrary.Location should be    https://sunshine-test-env.ch/booking/3d-scan/bern/success

Verify logout success
    SeleniumLibrary.Location should be    https://sunshine-test-env.de
    SeleniumLibrary.Wait until element is visible    xpath=//a[@data-testid="header-login-link"]
    SeleniumLibrary.Element should be visible    xpath=//a[@data-testid="header-login-link"]

Verify Login success
    SeleniumLibrary.Wait until element is visible    xpath=//h1[@data-testid="dashboard-greeting"]
    SeleniumLibrary.Element should be visible    xpath=//h1[@data-testid="dashboard-greeting"]

Go to set url
    Go to    ${site_url}/set#voucher_code

Go to website
    Go to    ${site_url}

Order set
	SeleniumLibrary.Click element    xpath=//button[@type="button"]
  	SeleniumLibrary.Wait until element is visible    xpath=//input[@data-testid="address-input-first-name"]

Fill delivery address form
    Insert delivery first name
    Insert delivery last name
	  Insert delivery street
	  Insert delivery house number
	  Insert delivery postal code
	  Insert delivery city
	  Insert delivery birthday
	  Insert delivery email
	  Insert delivery phone
	  Accept delivery Terms&Conditions

Insert delivery first name
    SeleniumLibrary.Input text    xpath=//input[@data-testid="address-input-first-name"]    qa

Insert delivery last name
    SeleniumLibrary.Input text    xpath=//input[@data-testid="address-input-last-name"]    set

Insert delivery street
    SeleniumLibrary.Input text    xpath=//input[@data-testid="address-input-street"]    Teststr. 1

Insert delivery house number
    SeleniumLibrary.Input text    xpath=//input[@data-testid="address-input-house-number"]    20

Insert delivery postal code
    SeleniumLibrary.Input text    xpath=//input[@data-testid="address-input-zip"]    10589

Insert delivery city
    SeleniumLibrary.Input text    xpath=//input[@data-testid="address-input-city"]    Berlin

Insert delivery birthday
    SeleniumLibrary.Click element   xpath=//select[@data-testid="set-checkout-customer-detail-birthday-day"]
	  SeleniumLibrary.Select from list by value    xpath=//select[@data-testid="set-checkout-customer-detail-birthday-day"]    1
	  SeleniumLibrary.Click element    xpath=//select[@data-testid="set-checkout-customer-detail-birthday-month"]
	  SeleniumLibrary.Select from list by value    xpath=//select[@data-testid="set-checkout-customer-detail-birthday-month"]    12
	  SeleniumLibrary.Click element    xpath=//select[@data-testid="set-checkout-customer-detail-birthday-year"]
	  SeleniumLibrary.Select from list by value    xpath=//select[@data-testid="set-checkout-customer-detail-birthday-year"]    1990

Insert delivery email
    ${random_string}   Generate Random String    5    [LETTERS]
    SeleniumLibrary.Input text    xpath=//input[@data-testid="set-checkout-customer-detail-email"]    monika.krawiec+${country}_${random_string}@sunshinesmile.de
    BuiltIn.Set global variable    ${email}    monika.krawiec+${country}_${random_string}@sunshinesmile.de

Insert delivery phone
    SeleniumLibrary.Input text    xpath=//input[@data-testid="set-checkout-customer-detail-phone"]    0152215151515

Accept delivery Terms&Conditions
    SeleniumLibrary.Click element    xpath=//label[@for="dataProtection"]

Proceed to payment methods
    SeleniumLibrary.Click element    xpath=//button[@type="submit"]/div

Choose CC radio button
    #SeleniumLibrary.Click element    xpath=//div[contains(@class, "PaymentMethodChoices")]//label[2]
	  #Select frame    index=2
	  #SeleniumLibrary.Click element    xpath=//*[@id="__next"]/div/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/div/div/div/div/div[2]/div/div/label
	  SeleniumLibrary.Click element    xpath=//div[contains(@class, "Grid__Container")]/div/div[2]//label

Choose Lastschrift radio button
    SeleniumLibrary.Click element    xpath=//div[contains(@class, "Grid__Container")]/div/div[3]//label

Insert CC name
    SeleniumLibrary.Input text    name=credit-card-holder-name    qa ${country}

Insert valid CC number
    #Press Key    name=cardnumber
	  SeleniumLibrary.Input text    xpath=//input[@name='cardnumber']    4111 1111 1111 1111
    SeleniumLibrary.Input text    name=cardnumber    4111111111111111
    SeleniumLibrary.Input text    name=exp-date    1122
    SeleniumLibrary.Input text    name=cvc    111
	  SeleniumLibrary.Input text    name=postal    11111

Insert Lastschrift data
    SeleniumLibrary.Input text    name=payment-sepa-account-owner    qa ${country}
    SeleniumLibrary.Input text    name=payment-sepa-iban    DE12500105170648489890

Proceed to set overview
    SeleniumLibrary.Click element    xpath=(//button[@type='submit'])[2]

Check Set Terms&Conditions checkbox
    SeleniumLibrary.Click element    xpath=//label[@for="terms_condition_repeal"]

Check silicon allergy checkbox
    SeleniumLibrary.Click element    xpath=//label[@for="silicon_allergy"]

Check jaw problems checkbox
    SeleniumLibrary.Click element    xpath=//label[@for="jaw_problems"]

Check not pregnant checkbox
    SeleniumLibrary.Click element    xpath=//label[@for="not_pregnant"]

Accept Set checkboxes
    Check Set Terms&Conditions checkbox
    Check silicon allergy checkbox
    Check jaw problems checkbox
    Check not pregnant checkbox

Proceed set order success
    SeleniumLibrary.Click element    xpath=//div[6]/button/div

Verify set order success
    SeleniumLibrary.Wait until element is visible    xpath=//div[contains(@class, "OrderConfirmation")]
    SeleniumLibrary.Element should be visible    xpath=//div[contains(@class, "OrderConfirmation")]

Go to account creation page
    Go to    ${site_url}/account/create?customerId=${customer_id}&email=${email}

Set account password
    SeleniumLibrary.Input text    name=password-create-account    Sunshine123#

Set account repeat password
    SeleniumLibrary.Input text    name=password-repeat-create-account    Sunshine123#

Create account
    SeleniumLibrary.Click element    xpath=//button[@type="submit"]/div
    SeleniumLibrary.Wait until element is visible    css=.Headline-iv4yf7-0:nth-child(1)
    #BuiltIn.Run keyword if    '${country}' == 'de' or '${country}' == 'ch'    SeleniumLibrary.Element text should be    css=.Headline-iv4yf7-0:nth-child(1)    Behandlungsplan von qa set
    #BuiltIn.Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Element text should be    css=.Headline-iv4yf7-0:nth-child(1)    Behandlungsplan von qa set
    SeleniumLibrary.Wait until element is visible    xpath=//div[contains(@class, "TreatmentDetailV2")]

User redirected to treatment plan after log in
    BuiltIn.Run keyword if    '${country}' == 'de' or '${country}' == 'ch'    SeleniumLibrary.Location should be    ${site_url}mein-sunshine/checkout-treatment#treatment_plan
    BuiltIn.Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Location should be    ${site_url}mein-sunshine/checkout-treatment#treatment_plan
    SeleniumLibrary.Element should be visible    xpath=//div[contains(@class, "TreatmentDetailV2")]

Buy now
    SeleniumLibrary.Click element    xpath=//button/div

Open login page
    SeleniumLibrary.Click element    xpath=//a[@data-testid="header-login-link"]

Click on logout link
    SeleniumLibrary.Click element    xpath=//a[@data-testid="header-logout-link"]

Fill in login form
    SeleniumLibrary.Input text    name=email-login    ${patient_email}
    SeleniumLibrary.Input text    name=password-login    ${patient_password}

Login
    SeleniumLibrary.Click element    xpath=(//button)

Create customer
    RequestsLibrary.Create Session       createProfile     https://admin.sunshine-test-env.de   verify=True
    ${response}     RequestsLibrary.Get Request    alias=createProfile    uri=/api/test-automation/reset-customer
    ${json_data}    Set Variable    ${response.json()}
    ${id}=   Get From Dictionary     ${json_data}    id
    SeleniumLibrary.Go to    ${site_url}/account/create?customerId=${id}&email=automated-test%40sunshinesmile.de
    SeleniumLibrary.Input text    name=password-create-account    Sunshine123@
    SeleniumLibrary.Input text    name=password-repeat-create-account    Sunshine123@
    SeleniumLibrary.Click element    xpath=//button[@type="submit"]
    SeleniumLibrary.Wait until element is visible    xpath=//a[@data-testid="header-logout-link"]

Reschedule appointment from interface
    SeleniumLibrary.Wait until element is visible    xpath=//button[@data-testid="edit-booking-reschedule"]
    SeleniumLibrary.Click element    xpath=//button[@data-testid="edit-booking-reschedule"]

Cancel appointment from interface
    SeleniumLibrary.Wait until element is visible    xpath=//button[@data-testid="edit-booking-cancel"]
    SeleniumLibrary.Click element    xpath=//button[@data-testid="edit-booking-cancel"]

Verify appointment cancelled
    SeleniumLibrary.Wait until element is visible    xpath=//div[contains(@class, "AlertBox__AlertBoxStyled")]
    SeleniumLibrary.Element should be visible    xpath=//div[contains(@class, "AlertBox__AlertBoxStyled")]
