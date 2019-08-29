*** Settings ***
Resource    Variables.txt
Library    SeleniumLibrary
Library    String
Library    Collections
Library    DateTime
Library    OperatingSystem
#Library    RequestsLibrary

**Keywords**

Go to back-end admin
    SeleniumLibrary.Go to    https://admin.sunshine-test-env.de/
    SeleniumLibrary.Wait until element is visible    name=email

Log in to back-end admin
    SeleniumLibrary.Input text    name=email    ${backend_email}
    SeleniumLibrary.Input text    name=password    ${backend_password}
    SeleniumLibrary.Click element    xpath=//button[contains(@class, "btn btn-primary")]
    SeleniumLibrary.Wait until element is visible    xpath=//i[@class="fa fa-power-off"]

Choose Sets from main navigation
    SeleniumLibrary.Click element    xpath=//span[contains(.,'Sets')]

Choose Appointment from main navigation
    SeleniumLibrary.Click element    xpath=//span[contains(.,'Appointment')]

Search for appointment
    SeleniumLibrary.input text    css=th:nth-child(5) .form-control    ${email}

Enter details of chosen appointment
    SeleniumLibrary.Click element    xpath=//td[contains(.,'${email}')]

Change appointment
    ${appointment_url}    SeleniumLibrary.Get element attribute    xpath=//a[contains(text(),'Change Appointment')]    href
    BuiltIn.Set global variable    ${appointment_url}
    SeleniumLibrary.Click link    link=Change Appointment
    Sleep    3s

Choose set order for given user
    SeleniumLibrary.Click element    xpath=//td[contains(.,'${email}')]

Click view link in process overview section
    SeleniumLibrary.Click link    link=view

Beam order to 'Ready for physician assignment' state
    Unfold states list
    SeleniumLibrary.Select from list by label    css=.beam-process-select > .form-control    ready for physician assignment <assign physician>
    Beam order

Beam order to 'Treatment plan ok for physician' state
    Unfold states list
    SeleniumLibrary.Select from list by label    css=.beam-process-select > .form-control    treatment plan ok for physician <create treatment quotation>
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

Choose valid until date
    ${current_date}    DateTime.Get current date    result_format=%d.%m.%Y
    SeleniumLibrary.Input text    css=div:nth-child(2) > div > .react-datepicker-wrapper .form-control    29.08.2019    #${current_date}
    SeleniumLibrary.Reload page
    Sleep    3s

Insert treatment duration
    :FOR    ${i}   IN RANGE    100
    \    SeleniumLibrary.Input text     name=treatmentDuration    12
    \    SeleniumLibrary.Set focus to element    xpath=//div[@class="content-box-header"]/h1
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=treatmentDuration    value    12
    \    BuiltIn.Exit for loop if    '${status}' == 'True'

Insert number of aligner steps
    :FOR    ${i}   IN RANGE    100
    \    SeleniumLibrary.Input text     name=numberOfAligner    12
    \    SeleniumLibrary.Set focus to element    xpath=//div[@class="content-box-header"]/h1
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=numberOfAligner    value    12
    \    BuiltIn.Exit for loop if    '${status}' == 'True'

Insert number of aligner lower jaw
    :FOR    ${i}   IN RANGE    100
    \    SeleniumLibrary.Input text     name=numberOfAlignerLowerJaw    12
    \    SeleniumLibrary.Set focus to element    xpath=//div[@class="content-box-header"]/h1
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=numberOfAlignerLowerJaw    value    12
    \    BuiltIn.Exit for loop if    '${status}' == 'True'

Insert number of aligner upper jaw
    :FOR    ${i}   IN RANGE    100
    \    SeleniumLibrary.Input text     name=numberOfAlignerUpperJaw    12
    \    SeleniumLibrary.Set focus to element    xpath=//div[@class="content-box-header"]/h1
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=numberOfAlignerUpperJaw    value    12
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
