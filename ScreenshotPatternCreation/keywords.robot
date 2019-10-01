*** Settings ***
Library           cropScreen.py
Resource          ../keywords.robot

*** Keywords ***

Capture and crop page screenshot
    [Documentation]  Captures a page screenshot with the given ``filename`` and
    ...              crops it to match the combined bounding box of the
    ...              elements matching the given ``locator``.
    ...
    ...              Requires at least two arguments
    ...              (``filename`` and ``locator``).
    [Arguments]  ${filename}  ${locator}
    Capture page screenshot  ${filename}
    Crop page screenshot  ${filename}  ${locator}

Crop page screenshot
    [Arguments]  ${filename}  ${locator}
    ${left}=    Execute Javascript    return document.${locator}.getBoundingClientRect().left
    ${top}=    Execute Javascript    return document.${locator}.getBoundingClientRect().top
    ${width}=    Execute Javascript    return document.${locator}.getBoundingClientRect().width
    ${height}=    Execute Javascript    return document.${locator}.getBoundingClientRect().height
    ${left} =    Evaluate    ${left}-${CROP_MARGIN}
    ${top} =    Evaluate    ${top}-${CROP_MARGIN}
    ${width} =    Evaluate    ${width}+${CROP_MARGIN}*2
    ${height} =    Evaluate    ${height}+${CROP_MARGIN}*2
    @{dimensions} =    Create List    ${left}    ${top}    ${width}    ${height}
    Log    ${dimensions}
    crop image    ${OUTPUT_DIR}    ${filename}    @{dimensions}

Capture and crop element screenshot
    [Arguments]    ${filename}    ${left}    ${top}    ${width}    ${height}
    Capture Page Screenshot    ${filename}
    crop element    ${OUTPUT_DIR}    ${filename}    ${left}    ${top}    ${width}    ${height}

#Cover image element
    #[Arguments]    ${filename}    ${x0}    ${y0}    ${x1}    ${y1}
    #cover image    ${OUTPUT_DIR}    ${filename}    ${x0}    ${y0}    ${x1}    ${y1}

Make Desktop 3Shape TopNavigation Reference Screenshot
    Sleep    2s
    Execute Javascript    document.getElementsByClassName('Headline-iv4yf7-0 TreatmentPlanV2__HeadlineBlueBoldLeft-r1bz9m-1 glGpZe')[1].scrollIntoView()
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    Select Frame    xpath=//*[@title="Behandlungsvorschlag"]
    SeleniumLibrary.Click element    id=blink
    SeleniumLibrary.Click element    id=moveButtonTop
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/TopNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/TopNavigation_desktop_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/TopNavigation_desktop_ref.png    475    655    960    577

Make Desktop 3Shape LeftNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonLeft
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_desktop_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_desktop_ref.png    475    655    960    577

Make Desktop 3Shape RightNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonRight
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_desktop_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_desktop_ref.png    475    655    960    577

Make Desktop 3Shape BottomNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonBottom
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_desktop_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_desktop_ref.png    475    655    960    577

Make Desktop 3Shape CenterNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonCenter
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_desktop_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_desktop_ref.png    475    655    960    577

Make Mobile 3Shape TopNavigation Reference Screenshot
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
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/TopNavigation_mobile_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/TopNavigation_mobile_ref.png    475    655    960    577

Make Mobile 3Shape LeftNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonLeft
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_mobile_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/LeftNavigation_mobile_ref.png    475    655    960    577

Make Mobile 3Shape RightNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonRight
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_mobile_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/RightNavigation_mobile_ref.png    475    655    960    577

Make Mobile 3Shape BottomNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonBottom
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_mobile_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/BottomNavigation_mobile_ref.png    475    655    960    577

Make Mobile 3Shape CenterNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonCenter
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_mobile_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/3dShape/CenterNavigation_mobile_ref.png    475    655    960    577
    Set Window Size    1880    1080
    Sleep    2s


Make Desktop Onyceph TopNavigation Reference Screenshot
    Sleep    2s
    Execute Javascript    document.getElementsByClassName('Headline-iv4yf7-0 TreatmentPlanV2__HeadlineBlueBoldLeft-r1bz9m-1 glGpZe')[1].scrollIntoView()
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    Select Frame    xpath=//*[@title="Behandlungsvorschlag"]
    SeleniumLibrary.Click element    id=blink
    SeleniumLibrary.Click element    id=moveButtonTop
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/TopNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/TopNavigation_desktop_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/TopNavigation_desktop_ref.png    475    655    960    577

Make Desktop Onyceph LeftNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonLeft
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_desktop_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_desktop_ref.png    475    655    960    577

Make Desktop Onyceph RightNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonRight
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_desktop_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_desktop_ref.png    475    655    960    577

Make Desktop Onyceph BottomNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonBottom
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_desktop_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_desktop_ref.png    475    655    960    577

Make Desktop Onyceph CenterNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonCenter
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_desktop_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_desktop_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_desktop_ref.png    475    655    960    577

Make Mobile Onyceph TopNavigation Reference Screenshot
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
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/TopNavigation_mobile_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/TopNavigation_mobile_ref.png    475    655    960    577

Make Mobile Onyceph LeftNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonLeft
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_mobile_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/LeftNavigation_mobile_ref.png    475    655    960    577

Make Mobile Onyceph RightNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonRight
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_mobile_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/RightNavigation_mobile_ref.png    475    655    960    577

Make Mobile Onyceph BottomNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonBottom
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_mobile_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/BottomNavigation_mobile_ref.png    475    655    960    577

Make Mobile Onyceph CenterNavigation Reference Screenshot
    SeleniumLibrary.Click element    id=moveButtonCenter
    Sleep    2s
    Set Suite Variable    ${CROP_MARGIN}    0
    Sleep    5s
    #Capture Page Screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_mobile_ref.png
    Run Keyword And Continue On Failure    Capture and crop page screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_mobile_ref.png    getElementsByTagName('body')[0]
    #Run Keyword And Continue On Failure    Capture and crop element screenshot    C:/reference-elements-screenshots/${browser}/${country}_ScreenshotElementPattern/Onyceph/CenterNavigation_mobile_ref.png    475    655    960    577
