*** Settings ***
Resource    keywords.robot


**Keywords**

Verify Our aligners section
    Run keyword unless    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//div[@class="footer-list-wrapper"]/div[1]/a[@href="/wie-es-funktioniert"]
    Run keyword unless    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//div[@class="footer-list-wrapper"]/div[2]/a[@href="/resultate"]
    Run keyword unless    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//div[@class="footer-list-wrapper"]/div[3]/a[@href="/unsere-experten"]
    Run keyword unless    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//div[@class="footer-list-wrapper"]/div[4]/a[@href="/location"]
    Run keyword unless    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//div[@class="footer-list-wrapper"]/div[5]/a[@href="/preise"]
    Run keyword unless    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//div[@class="footer-list-wrapper"]/div[6]/a[@href="/faq"]
    Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//footer/div[contains(@class, "DentaleDefaultDesktopFooter")]/div/div[1]/a[@href="/how-it-works"]
    Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//footer/div[contains(@class, "DentaleDefaultDesktopFooter")]/div/div[2]/a[@href="/results"]
    Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//footer/div[contains(@class, "DentaleDefaultDesktopFooter")]/div/div[3]/a[@href="/our-experts"]
    Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//footer/div[contains(@class, "DentaleDefaultDesktopFooter")]/div/div[4]/a[@href="/location"]
    Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//footer/div[contains(@class, "DentaleDefaultDesktopFooter")]/div/div[5]/a[@href="/prices"]
    Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//footer/div[contains(@class, "DentaleDefaultDesktopFooter")]/div/div[6]/a[@href="/faq"]
    Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//footer/div[contains(@class, "DentaleDefaultDesktopFooter")]/div/div[7]/a[@href="/"]


Verify PlusDental section
    Run keyword unless    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//div[contains(@class, 'DentaleDefaultDesktopFooter__NavLinkWrapper')]/a[contains (@href,"https://plusdental.de/careers")]
    Run keyword unless    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//div[contains(@class, 'DentaleDefaultDesktopFooter__NavLinkWrapper')]/a[@href="https://boards.greenhouse.io/sunshinesmile"]
    Run keyword unless    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//div[contains(@class, 'DentaleDefaultDesktopFooter__NavLinkWrapper')]/a[@href="/presse"]
    Run keyword unless    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//div[contains(@class, 'DentaleDefaultDesktopFooter__NavLinkWrapper')]/a[@href="/impressum"]
    Run keyword unless    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//div[contains(@class, 'DentaleDefaultDesktopFooter__NavLinkWrapper')]/a[@href="/datenschutz"]
    Run keyword unless    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//div[contains(@class, 'DentaleDefaultDesktopFooter__NavLinkWrapper')]/a[@href="/non-profit"]
    Run keyword unless    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//div[contains(@class, 'DentaleDefaultDesktopFooter__NavLinkWrapper')]/a[@href="/widerrufsbelehrung"]
    Run keyword unless    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//div[contains(@class, 'DentaleDefaultDesktopFooter__NavLinkWrapper')]/a[@href="/agb"]
    Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//footer/div[contains(@class, "DentaleDefaultDesktopFooter")]/div/div[1]/a[@href="/press"]
    Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//footer/div[contains(@class, "DentaleDefaultDesktopFooter")]/div/div[2]/a[@href="/imprint"]
    Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//footer/div[contains(@class, "DentaleDefaultDesktopFooter")]/div/div[3]/a[@href="/data-privacy"]
    Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//footer/div[contains(@class, "DentaleDefaultDesktopFooter")]/div/div[4]/a[@href="/non-profit"]
    Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//footer/div[contains(@class, "DentaleDefaultDesktopFooter")]/div/div[5]/a[@href="/cancellation-policy"]
    Run keyword if    '${country}' == 'uk'    SeleniumLibrary.Page should contain element    xpath=//footer/div[contains(@class, "DentaleDefaultDesktopFooter")]/div/div[6]/a[@href="/terms"]



    div[contains(@class, 'DentaleDefaultDesktopFooter__NavLinkWrapper')]
