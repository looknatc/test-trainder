*** Settings ***
Library     SeleniumLibrary
# Test Teardown    Close All Browsers
Resource    ../../testdata/environment.robot
Resource    ../../testdata/test_data.robot


*** Test Cases ***
Open Browser To Form
    [Tags]    all input
    Open Browser    ${WEB_URL}     chrome
    # To open browser without closing
    # Open Browser
    # ...    https://form.jotform.com/212934779973474
    # ...    chrome
    # ...    options=add_experimental_option("detach", True)
    Maximize Browser Window

Wait student registration load complete
    # Open Browser    ${WEB_URL}     chrome
    Wait Until Page Contains    Hello 

Send input to form
    Open Browser    ${WEB_URL}     chrome
    Wait Until Page Contains    Hello 
    Input text     //*[@name='username']    user1000
    ${username}=    Get Value    //*[@name='username']
    Should Be Equal    ${username}    user1000

    Click Element    //*[@class='h-6 w-6']
     Sleep    0.5s
    # Wait Until Keyword Succeeds    10s    1s    Element Should Be Visible    css=button[id='headlessui-listbox-button-:r0:']
    # ${aria_expand}    Get Element Attribute    css=button[id='headlessui-listbox-button-:r0:']    aria-expand
    # Wait Until Keyword Succeeds    10s    1s    Should Be Equal As Strings    ${aria_expand}    true

    Click Element    //*[@class='inline-flex items-center']
    
    # ${UserType}=    Get Value    //*[@class='block text-black']
    # Should Be Equal    ${UserType}    Trainee

    Input text     //*[@name='password']    123456789
    ${password}=    Get Value    //*[@name='password']
    Should Be Equal    ${password}    123456789

    #password not match 
    Input text     //*[@name='confirmPassword']    987654321
    ${password}=    Get Value    //*[@name='confirmPassword']
    Should Be Equal    ${password}    987654321

    Wait Until Page Contains    Password does not match. 
    Sleep    0.5s


    Input text     //*[@name='confirmPassword']    123456789
    ${password}=    Get Value    //*[@name='confirmPassword']
    Should Be Equal    ${password}    123456789

    # input name
    Input text     //*[@name='firstname']    nat
    ${firstname}=    Get Value    //*[@name='firstname']
    Should Be Equal    ${firstname}    nat

    Input text     //*[@name='lastname']    haha
    ${lastname}=    Get Value    //*[@name='lastname']
    Should Be Equal    ${lastname}    haha

    #input date  
    # Input text     //*[@name='birthdate']    2000-12-12
    # ${birthdate}=    Get Value    //*[@name='birthdate']
    # Should Be Equal    ${birthdate}    haha

    Input text     //*[@name='citizenId']    1234567890123
    ${citizenId}=    Get Value    //*[@name='citizenId']
    Should Be Equal    ${citizenId}    1234567890123

    Input text     //*[@name='phoneNumber']    0984358769
    ${phoneNumber}=    Get Value    //*[@name='phoneNumber']
    Should Be Equal    ${phoneNumber}    0984358769

    Input text     //*[@name='address']    Somerset Road, 111 Somerset, Singapore
    ${address}=    Get Value    //*[@name='address']
    Should Be Equal    ${address}   Somerset Road, 111 Somerset, Singapore
    
    

    Click Element    //*[@type='submit']
    


    # Input text    //*[@class='w-full py-2.5 m-2 pl-3.5 block border border-gray rounded-xl pl-3.5 pr-12']    user1000
    # ${username}=    Get Value    //*[@class='w-full py-2.5 m-2 pl-3.5 block border border-gray rounded-xl pl-3.5 pr-12']
    # Should Be Equal    ${username}    user1000
    # [Tags]    all input
    # Open Browser    ${WEB_URL}     chrome
    # Maximize Browser Window




    # Input text    //*[@class='w-full py-2.5 m-2 pl-3.5 block border border-gray rounded-xl pl-3.5 pr-12']    user1000
    # ${username}=    Get Value    //*[@class='w-full py-2.5 m-2 pl-3.5 block border border-gray rounded-xl pl-3.5 pr-12']
    # Should Be Equal    ${username}    user1000

    # Input text     //*[@name='username']    user1000
    # ${username}=    Get Value    //*[@name='username']
    # Should Be Equal    ${username}    user1000

    # Click Element    //*[@class='w-1/2 py-2.5 px-3 mt-10 mb-3 bg-pink hover:bg-pink-dark text-white shadow rounded-xl']


    # Select From List by Value    //*[@id='input_3']    Trainer
    # ${ีuserType}=    Get Value    //*[@id='input_3']
    # Should Be Equal    ${userType}    Male

    # Input text    //*[@class='w-full py-2.5 m-2 pl-3.5 block border border-gray rounded-xl px-3.5']    nat
    # ${firstname}=    Get Value    //*[@class='w-full py-2.5 m-2 pl-3.5 block border border-gray rounded-xl px-3.5']
    # Should Be Equal    ${firstname}    nat

    # Input text    //*[@class='w-full py-2.5 m-2 pl-3.5 block border border-gray rounded-xl px-3.5']    nat
    # ${firstname}=    Get Value    //*[@class='w-full py-2.5 m-2 pl-3.5 block border border-gray rounded-xl px-3.5']
    # Should Be Equal    ${firstname}    nat

