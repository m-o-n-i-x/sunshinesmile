*** Settings ***
Resource    Variables.txt
Library    SeleniumLibrary
Library    String
Library    Collections
Library    DateTime
Library    OperatingSystem
#Library         DebugLibrary
#Library    RequestsLibrary

**Keywords**

Go to back-end admin
    SeleniumLibrary.Go to    https://admin.sunshine-test-env.de/

Log in to back-end admin
    SeleniumLibrary.Input text    name=email    ${backend_email}
    SeleniumLibrary.Input text    name=password    ${backend_password}
    SeleniumLibrary.Click element    xpath=//button[contains(@class, "btn btn-primary")]
    SeleniumLibrary.Wait until element is visible    xpath=//i[@class="fa fa-power-off"]

Choose Sets from main navigation
    SeleniumLibrary.Click element    xpath=//span[contains(.,'Sets')]

Choose Check-in from main navigation
    SeleniumLibrary.Click element    xpath=//span[contains(.,'Clinic Check-In')]

Choose Appointment from main navigation
    SeleniumLibrary.Click element    xpath=//span[contains(.,'Appointment')]

Choose Clinic 3D-Scan from main navigation
    SeleniumLibrary.Click element    xpath=//span[contains(.,'Clinic 3D-Scan')]

Choose Shop Scan from main navigation
    SeleniumLibrary.Click element    xpath=//span[contains(.,'Shop Scan')]

Choose customer from main navigation
    SeleniumLibrary.Click element    xpath=//span[contains(.,'Customer')]

Search for appointment
    SeleniumLibrary.input text    css=th:nth-child(5) .form-control    ${email}

Enter details of chosen appointment
    SeleniumLibrary.Click element    xpath=//td[contains(.,'${email}')]

Change appointment
    SeleniumLibrary.Wait until element is visible    xpath=//a[contains(text(),'Change Appointment')]
    ${appointment_url}    SeleniumLibrary.Get element attribute    xpath=//a[contains(text(),'Change Appointment')]    href
    BuiltIn.Set global variable    ${appointment_url}
    SeleniumLibrary.Click link    link=Change Appointment
    Sleep    3s

Choose set order for given user
    SeleniumLibrary.Click element    xpath=//td[contains(.,'${email}')]

Click view link in process overview section
    SeleniumLibrary.Click link    link=view

Click Clinic 3D-Scan in process overview section
    SeleniumLibrary.Click link    link=Clinic 3D-Scan

Beam order to 'Ready for physician assignment' state
    Unfold states list
    SeleniumLibrary.Select from list by label    css=.beam-process-select > .form-control    ready for physician assignment <assign physician>
    Beam order

Beam order to 'Treatment plan ok for physician' state
    Unfold states list
    SeleniumLibrary.Select from list by label    css=.beam-process-select > .form-control    treatment plan ok for physician <create treatment quotation>
    Beam order

Beam order to 'Check id' state
    Unfold states list
    SeleniumLibrary.Select from list by label    css=.beam-process-select > .form-control    check id <check id>
    Beam order

Beam order to 'check in complete' state
    Unfold states list
    SeleniumLibrary.Select from list by label    css=.beam-process-select > .form-control    check in complete
    Beam order

Beam order to 'Shop scan process started' state
    Unfold states list
    SeleniumLibrary.Select from list by label    css=.beam-process-select > .form-control    shop scan process started
    Beam order
    Sleep    3s

Beam order to 'Provide treatment setup' state
    Unfold states list
    SeleniumLibrary.Select from list by label    css=.beam-process-select > .form-control    provide treatment setup <provide treatment setup>
    Beam order

Beam order to 'Create treatment plan' state
    Unfold states list
    SeleniumLibrary.Select from list by label    css=.beam-process-select > .form-control    create treatment plan <create treatment plan>
    Beam order

Beam to 'Treatment plan ok for physician' state
    Unfold states list
    SeleniumLibrary.Select from list by label    css=.beam-process-select > .form-control    treatment plan ok for physician <create treatment quotation>
    Beam order

Beam order to 'ipr clearing up' state
    Unfold states list
    SeleniumLibrary.Select from list by label    css=.beam-process-select > .form-control    ipr clearing up <ipr clearing up>
    Beam order

Unfold states list
    SeleniumLibrary.Click element    css=.beam-process-select > .form-control

Beam order
    SeleniumLibrary.Click element    xpath=//button[contains(.,' beam')]

Assign physician
    SeleniumLibrary.Click link    	link=assign physician

Count physicians
    ${physicians_count}    SeleniumLibrary.Get element count    xpath=//div[1]/div/select[@class="form-control"]/option
    BuiltIn.Set global variable    ${physicians_count}

