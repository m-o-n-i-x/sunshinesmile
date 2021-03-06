*** Settings ***
Resource    Variables.txt
Resource    keywords.robot

**Keywords**

Go to back-end admin
    Run keyword if    '${env}' == 'staging'    SeleniumLibrary.Go to    https://admin.sunshine-test-env.de/
    Run keyword if    '${env}' == 'qa1'    SeleniumLibrary.Go to    https://pe-qa1.sunshine-test-env.de/
    Run keyword if    '${env}' == 'qa2'    SeleniumLibrary.Go to    https://pe-qa2.sunshine-test-env.de/
    Run keyword if    '${env}' == 'production'    SeleniumLibrary.Go to    https://admin.sunshinesmile.de/

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

Search for 3Shape customer
    Choose Shop Scan from main navigation
    SeleniumLibrary.input text    css=th:nth-child(4) .form-control    3Shape
    SeleniumLibrary.input text    css=th:nth-child(7) .form-control    treatment quotation created whatsapp
    Sleep    2s
    ${email}=    SeleniumLibrary.Get Text    xpath=//*[@id="root"]/div/div/div[2]/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[6]
    Set Global Variable    ${email}

Search for Onyceph customer
    Choose Shop Scan from main navigation
    SeleniumLibrary.input text    css=th:nth-child(4) .form-control    Onyceph
    SeleniumLibrary.input text    css=th:nth-child(7) .form-control    treatment quotation created whatsapp
    Sleep    2s
    ${email}=    SeleniumLibrary.Get Text    xpath=//*[@id="root"]/div/div/div[2]/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[6]
    Set Global Variable    ${email}

Enter details of chosen appointment
    SeleniumLibrary.Click element    xpath=//td[contains(.,'${email}')]

Change appointment
    SeleniumLibrary.Wait until element is visible    xpath=//a[contains(text(),'Change Appointment')]
    ${appointment_url}    SeleniumLibrary.Get element attribute    xpath=//a[contains(text(),'Change Appointment')]    href
    BuiltIn.Set global variable    ${appointment_url}
    BuiltIn.Run keyword if    '${country}' == 'uk' and '${env}' == 'production'    Set plsudent
    BuiltIn.Set global variable    ${appointment_url}
    SeleniumLibrary.Click link    link=Change Appointment
    Sleep    3s

Set plsudent
    ${appointment_url}    String.Replace string    ${appointment_url}    plusdental    plusdent
    BuiltIn.Set global variable    ${appointment_url}

Choose set order for given user
    SeleniumLibrary.Click element    xpath=//td[contains(.,'${email}')]
    Sleep    3s

Click view link in process overview section
    SeleniumLibrary.Click link    link=view
    Sleep    3s

Click Clinic 3D-Scan in process overview section
    SeleniumLibrary.Click link    link=Clinic 3D-Scan
    Sleep    3s

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
    #${physicians_count}    SeleniumLibrary.Get element count    xpath=//div[1]/div/select[@class="form-control"][2]/option
    BuiltIn.Set global variable    ${physicians_count}    4

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
    Sleep    3s

No pre treatment needed
    SeleniumLibrary.Click element    xpath=//button[contains(.,'no pre treatment needed')]
    Sleep    3s

Setup done
    SeleniumLibrary.Click element    xpath=//button[contains(.,'setup done')]

