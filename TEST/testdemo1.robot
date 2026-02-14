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

validate e2e for mobile shopping
    click on Login
    Validate Successful Login
    click on mobile    Samsung galaxy s7
    add to cart
    go to cart
    place order


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




