Choose physician
    Count physicians
    Unfold physicians list
    ${random_physician}    BuiltIn.Evaluate    random.randint(1, ${physicians_count}-1)    modules=random    # selects from 1, because first position is empty, ends on ${physicians_count}-1 because physician is chosen by index, that starts counting from zero
    ${random_physician}    BuiltIn.Convert to string    ${random_physician}   # needs to be converted to string, because 'Select from list by index' requires that
    SeleniumLibrary.Select from list by index    css=.col-md-4:nth-child(1) > div > .form-control    ${random_physician}

Unfold physicians list
    SeleniumLibrary.Click element    css=.col-md-4:nth-child(1) > div > .form-control

Choose SunshineSmile supplier
    Unfold suppliers list
    SeleniumLibrary.Select from list by label    css=.col-md-4:nth-child(2) > div > .form-control    SunshineSmile

Choose HAT supplier
    Unfold suppliers list
    SeleniumLibrary.Select from list by label    css=.col-md-4:nth-child(2) > div > .form-control    HAT Group

Unfold suppliers list
    SeleniumLibrary.Click element    css=.col-md-4:nth-child(2) > div > .form-control

Physician assigned
    SeleniumLibrary.Click element    xpath=//button[contains(.,'physician assigned')]

No pre treatment needed
    SeleniumLibrary.Click element    xpath=//button[contains(.,'no pre treatment needed')]
    Sleep    1s

Setup done
    SeleniumLibrary.Click element    xpath=//button[contains(.,'setup done')]

Click set link
    SeleniumLibrary.Click link    link=Set

Fill in Treatment Quotation form
    Create treatment quotation
    Choose valid until date
    Insert treatment duration
    Insert number of aligner steps
    Insert number of aligner lower jaw
    Insert number of aligner upper jaw
    Insert treatment link
    Rate pay allowed
    Allow customer to purchase

Create treatment quotation
    SeleniumLibrary.Click link    	link=create treatment quotation
    SeleniumLibrary.Wait until element is visible    xpath=//button[contains(.,'treatment quotation created')]
    Sleep    3s

Choose valid until date
    ${validity_date}    DateTime.Get current date    UTC    +5 days    result_format=%d.%m.%Y
    #SeleniumLibrary.Input text    xpath=//div[4]/div/div/div/div/div/div/input    ${validity_date}
    SeleniumLibrary.Input text    xpath=//div[4]/div/div/div/div/div/input    ${validity_date}
    SeleniumLibrary.Set focus to element    name=numberOfAligner
    Sleep    1s

Choose valid until date set
    ${validity_date}    DateTime.Get current date    UTC    +5 days    result_format=%d.%m.%Y
    SeleniumLibrary.Input text    xpath=//div[4]/div/div/div/div/div/div/input    ${validity_date}
    #SeleniumLibrary.Input text    xpath=//div[4]/div/div/div/div/div/input    ${validity_date}
    SeleniumLibrary.Reload page
    Sleep    3s

Insert treatment duration
    :FOR    ${i}   IN RANGE    100
    \    SeleniumLibrary.Set focus to element    name=treatmentDuration
    \    SeleniumLibrary.Input text     name=treatmentDuration    40
    \    Sleep    1s
    \    SeleniumLibrary.Set focus to element    name=numberOfAlignerLowerJaw
    \    Sleep    1s
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=treatmentDuration    value    40
    \    BuiltIn.Exit for loop if    '${status}' == 'True'

Insert number of aligner steps
    :FOR    ${i}   IN RANGE    100
    \    SeleniumLibrary.Input text     name=numberOfAligner    12
    \    SeleniumLibrary.Set focus to element    xpath=//div[@class="content-box-header"]/h1
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=numberOfAligner    value    12
    \    BuiltIn.Exit for loop if    '${status}' == 'True'

Insert number of aligner lower jaw
    :FOR    ${i}   IN RANGE    200
    \    SeleniumLibrary.Set focus to element    name=numberOfAlignerLowerJaw
    \    SeleniumLibrary.Input text     name=numberOfAlignerLowerJaw    ${lower_jaw}
    \    Sleep    1s
    \    SeleniumLibrary.Set focus to element    name=numberOfAlignerUpperJaw
    \    Sleep    1s
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=numberOfAlignerLowerJaw    value    ${lower_jaw}
    \    BuiltIn.Exit for loop if    '${status}' == 'True'

Insert number of aligner upper jaw
    :FOR    ${i}   IN RANGE    200
    \    SeleniumLibrary.Set focus to element    name=numberOfAlignerUpperJaw
    \    SeleniumLibrary.Input text     name=numberOfAlignerUpperJaw    ${upper_jaw}
    \    Sleep    1s
    \    SeleniumLibrary.Set focus to element    name=numberOfAlignerLowerJaw
    \    Sleep    1s
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=numberOfAlignerUpperJaw    value    ${upper_jaw}
    \    BuiltIn.Exit for loop if    '${status}' == 'True'

