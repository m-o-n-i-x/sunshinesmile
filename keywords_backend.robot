*** Settings ***
Resource    Variables.txt
Resource    keywords.robot

**Keywords**

Go to back-end admin
    Run keyword if    '${env}' == 'staging'    SeleniumLibrary.Go to    https://admin.sunshine-test-env.de/
    Run keyword if    '${env}' == 'qa1'    SeleniumLibrary.Go to    https://pe-qa1.sunshine-test-env.de/
    Run keyword if    '${env}' == 'qa2'    SeleniumLibrary.Go to    https://pe-qa2.sunshine-test-env.de/

Log in to back-end admin
    SeleniumLibrary.Input text    name=email    ${backend_email}
    SeleniumLibrary.Input text    name=password    ${backend_password}
    SeleniumLibrary.Click element    xpath=//button[contains(@class, "btn btn-primary")]
    SeleniumLibrary.Wait until element is visible    xpath=//i[@class="fa fa-power-off"]

Choose Sets from main navigation
    SeleniumLibrary.Click element    xpath=//span[contains(.,'Sets')]
    Sleep    2s

Choose Check-in from main navigation
    SeleniumLibrary.Click element    xpath=//span[contains(.,'Clinic Check-In')]
    Sleep    2s

Choose Appointment from main navigation
    SeleniumLibrary.Click element    xpath=//span[contains(.,'Appointment')]
    Sleep    2s

Choose Clinic 3D-Scan from main navigation
    SeleniumLibrary.Click element    xpath=//span[contains(.,'Clinic 3D-Scan')]
    Sleep    2s

Choose Shop Scan from main navigation
    SeleniumLibrary.Click element    xpath=//span[contains(.,'Shop Scan')]
        Sleep    2s

Choose customer from main navigation
    SeleniumLibrary.Click element    xpath=//span[contains(.,'Customer')]
    Sleep    2s

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
    Sleep    3s

Click view link in process overview section
    SeleniumLibrary.Click link    link=view
    Sleep    3s

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
    Sleep    3s

Assign physician
    SeleniumLibrary.Click link    	link=assign physician
    Sleep    3s

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
    #SeleniumLibrary.Wait until element is visible    xpath=//button[contains(.,'treatment quotation created')]
    Sleep    5s