#     Input text    //*[@id='input_6']    aaa@gmail.com
#     ${email}=    Get Value    //*[@id='input_6']
#     Should Be Equal    ${email}    aaa@gmail.com

#     Click Element    //*[@id='label_input_51_0']

# Fill student id with text
#     Input text    //*[@id='input_14']    helloworld
#     ${student_id}=    Get Value    //*[@id='input_14']
#     Should Be Equal    ${student_id}    helloworld

#     Wait Until Element Contains    //*[@id='id_14']//*[@class='form-error-message']    Enter a valid student id

# Last Name field should be required
#     Click Element    //*[@id='input_49']
#     Click Element    //*[@id='input_14']

#     Wait Until Element Contains    //*[@id='id_49']//*[@class='form-error-message']    ${test_data_error_message}

# Fill Last Name
#     Input text    //*[@id='input_49']    Jiravaranun
#     ${lastname}=    Get Value    //*[@id='input_49']
#     Should Be Equal    ${lastname}    Jiravaranun

# After submit it should show correct message
#     Click Element    //*[@id='form-pagebreak-next_76']

#     Wait Until Element Contains    //*[@id='text_84']       ${test_data_sccess_submit_message}




# *** Settings ***
# Library    SeleniumLibrary
# Test Teardown    Close All Browsers

# Resource    ../../testdata/environment.robot
# Resource    ../../testdata/test_data.robot
# Resource    ../../keywords/ui/page/homepage.robot

# *** Test Cases ***
# Verify registration form with all input field
#     [Tags]    All Input
#     Open Browser    https://form.jotform.com/212934779973474    chrome
#     Maximize Browser Window

# Wait student registration load complete
#     Open Browser    https://form.jotform.com/212934779973474    chrome
#     Wait Until Element Contains    //*[@id='header_1']    Student Registration Form

# Input
#     Open Browser    https://form.jotform.com/212934779973474    chrome
#     Input and verify firstname
#     Input and verify lastname
#     Input and verify gender with male
#     Input and verify mobile_number
#     Input and verify email
    
#     # Input text    //*[@id='input_48']    StudentFirstName
#     # ${lastname}=    Get Value    //*[@id='input_48']
#     # Should Be Equal    ${lastname}    StudentFirstName

#     # Select From List by Value    //*[@id='input_3']    Male
#     # ${gender}=    Get Value    //*[@id='input_3']
#     # Should Be Equal    ${gender}    Male

#     # Input text    //*[@id='input_27_full']    0812345678
#     # ${mobile_number}=    Get Value    //*[@id='input_27_full']
#     # Should Be Equal    ${mobile_number}    (081) 234-5678

#     # Input text    //*[@id='input_6']    a@gmail.com
#     # ${email}=    Get Value    //*[@id='input_6']
#     # Should Be Equal    ${email}    a@gmail.com

#     # Click Element    //*[@id='label_input_51_0']

# Lastname is required
#     Open Browser    https://form.jotform.com/212934779973474    chrome
#     Click Element    //*[@id='input_49']
#     Click Element    //*[@id='input_48']
#     Wait Until Element Contains    //*[@class='form-error-message']    ${test_data_error_message}

# Student ID contain only number
#     Open Browser    https://form.jotform.com/212934779973474    chrome
#     Input text    //*[@id='input_14']    abc
#     ${student_id}=    Get Value    //*[@id='input_14']
#     Should Be Equal    ${student_id}    abc

#     Wait Until Element Contains    //*[@id='id_14']//*[@class='form-error-message']    Enter a valid student id

# Submit correct data
#     Open Browser    https://form.jotform.com/212934779973474    chrome
#     Click Element    //*[@id='form-pagebreak-next_76']

#     Wait Until Element Contains    //*[@id='text_84']    ${test_data_sccess_submit_message}
