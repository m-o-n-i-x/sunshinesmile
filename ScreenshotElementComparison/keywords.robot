*** Settings ***
Library           compareImage.py
Resource          ../keywords.robot

*** Keywords ***

Make Desktop 3Shape TopNavigation Test Screenshot
    Sleep    2s
    Execute Javascript    document.getElementsByClassName('Headline-iv4yf7-0 TreatmentPlanV2__HeadlineBlueBoldLeft-r1bz9m-1 glGpZe')[1].scrollIntoView()
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    Select Frame    xpath=//*[@title="Behandlungsvorschlag"]
    SeleniumLibrary.Click element    id=blink
    SeleniumLibrary.Click element    id=moveButtonTop
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/TopNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/3dShape/TopNavigation_desktop.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/TopNavigation_desktop_ref.png    475    655    960    577

Make Desktop 3Shape LeftNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonLeft
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/3dShape/LeftNavigation_desktop.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_desktop_ref.png    475    655    960    577

Make Desktop 3Shape RightNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonRight
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/3dShape/RightNavigation_desktop.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_desktop_ref.png    475    655    960    577

Make Desktop 3Shape BottomNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonBottom
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/3dShape/BottomNavigation_desktop.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_desktop_ref.png    475    655    960    577

Make Desktop 3Shape CenterNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonCenter
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/3dShape/CenterNavigation_desktop.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_desktop_ref.png    475    655    960    577

Make Mobile 3Shape TopNavigation Test Screenshot
    Set Window Size    375    950
    Reload Page
    Sleep    2s
    Execute Javascript    document.getElementsByClassName('Headline-iv4yf7-0 TreatmentPlanV2__HeadlineBlueBoldLeft-r1bz9m-1 glGpZe')[1].scrollIntoView()
    Select Frame    xpath=//*[@title="Behandlungsvorschlag"]
    SeleniumLibrary.Click element    id=blink
    SeleniumLibrary.Click element    id=moveButtonTop
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/TopNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/3dShape/TopNavigation_mobile.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/TopNavigation_mobile_ref.png    475    655    960    577

Make Mobile 3Shape LeftNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonLeft
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/3dShape/LeftNavigation_mobile.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_mobile_ref.png    475    655    960    577

Make Mobile 3Shape RightNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonRight
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/3dShape/RightNavigation_mobile.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_mobile_ref.png    475    655    960    577

Make Mobile 3Shape BottomNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonBottom
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/3dShape/BottomNavigation_mobile.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_mobile_ref.png    475    655    960    577

Make Mobile 3Shape CenterNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonCenter
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/3dShape/CenterNavigation_mobile.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_mobile_ref.png    475    655    960    577
    Set Window Size    1880    1080
    Sleep    2s


Make Desktop Onyceph TopNavigation Test Screenshot
    Sleep    2s
    Execute Javascript    document.getElementsByClassName('Headline-iv4yf7-0 TreatmentPlanV2__HeadlineBlueBoldLeft-r1bz9m-1 glGpZe')[1].scrollIntoView()
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    Select Frame    xpath=//*[@title="Behandlungsvorschlag"]
    SeleniumLibrary.Click element    id=blink
    SeleniumLibrary.Click element    id=moveButtonTop
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/TopNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/Onyceph/TopNavigation_desktop.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/TopNavigation_desktop_ref.png    475    655    960    577

Make Desktop Onyceph LeftNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonLeft
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/Onyceph/LeftNavigation_desktop.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_desktop_ref.png    475    655    960    577

Make Desktop Onyceph RightNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonRight
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/Onyceph/RightNavigation_desktop.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_desktop_ref.png    475    655    960    577

Make Desktop Onyceph BottomNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonBottom
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/Onyceph/BottomNavigation_desktop.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_desktop_ref.png    475    655    960    577

Make Desktop Onyceph CenterNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonCenter
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/Onyceph/CenterNavigation_desktop.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_desktop_ref.png    475    655    960    577