Choose valid until date
    ${validity_date}    DateTime.Get current date    UTC    +5 days    result_format=%d.%m.%Y
    SeleniumLibrary.Input text    xpath=(//div[@class="react-datepicker__input-container"])[2]/input    ${validity_date}
    SeleniumLibrary.Set focus to element    name=numberOfAligner
    Sleep    3s

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
    \    BuiltIn.Exit for loop if    '${status}' == 'True'
    Sleep    3s
    SeleniumLibrary.Set focus to element    name=treatmentDuration
    Sleep    2s

Verify treatment link saved
    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=treatmentLink    value    https://dentadynamics.com/ctmviewer/?src=d50515d0-8b6c-11e9-b89b-8d7e61147b7b
    Run keyword if    '${status}' == 'False'    SeleniumLibrary.Input text     name=treatmentLink    https://dentadynamics.com/ctmviewer/?src=d50515d0-8b6c-11e9-b89b-8d7e61147b7b
    Run keyword if    '${status}' == 'False'    Allow customer to purchase
    Run keyword if    '${status}' == 'False'    Rate pay allowed

Rate pay allowed
    SeleniumLibrary.Click element    css=.col-md-6:nth-child(2) > .react-form-checkbox input
    Sleep    3s
    SeleniumLibrary.Set focus to element    name=treatmentDuration
    Sleep    2s

Purchase checkbox visible
    ${purchase_visible}    Run keyword and return status   SeleniumLibrary.element text should not be visible     css=.row:nth-child(2) .label-col    Purchased
    BuiltIn.Set global variable    ${purchase_visible}

Allow customer to purchase
    Purchase checkbox visible
    Run keyword if    '${purchase_visible}' == 'False'    SeleniumLibrary.Click element    css=.col-md-6:nth-child(1) > .react-form-checkbox input
    Run keyword if    '${purchase_visible}' == 'True'    SeleniumLibrary.Click element    css=.col-md-6:nth-child(1) > .react-form-checkbox input
    Sleep    3s
    SeleniumLibrary.Set focus to element    name=treatmentDuration
    Sleep    2s

Treatment quotation created
    SeleniumLibrary.Click element    xpath=//button[contains(.,'treatment quotation created')]
    SeleniumLibrary.Wait until element is not visible    xpath=//button[contains(.,'treatment quotation created')]
    SeleniumLibrary.Wait until element is visible    xpath=//button[contains(.,'treatment sold')]
    Sleep    5s

Treatment quotation created intermediate
    SeleniumLibrary.Click element    xpath=//button[contains(.,'treatment quotation created')]
    Sleep    3s

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

Set zip code
    Run keyword if    '${country}' == 'de'    Set de zip
    Run keyword if    '${country}' == 'ch'    Set ch zip
    Run keyword if    '${country}' == 'uk'    Set uk zip
    Run keyword if    '${country}' == 'at'    Set at zip

Set de zip
    BuiltIn.Set global variable    ${zip_code}    10825

Set ch zip
    BuiltIn.Set global variable    ${zip_code}    3013

Set uk zip
    BuiltIn.Set global variable    ${zip_code}    10825

Set at zip
    BuiltIn.Set global variable    ${zip_code}    1010

Insert valid zip
    Set zip code
    :FOR    ${i}   IN RANGE    100
    \    SeleniumLibrary.Set focus to element    name=zip
    \    Sleep    1s
    \    SeleniumLibrary.Input text     name=zip    ${zip_code}
    \    Sleep    1s
    \    SeleniumLibrary.Set focus to element    name=email
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=zip    value    ${zip_code}
    \    BuiltIn.Exit for loop if    '${status}' == 'True'

Set city
    Run keyword if    '${country}' == 'de'    Set de city
    Run keyword if    '${country}' == 'ch'    Set ch city
    Run keyword if    '${country}' == 'uk'    Set uk city
    Run keyword if    '${country}' == 'at'    Set at city

Set de city
    BuiltIn.Set global variable    ${city}    Berlin

Set ch city
    BuiltIn.Set global variable    ${city}    Bern

Set uk city
    BuiltIn.Set global variable    ${city}    London

Set at city
    BuiltIn.Set global variable    ${city}    Wien

Insert valid city
    Set city
    :FOR    ${i}   IN RANGE    100
    \    SeleniumLibrary.Set focus to element    name=city
    \    Sleep    1s
    \    SeleniumLibrary.Input text     name=city    ${city}
    \    Sleep    1s
    \    SeleniumLibrary.Set focus to element    name=email
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=city    value    ${city}
    \    BuiltIn.Exit for loop if    '${status}' == 'True'

Click Clinic Check-In link
    SeleniumLibrary.Click link    link=Clinic Check-In
    Sleep    3s

Click customer link
    SeleniumLibrary.Click link    link=qa de
    Sleep    3s

Create treatment plan
    SeleniumLibrary.Click link    link=create treatment plan
    Sleep    3s

Choose order for given user
    SeleniumLibrary.Click element    xpath=//td[contains(.,'${email}')]
    Sleep    3s

Check id
    SeleniumLibrary.Click link    link=check id
    Sleep    3s

Medical check
    SeleniumLibrary.Click link	   link=medical check
    Sleep    3s

Ipr clearing up
    SeleniumLibrary.Click link    link=ipr clearing up


Id checked
    SeleniumLibrary.Click element    xpath=//button[contains(.,'id checked')]
    Sleep    3s

Plan done
    SeleniumLibrary.Click element    xpath=//button[contains(.,'plan done')]
    Sleep    3s

Click done
    SeleniumLibrary.Click element    xpath=//button[contains(.,'done')]
    Sleep    3s

Click ok
    SeleniumLibrary.Click element    xpath=//button[contains(.,'ok')]
    Sleep    3s

Pretreatment needed
    SeleniumLibrary.Click element    xpath=//button[contains(.,'pretreatment needed')]
    Sleep    3s

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
    SeleniumLibrary.Select from list by label    css=.content-box-body > .row:nth-child(2) > .col-md-6:nth-child(1) > div > .form-control    Parodontosis

Fill IPR instructions
    SeleniumLibrary.Click element    css=div:nth-child(2) > .teeth-in-between-item:nth-child(8) > .form-control
    SeleniumLibrary.Select from list by label    css=div:nth-child(2) > .teeth-in-between-item:nth-child(8) > .form-control    0.2

Upload Onyceph files
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\Onyceph\\Step1.obj
    Sleep    5s
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\Onyceph\\Step2.obj
    Sleep    5s
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\Onyceph\\Step3.obj
    Sleep    5s
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\Onyceph\\Step4.obj
    Sleep    5s
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\Onyceph\\Step5.obj
    Sleep    5s
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\Onyceph\\Step6.obj
    Sleep    5s

Upload 3Shape files
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\3Shape\\Subsetup1.obj
    Sleep    5s
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\3Shape\\Subsetup2.obj
    Sleep    5s
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\3Shape\\Subsetup3.obj
    Sleep    5s
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\3Shape\\Subsetup4.obj
    Sleep    5s
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\3Shape\\Subsetup5.obj
    Sleep    5s
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\3Shape\\Subsetup6.obj
    Sleep    5s

Upload PDF
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a video')]
    Choose File    xpath=(//input[@type='file'])[1]    ${CURDIR}${/}visualization\\view-video-file.pdf
    Sleep    8s

Verify Onyceph files uploaded
    SeleniumLibrary.Element text should be    xpath=//table[@class="default-table"]/tbody/tr[1]/td[1]    Step1.obj
    SeleniumLibrary.Element text should be    xpath=//table[@class="default-table"]/tbody/tr[2]/td[1]    Step2.obj
    SeleniumLibrary.Element text should be    xpath=//table[@class="default-table"]/tbody/tr[3]/td[1]    Step3.obj
    SeleniumLibrary.Element text should be    xpath=//table[@class="default-table"]/tbody/tr[4]/td[1]    Step4.obj
    SeleniumLibrary.Element text should be    xpath=//table[@class="default-table"]/tbody/tr[5]/td[1]    Step5.obj
    SeleniumLibrary.Element text should be    xpath=//table[@class="default-table"]/tbody/tr[6]/td[1]    Step6.obj

Verify 3Shape files uploaded
    SeleniumLibrary.Element text should be    xpath=//table[@class="default-table"]/tbody/tr[1]/td[1]    Subsetup1.obj
    SeleniumLibrary.Element text should be    xpath=//table[@class="default-table"]/tbody/tr[2]/td[1]    Subsetup2.obj
    SeleniumLibrary.Element text should be    xpath=//table[@class="default-table"]/tbody/tr[3]/td[1]    Subsetup3.obj
    SeleniumLibrary.Element text should be    xpath=//table[@class="default-table"]/tbody/tr[4]/td[1]    Subsetup4.obj
    SeleniumLibrary.Element text should be    xpath=//table[@class="default-table"]/tbody/tr[5]/td[1]    Subsetup5.obj
    SeleniumLibrary.Element text should be    xpath=//table[@class="default-table"]/tbody/tr[6]/td[1]    Subsetup6.obj

Trigger visualization
    SeleniumLibrary.Click element    xpath=//button[contains(.,'trigger Visualization')]

Verify visualization triggered
    SeleniumLibrary.Element text should be    xpath=//a[@class="active"]/div[@class="count"]    1

Wait for visualization done
    :FOR    ${i}    IN RANGE    1    1000
    \    Reload page
    \    Sleep    2s
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element text should be    xpath=//a[@class="active"]/div[@class="count"]    0
    \    Exit for loop if    '${status}' == 'True'

Go to visualization page
    SeleniumLibrary.Go to    https://visualization:ilove3dvisualization@visualization.sunshine-test-env.de/jobs/active
    Sleep    5s

Close treatment quotation preview
    SeleniumLibrary.Click element    xpath=//button[contains(.,'x')]
