*** Settings ***
Documentation       Test case 1
Library             SeleniumLibrary

*** Test Cases ***

Valid Login
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    # check if login page
    Page Should Contain Button    login-button
    # input username
    Input Text    user-name    standard_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # check if products page
    Element Text Should Be    class:title    PRODUCTS
    # close browser
    [Teardown]    Close Browser