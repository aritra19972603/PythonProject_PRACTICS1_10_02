*** Settings ***
Documentation      To validate the Login Form
Library            SeleniumLibrary
Library            BuiltIn
Library            OperatingSystem
Library            Collections
Library            String
Test Setup         open the browser with the url
#Test Teardown      Close Browser Session
Resource           resource.robot




*** Test Cases ***

validate e2e for shopping
    click on Login
    Validate Successful Login
    click on mobile    Samsung galaxy s7
    add to cart
    go to cart
    place order
    Logout


*** Keywords ***

click on Login
    Click Element    login2
    Wait Until Element Is Visible    loginusername


Validate Successful Login
    Input Text        loginusername    test
    Input Password    loginpassword    test
    Click Button      xpath=//button[text()='Log in']
    sleep    5
    Wait Until Element Is Visible    xpath=//a[text()='Phones']


click on mobile
    [Arguments]    ${cardname}
    Click Element        xpath=//a[text()='Phones']
    Sleep    2
    ${elements}=    Get Webelements    xpath=//h4[@class='card-title']
    ${actualList}=    Create List
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Log    ${text}
        Append To List    ${actualList}    ${text}
    END
    ${index}=    Set Variable    0
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Exit For Loop If    '${cardname}'=='${text}'
        ${index}=    Evaluate    ${index}+1
    END

    Click Element    xpath=//a[contains(text(),'${cardname}')]



add to cart
    Wait Until Page Contains Element    xpath=//a[contains(text(),'Add to cart')]
    Click Element    xpath=//a[contains(text(),'Add to cart')]
    Sleep    2
    Handle Alert    accept


go to cart
    Click Element    id:cartur
    Sleep    2


place order
    Click Button    xpath=//button[text()='Place Order']
    Sleep    2

    Input Text    name    test user
    Input Text    country    India
    Input Text    city        kolkata
    Input Text    card        1234567890
    Input Text    month        02
    Input Text    year        2029
    Click Button    xpath=//button[text()='Purchase']

    Sleep    2


    Click Button    xpath=//button[text()='OK']

    Sleep    5

Logout
    Click Element    logout2





















