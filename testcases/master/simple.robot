*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library    String
# Test Teardown    Close All Browsers
Resource    ../../testdata/environment.robot
Resource    ../../testdata/test_data.robot


*** Keywords ***
Setup username
    ${username}=    Set Variable    
    Set Variable    ${username}    test00
Input username 1
    Input text     //*[@name='username']   ${USERNAME} 
    ${_username}=    Get Value    //*[@name='username']
    Should Be Equal    ${_username}   ${USERNAME} 
    Sleep    0.5s

Input username 2
    Input text     //*[@name='username']   ${USERNAME2} 
    ${_username}=    Get Value    //*[@name='username']
    Should Be Equal    ${_username}   ${USERNAME2} 
    Sleep    0.5s
Input password 
    Input text     //*[@name='password']    123456789
    ${password}=    Get Value    //*[@name='password']
    Should Be Equal    ${password}    123456789
    Sleep    0.5s
Input password 0
    Input text     //*[@name='password']    12345
    ${password}=    Get Value    //*[@name='password']
    Should Be Equal    ${password}    12345
    Sleep    0.5s


Input confirm password correct 0
    Input text     //*[@name='confirmPassword']    12345
    ${password}=    Get Value    //*[@name='confirmPassword']
    Should Be Equal    ${password}    12345
    Sleep    0.5s
Input confirm password incorrect 0
    Input text     //*[@name='confirmPassword']    98765
    ${password}=    Get Value    //*[@name='confirmPassword']
    Should Be Equal    ${password}    98765
    Sleep    0.5s
Input confirm password correct 
    Input text     //*[@name='confirmPassword']    123456789
    ${password}=    Get Value    //*[@name='confirmPassword']
    Should Be Equal    ${password}    123456789
    Sleep    0.5s
Input confirm password incorrect 
    Input text     //*[@name='confirmPassword']    987654321
    ${password}=    Get Value    //*[@name='confirmPassword']
    Should Be Equal    ${password}    987654321
    Sleep    0.5s
Click UserType Trainer
    Click Element    //*[@id='userType_arrow']
    Click Element    //*[@id='userType_choice_1']
    Click Element At Coordinates    //*[@name='username']    0    0
    Sleep    0.5s

Click UserType Trainee
    Click Element    //*[@id='userType_arrow']
    Click Element    //*[@id='userType_choice_2']
    Click Element At Coordinates    //*[@name='username']    0    0
    Sleep    0.5s

Click gender male
    Click Element    //*[@id='gender_arrow']
    Click Element    //*[@id='gender_choice_1']
    Click Element At Coordinates    //*[@name='username']    0    0
    Sleep    0.5s
Click gender female
    Click Element    //*[@id='gender_arrow']
    Click Element    //*[@id='gender_choice_2']
    Click Element At Coordinates    //*[@name='username']    0    0
    Sleep    0.5s
Click gender other
    Click Element    //*[@id='gender_arrow']
    Click Element    //*[@id='gender_choice_3']
    Click Element At Coordinates    //*[@name='username']    0    0
    Sleep    0.5s

Input date wrong
    Execute JavaScript  document.getElementById('birthdate').value = '2666-12-12'
    Sleep    0.5s

Input date 
    Execute JavaScript  document.getElementById('birthdate').value = '2000-12-12'
    Sleep    0.5s

Input firstname 
    Input text     //*[@name='firstname']    testFirstname
    ${firstname}=    Get Value    //*[@name='firstname']
    Should Be Equal    ${firstname}    testFirstname
    Sleep    0.5s
Input firstname wrong 
    Input text     //*[@name='firstname']    testFirstname1
    ${firstname}=    Get Value    //*[@name='firstname']
    Should Be Equal    ${firstname}    testFirstname1
    Sleep    0.5s

Input lastname wrong
    Input text     //*[@name='lastname']    testLastname1
    ${lastname}=    Get Value    //*[@name='lastname']
    Should Be Equal    ${lastname}    testLastname1
    Sleep    0.5s

Input lastname
    Input text     //*[@name='lastname']    testLastname
    ${lastname}=    Get Value    //*[@name='lastname']
    Should Be Equal    ${lastname}    testLastname
    Sleep    0.5s

Input citizenId wrong
    Input text     //*[@name='citizenId']    1234567890
    ${citizenId}=    Get Value    //*[@name='citizenId']
    Should Be Equal    ${citizenId}    1234567890
    Sleep    0.5s
Input citizenId 
    Input text     //*[@name='citizenId']    1234567890123
    ${citizenId}=    Get Value    //*[@name='citizenId']
    Should Be Equal    ${citizenId}    1234567890123
    Sleep    0.5s