Insert treatment link
    :FOR    ${i}   IN RANGE    100
    \    SeleniumLibrary.Input text     name=treatmentLink    https://dentadynamics.com/ctmviewer/?src=d50515d0-8b6c-11e9-b89b-8d7e61147b7b
    \    SeleniumLibrary.Set focus to element    xpath=//div[@class="content-box-header"]/h1
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=treatmentLink    value    https://dentadynamics.com/ctmviewer/?src=d50515d0-8b6c-11e9-b89b-8d7e61147b7b
    \    BuiltIn.Exit for loop if    '${status}' == 'True'

Rate pay allowed
    SeleniumLibrary.Click element    css=.col-md-6:nth-child(2) > .react-form-checkbox input

Allow customer to purchase
    SeleniumLibrary.Click element    css=.row:nth-child(3) > .col-md-6:nth-child(1) input

Treatment quotation created
    SeleniumLibrary.Click element    xpath=//button[contains(.,'treatment quotation created')]
    SeleniumLibrary.Wait until element is not visible    xpath=//button[contains(.,'treatment quotation created')]
    SeleniumLibrary.Wait until element is visible    xpath=//button[contains(.,'treatment sold')]

Remember customer id
    ${current_location}    SeleniumLibrary.Log Location
    ${customer_id}    String.Fetch from right    ${current_location}    /
    ${customer_id}    String.Strip string    ${customer_id}
    BuiltIn.Set global variable    ${customer_id}

Go to customer overview
    SeleniumLibrary.Click link    link=qa set
    SeleniumLibrary.Wait until element is visible    xpath=//button[contains(., 'fix account problem')]

Insert date if birth
    SeleniumLibrary.Input text    name=date    1
    SeleniumLibrary.Input text    name=month    1
    SeleniumLibrary.Input text    name=year    1990

Insert valid address
    Insert valid street
    Insert valid zip
    Insert valid city

Insert valid street
    :FOR    ${i}   IN RANGE    100
    \    SeleniumLibrary.Set focus to element    name=streetAddress
    \    Sleep    1s
    \    SeleniumLibrary.Input text     name=streetAddress    Badensche Str. 52
    \    Sleep    1s
    \    SeleniumLibrary.Set focus to element    name=zip
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=streetAddress    value    Badensche Str. 52
    \    BuiltIn.Exit for loop if    '${status}' == 'True'

Insert valid zip
    :FOR    ${i}   IN RANGE    100
    \    SeleniumLibrary.Set focus to element    name=zip
    \    SeleniumLibrary.Input text     name=zip    10825
    \    Sleep    1s
    \    SeleniumLibrary.Set focus to element    name=email
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=zip    value    10825
    \    BuiltIn.Exit for loop if    '${status}' == 'True'

Insert valid city
    :FOR    ${i}   IN RANGE    100
    \    SeleniumLibrary.Set focus to element    name=city
    \    SeleniumLibrary.Input text     name=city    Berlin
    \    Sleep    1s
    \    SeleniumLibrary.Set focus to element    name=email
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=city    value    Berlin
    \    BuiltIn.Exit for loop if    '${status}' == 'True'

Click Clinic Check-In link
    SeleniumLibrary.Click link    link=Clinic Check-In

Click customer link
    SeleniumLibrary.Click link    link=qa de

Create treatment plan
    SeleniumLibrary.Click link    link=create treatment plan

Choose order for given user
    SeleniumLibrary.Click element    xpath=//td[contains(.,'${email}')]

Check id
    SeleniumLibrary.Click link    link=check id

Medical check
    SeleniumLibrary.Click link	   link=medical check

Ipr clearing up
    SeleniumLibrary.Click link    link=ipr clearing up


Id checked
    SeleniumLibrary.Click element    xpath=//button[contains(.,'id checked')]

Plan done
    SeleniumLibrary.Click element    xpath=//button[contains(.,'plan done')]

Click done
    SeleniumLibrary.Click element    xpath=//button[contains(.,'done')]

Click ok
    SeleniumLibrary.Click element    xpath=//button[contains(.,'ok')]
    Sleep    3s

Pretreatment needed
    SeleniumLibrary.Click element    xpath=//button[contains(.,'pretreatment needed')]

Ipr wanted
    SeleniumLibrary.Click element    xpath=//button[contains(.,'ipr wanted')]
    SeleniumLibrary.Wait until element is visible    xpath=//button[contains(.,'setup done')]

Tick IPR possible checkbox
    SeleniumLibrary.Click element    css=.checkbox-col > input

Choose pretreatment reason
    Unfold pretreatment reason
    Select pretreatment reason

Unfold pretreatment reason
    SeleniumLibrary.Click element    css=.content-box-body > .row > .col-md-6:nth-child(1) .form-control

Select pretreatment reason
    SeleniumLibrary.Select from list by label    css=.content-box-body > .row > .col-md-6:nth-child(1) .form-control    Parodontosis

Fill IPR instructions
    SeleniumLibrary.Click element    css=div:nth-child(2) > .teeth-in-between-item:nth-child(8) > .form-control
    SeleniumLibrary.Select from list by label    css=div:nth-child(2) > .teeth-in-between-item:nth-child(8) > .form-control    0.2
