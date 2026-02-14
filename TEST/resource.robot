*** Settings ***
Documentation    A resource file with reusable keywords and variables
...              the sys specific keyword created from our own domain
...              specific language.The utilize keywords provided
...              by the imported SeleniumLibrary
Library          SeleniumLibrary
Library          OperatingSystem



*** Variables ***
${user_name}            test
${valid_password}       test
${url}                  https://www.demoblaze.com/index.html

*** Keywords ***
open the browser with the url
    Create Webdriver    Chrome    
    Go To                ${url}

Close Browser Session
    Close Browser