Medical check done
    SeleniumLibrary.Click element    xpath=//button[contains(.,'medical check done')]
    Sleep    3s

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
    ${validity_date}    DateTime.Get current date    UTC    +50 days    result_format=%d.%m.%Y
    SeleniumLibrary.Input text    xpath=(//div[@class="react-datepicker__input-container"])[2]/input    ${validity_date}
    SeleniumLibrary.Set focus to element    name=numberOfAligner
    Sleep    3s

Choose valid until date set
    ${validity_date}    DateTime.Get current date    UTC    +50 days    result_format=%d.%m.%Y
    SeleniumLibrary.Input text    xpath=//div[4]/div/div/div/div/div/div/input    ${validity_date}
    #SeleniumLibrary.Input text    xpath=//div[4]/div/div/div/div/div/input    ${validity_date}
    SeleniumLibrary.Reload page
    Sleep    3s

Insert treatment duration
    :FOR    ${i}   IN RANGE    100
    \    SeleniumLibrary.Set focus to element    name=treatmentDuration
    \    SeleniumLibrary.Input text     name=treatmentDuration    ${treatment_duration}
    \    Sleep    1s
    \    SeleniumLibrary.Set focus to element    name=numberOfAlignerLowerJaw
    \    Sleep    1s
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=treatmentDuration    value    ${treatment_duration}
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
    \    SeleniumLibrary.Set focus to element    name=treatmentLink
    \    SeleniumLibrary.Input text     name=treatmentLink    https://dentadynamics.com/ctmviewer/?src=d50515d0-8b6c-11e9-b89b-8d7e61147b7b
    \    Sleep    1s
    \    SeleniumLibrary.Set focus to element    name=treatmentDuration
    \    Sleep    1s
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=treatmentLink    value    https://dentadynamics.com/ctmviewer/?src=d50515d0-8b6c-11e9-b89b-8d7e61147b7b
    \    BuiltIn.Exit for loop if    '${status}' == 'True'
    Sleep    1s
    Remember treatment link

Remember treatment link
    ${treatment_link}    SeleniumLibrary.Get element attribute    name=treatmentLink    value
    BuiltIn.Set global variable    ${treatment_link}

Verify treatment link saved
    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=treatmentLink    value    ${treatment_link}
    Run keyword if    '${status}' == 'False'    SeleniumLibrary.Input text     name=treatmentLink    https://dentadynamics.com/ctmviewer/?src=d50515d0-8b6c-11e9-b89b-8d7e61147b7b
    Run keyword if    '${status}' == 'False'    Allow customer to purchase
    Run keyword if    '${status}' == 'False'    Rate pay allowed

Verify pdf link saved
    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=treatmentLink    value    ${treatment_link}
    Run keyword if    '${status}' == 'False'    Upload PDF
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

Set street
    Run keyword if    '${country}' == 'de'    Set de street
    Run keyword if    '${country}' == 'ch'    Set ch street
    Run keyword if    '${country}' == 'uk'    Set uk street
    Run keyword if    '${country}' == 'at'    Set at street

Set de street
    BuiltIn.Set global variable    ${street}    Teststr. 1 20

Set uk street
    BuiltIn.Set global variable    ${street}    90 Cromer St

Set at street
    BuiltIn.Set global variable    ${street}    Vordere Zollamtsstraße 5

Set ch street
    BuiltIn.Set global variable    ${street}    See 33

Insert valid street
    Set street
    :FOR    ${i}   IN RANGE    100
    \    SeleniumLibrary.Set focus to element    name=streetAddress
    \    Sleep    1s
    \    SeleniumLibrary.Input text     name=streetAddress    ${street}
    \    Sleep    1s
    \    SeleniumLibrary.Set focus to element    name=zip
    \    ${status}    BuiltIn.Run keyword and return status    SeleniumLibrary.Element attribute value should be    name=streetAddress    value    ${street}
    \    BuiltIn.Exit for loop if    '${status}' == 'True'

Set zip code
    Run keyword if    '${country}' == 'de'    Set de zip
    Run keyword if    '${country}' == 'ch'    Set ch zip
    Run keyword if    '${country}' == 'uk'    Set uk zip
    Run keyword if    '${country}' == 'at'    Set at zip

Set de zip
    BuiltIn.Set global variable    ${zip_code}    10589

Set ch zip
    BuiltIn.Set global variable    ${zip_code}    3011

Set uk zip
    BuiltIn.Set global variable    ${zip_code}    WC1H 8DD

Set at zip
    BuiltIn.Set global variable    ${zip_code}    1030

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
    BuiltIn.Set global variable    ${city}    Solingen

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
    Sleep    3s

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
    SeleniumLibrary.Click element    css=.row:nth-child(5) .chip:nth-child(1)

Tick patient scanned
    SeleniumLibrary.Click element    css=.col-md-6 .chip:nth-child(1)

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
    Sleep    8s
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\3Shape\\Subsetup2.obj
    Sleep    8s
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\3Shape\\Subsetup3.obj
    Sleep    8s
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\3Shape\\Subsetup4.obj
    Sleep    8s
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\3Shape\\Subsetup5.obj
    Sleep    8s
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a file')]
    Choose File    xpath=(//input[@type='file'])[2]    ${CURDIR}${/}visualization\\3Shape\\Subsetup6.obj
    Sleep    8s

Upload PDF
    SeleniumLibrary.Click element    xpath=//p[contains(text(),'Click to upload a video')]
    Choose File    xpath=(//input[@type='file'])[1]    ${CURDIR}${/}visualization\\view-video-file-new.pdf
    Sleep    8s
    Remember treatment link

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

Set appointment to test
    SeleniumLibrary.Click element    css=.col-md-6:nth-child(2) > div > .form-control
    SeleniumLibrary.Select from list by label    css=.col-md-6:nth-child(2) > div > .form-control    test

Verify appointment canceled
    SeleniumLibrary.Element Attribute Value Should Be    name=status    value    canceled

Verify appointment changed
    SeleniumLibrary.Element Attribute Value Should Be    name=status    value    changed

Upload picture
    SeleniumLibrary.Click element    css=.image-upload-dropzone:nth-child(${pic_num}) img
    Choose File    css=.image-upload-dropzone:nth-child(${pic_num}) > input    ${CURDIR}${/}attachments\\pictures\\${pic_num}.png
    Sleep    5s