Input phoneNumber wrong
    Input text     //*[@name='phoneNumber']    09843
    ${phoneNumber}=    Get Value    //*[@name='phoneNumber']
    Should Be Equal    ${phoneNumber}    09843
    Sleep    0.5s
Input phoneNumber 
    Input text     //*[@name='phoneNumber']    0984358769
    ${phoneNumber}=    Get Value    //*[@name='phoneNumber']
    Should Be Equal    ${phoneNumber}    0984358769
    Sleep    0.5s

Input address
    Input text     //*[@name='address']    วัดบางพลีใหญ่กลาง Bang Phli Yai, Bang Phli District, Samut Prakan, Thailand
    ${address}=    Get Value    //*[@name='address']
    Should Be Equal    ${address}   วัดบางพลีใหญ่กลาง Bang Phli Yai, Bang Phli District, Samut Prakan, Thailand
    
Submit    
    Click Element    //*[@type='submit']
Check disable 
    Submit
    Element Should Be Disabled    //*[@id="create_account_button"]


*** Test Cases ***
Open Browser To Form
    [Tags]    all input
    Open Browser    ${WEB_URL}     chrome

    Maximize Browser Window

Wait student registration load complete
    # Open Browser    ${WEB_URL}     chrome
    # Wait Until Page Contains    Hello 
    Open Browser    ${WEB_URL}     chrome

    Wait Until Page Contains    Welcome 
    Click Link    //*[@href="/account/signup"]
    # wait for loading
    Wait Until Page Contains    Hello 



Send input to form
    Open Browser    ${WEB_URL}     chrome

    Wait Until Page Contains    Welcome 
    Sleep    0.5s
    Click Link    //*[@href="/account/signup"]
    # wait for loading
    Wait Until Page Contains    Hello 
    Sleep    0.5s

    # Setup username
    Check disable 
    Input username 1
    
    Check disable 

    Click UserType Trainee
    Check disable 
    Input password 0
    Check disable 
    Input confirm password incorrect 0
    Check disable 
    Input confirm password correct 0
    Check disable 
    Input firstname wrong
    Check disable 
    Input lastname wrong
    Check disable 
    Input date wrong
    Check disable 
    Input citizenId wrong
    Check disable 
    Input phoneNumber wrong
    Check disable 
    Click gender female
    Check disable 
    Input address
    Submit
    # Sleep    2s

    #  citizenId format
    ${err}=    Get Element Attribute    //*[@name='citizenId']    validationMessage
    Should Be Equal    ${err}    Please match the requested format.
    Sleep    0.5s
    Input citizenId
    Submit
    # Sleep    2s

    #  phoneNumber format
    ${err}=    Get Element Attribute    //*[@name='phoneNumber']    validationMessage
    Should Be Equal    ${err}    Please match the requested format.
    Sleep    1s
    Input phoneNumber
    Submit

    # firstname format
    Sleep    1s
    ${alert_text}=    Handle Alert    timeout=10s
    Should Be Equal As Strings    ${alert_text}    firstName invalid
    
    # Handle Alert    accept
    Input firstname
    Submit

    # lastname format
    Sleep    1s
    ${alert_text}=    Handle Alert    timeout=10s
    Should Be Equal As Strings    ${alert_text}    lastName invalid 
    Input lastname
    Submit

    # date format 
    Sleep   1s
    ${alert_text}=    Handle Alert    timeout=10s
    Should Be Equal As Strings    ${alert_text}    date is After current time 
    Input date
    Submit

    Sleep    1s
    ${alert_text}=    Handle Alert    timeout=10s
    Should Be Equal As Strings    ${alert_text}    Password should be more than 8 characters 
    Input password 
    Check disable 
    Input confirm password incorrect 
    Check disable 
    Input confirm password correct 
    Submit

    # # resubmit
    Wait Until Page Contains    Welcome 
    Sleep    1s

    Click Link    //*[@href="/account/signup"]
    # wait for loading
    Wait Until Page Contains    Hello 
    Sleep    1s

    Input username 1
    Click UserType Trainee
    Input password
    Input confirm password correct
    Input firstname 
    Input lastname 
    Input date 
    Input citizenId 
    Input phoneNumber 
    Click gender female
    Input address
    Submit

    Sleep    1s
    ${alert_text}=    Handle Alert    timeout=10s
    Should Be Equal As Strings    ${alert_text}    error: user already existed 


    # Input text     //*[@name='username']   xxxx 
    # ${_username}=    Get Value    //*[@name='username']
    # Should Be Equal    ${_username}   xxxx 
    Input username 2
    Sleep    0.5s
    Submit
    Wait Until Page Contains    Welcome 
    Sleep    0.5s








    