Make Mobile Onyceph TopNavigation Test Screenshot
    Set Window Size    375    950
    Reload Page
    Sleep    2s
    Execute Javascript    document.getElementsByClassName('Headline-iv4yf7-0 TreatmentPlanV2__HeadlineBlueBoldLeft-r1bz9m-1 glGpZe')[1].scrollIntoView()
    Select Frame    xpath=//*[@title="Behandlungsvorschlag"]
    SeleniumLibrary.Click element    id=blink
    SeleniumLibrary.Click element    id=moveButtonTop
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/TopNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/Onyceph/TopNavigation_mobile.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/TopNavigation_mobile_ref.png    475    655    960    577

Make Mobile Onyceph LeftNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonLeft
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/Onyceph/LeftNavigation_mobile.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_mobile_ref.png    475    655    960    577

Make Mobile Onyceph RightNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonRight
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/Onyceph/RightNavigation_mobile.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_mobile_ref.png    475    655    960    577

Make Mobile Onyceph BottomNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonBottom
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/Onyceph/BottomNavigation_mobile.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_mobile_ref.png    475    655    960    577

Make Mobile Onyceph CenterNavigation Test Screenshot
    SeleniumLibrary.Click element    id=moveButtonCenter
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    ./test-elements-screenshots/Onyceph/CenterNavigation_mobile.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_mobile_ref.png    475    655    960    577


Desktop 3Shape TopNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/TopNavigation_desktop_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/TopNavigation_desktop.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/TopNavigation_desktop_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/TopNavigation_desktop_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/TopNavigation_desktop.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/TopNavigation_desktop.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/TopNavigation_desktop_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/TopNavigation_desktop_difference.png

Desktop 3Shape LeftNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_desktop_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/LeftNavigation_desktop.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/LeftNavigation_desktop_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_desktop_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/LeftNavigation_desktop.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/LeftNavigation_desktop.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_desktop_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/LeftNavigation_desktop_difference.png

Desktop 3Shape RightNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_desktop_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/RightNavigation_desktop.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/RightNavigation_desktop_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_desktop_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/RightNavigation_desktop.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/RightNavigation_desktop.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_desktop_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/RightNavigation_desktop_difference.png

Desktop 3Shape BottomNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_desktop_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/BottomNavigation_desktop.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/BottomNavigation_desktop_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_desktop_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/BottomNavigation_desktop.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/BottomNavigation_desktop.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_desktop_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/BottomNavigation_desktop_difference.png

Desktop 3Shape CenterNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_desktop_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/CenterNavigation_desktop.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/CenterNavigation_desktop_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_desktop_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/CenterNavigation_desktop.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/CenterNavigation_desktop.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_desktop_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/CenterNavigation_desktop_difference.png


Mobile 3Shape TopNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/TopNavigation_mobile_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/TopNavigation_mobile.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/TopNavigation_mobile_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/TopNavigation_mobile_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/TopNavigation_mobile.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/TopNavigation_mobile.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/TopNavigation_mobile_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/TopNavigation_mobile_difference.png

Mobile 3Shape LeftNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_mobile_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/LeftNavigation_mobile.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/LeftNavigation_mobile_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_mobile_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/LeftNavigation_mobile.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/LeftNavigation_mobile.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_mobile_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/LeftNavigation_mobile_difference.png

Mobile 3Shape RightNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_mobile_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/RightNavigation_mobile.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/RightNavigation_mobile_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_mobile_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/RightNavigation_mobile.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/RightNavigation_mobile.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_mobile_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/RightNavigation_mobile_difference.png

Mobile 3Shape BottomNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_mobile_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/BottomNavigation_mobile.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/BottomNavigation_mobile_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_mobile_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/BottomNavigation_mobile.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/BottomNavigation_mobile.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_mobile_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/BottomNavigation_mobile_difference.png

Mobile 3Shape CenterNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_mobile_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/CenterNavigation_mobile.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/CenterNavigation_mobile_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_mobile_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/CenterNavigation_mobile.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/CenterNavigation_mobile.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_mobile_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/3dShape/CenterNavigation_mobile_difference.png

