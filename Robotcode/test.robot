*** Settings ***
Documentation       Test cases
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

Locked User Login
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    # check if login page
    Page Should Contain Button    login-button
    # input username
    Input Text    user-name    locked_out_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # check if products page
    Element Text Should Be    class:error-message-container    Epic sadface: Sorry, this user has been locked out.
    # close browser
    [Teardown]    Close Browser

Wrong Password
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    # check if login page
    Page Should Contain Button    login-button
    # input username
    Input Text    user-name    locked_out_user
    # input password
    Input Password    password    asdfghjkl
    # click login button
    Click Button    login-button
    # check if products page
    Element Text Should Be    class:error-message-container    Epic sadface: Username and password do not match any user in this service
    # close browser
    [Teardown]    Close Browser

Problem user
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    # check if login page
    Page Should Contain Button    login-button
    # input username
    Input Text    user-name    problem_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # wait to load
    Set Selenium Implicit Wait  1 second
    # should have image
    Page Should Contain Image   /static/media/sl-404.168b1cce.jpg
    # close browser
    [Teardown]    Close Browser

A to Z
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
    # select
    Select From List By Value   class:product_sort_container    az
    # Check text
    Element Text Should Be  class:active_option     NAME (A TO Z)
Z to A
    # select
    Select From List By Value   class:product_sort_container    za
    # Check text
    Element Text Should Be  class:active_option     NAME (Z TO A)
Low High
# select
    Select From List By Value   class:product_sort_container    lohi
    # Check text
    Element Text Should Be  class:active_option     PRICE (LOW TO HIGH)
    # close browser
High Low
    Select From List By Value   class:product_sort_container       hilo
    # Check text
    Element Text Should Be  class:active_option     PRICE (HIGH TO LOW)
    # close browser
    [Teardown]    Close Browser