Desktop Onyceph TopNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/TopNavigation_desktop_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/TopNavigation_desktop.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/TopNavigation_desktop_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/TopNavigation_desktop_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/TopNavigation_desktop.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/TopNavigation_desktop.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/TopNavigation_desktop_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/TopNavigation_desktop_difference.png

Desktop Onyceph LeftNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_desktop_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/LeftNavigation_desktop.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/LeftNavigation_desktop_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_desktop_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/LeftNavigation_desktop.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/LeftNavigation_desktop.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_desktop_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/LeftNavigation_desktop_difference.png

Desktop Onyceph RightNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_desktop_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/RightNavigation_desktop.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/RightNavigation_desktop_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_desktop_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/RightNavigation_desktop.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/RightNavigation_desktop.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_desktop_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/RightNavigation_desktop_difference.png

Desktop Onyceph BottomNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_desktop_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/BottomNavigation_desktop.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/BottomNavigation_desktop_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_desktop_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/BottomNavigation_desktop.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/BottomNavigation_desktop.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_desktop_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/BottomNavigation_desktop_difference.png

Desktop Onyceph CenterNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_desktop_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/CenterNavigation_desktop.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/CenterNavigation_desktop_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_desktop_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/CenterNavigation_desktop.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/CenterNavigation_desktop.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_desktop_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/CenterNavigation_desktop_difference.png


Mobile Onyceph TopNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/TopNavigation_mobile_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/TopNavigation_mobile.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/TopNavigation_mobile_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/TopNavigation_mobile_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/TopNavigation_mobile.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/TopNavigation_mobile.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/TopNavigation_mobile_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/TopNavigation_mobile_difference.png

Mobile Onyceph LeftNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_mobile_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/LeftNavigation_mobile.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/LeftNavigation_mobile_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_mobile_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/LeftNavigation_mobile.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/LeftNavigation_mobile.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_mobile_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/LeftNavigation_mobile_difference.png

Mobile Onyceph RightNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_mobile_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/RightNavigation_mobile.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/RightNavigation_mobile_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_mobile_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/RightNavigation_mobile.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/RightNavigation_mobile.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_mobile_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/RightNavigation_mobile_difference.png

Mobile Onyceph BottomNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_mobile_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/BottomNavigation_mobile.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/BottomNavigation_mobile_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_mobile_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/BottomNavigation_mobile.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/BottomNavigation_mobile.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_mobile_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/BottomNavigation_mobile_difference.png

Mobile Onyceph CenterNavigation Comparison
    ${OUTPUT}=    Run    compare -metric rmse C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_mobile_ref.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/CenterNavigation_mobile.png ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/CenterNavigation_mobile_difference.png
    ${pixel_diff}    ${percentage_diff} =   Split String    ${OUTPUT}   ${SPACE}    1
    ${percentage_diff} =    Remove String    ${percentage_diff}    (    )
    Log    ${pixel_diff}
    Log    ${percentage_diff}
    ${ImageMagick_RESULT}    Evaluate    ${percentage_diff} == 0
    ${openCV_OUTPUT}=    compare image    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_mobile_ref.png    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/CenterNavigation_mobile.png
    Log    ${openCV_OUTPUT}
    ${openCV_RESULT}    Evaluate    ${openCV_OUTPUT} == 0.0
    ${Common_RESULT} =    Set Variable If
    ...    '${openCV_RESULT}' == 'True' or '${ImageMagick_RESULT}' == 'True'    True
    ...    '${openCV_RESULT}' == 'False' and '${ImageMagick_RESULT}' == 'False'    False
    Run Keyword And Continue On Failure    Should be True    ${Common_RESULT}
    Log    ${Common_RESULT}
    Run keyword if    '${Common_RESULT}' == 'True'
    ...    Run keywords
    ...    Move File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/CenterNavigation_mobile.png    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_mobile_ref.png
    ...    AND    Remove File    ./Reports/${country}_ScreenshotElementComparison_${browser}/test-elements-screenshots/Onyceph/CenterNavigation_mobile_difference.png
