*** Settings ***
Resource                                                    ${EXECDIR}${/}RESOURCE${/}COMMON.robot

Test Template                                               Create Client Template
Test Teardown                                               Close Browser

*** Keywords ***
Create Client Template
    [Arguments]                                             ${firstname}    ${middlename}   ${lastname}     ${mobile_number}   ${expected_url}     @{expected_display}
    SELLIB.Open Browser                                     ${MIFOS_LOGIN_PAGE_URL}                                                     ${DEFAULT_BROWSER}
    Sleep                                                   ${DEFAULT_TIME}
    Login User                                              ${INPUT_LOGIN['VALID_USERNAME']}                                            ${INPUT_LOGIN['VALID_PASSWORD']}
    SELLIB.Wait Until Page Contains                         ${SPIELS_LOGIN['VALID_LOGIN_WELCOME_MESSAGE']}
    IF  '${mobile_number}' == '${EMPTY}'
        ${mobile_number}                                        Generate Random Mobile Number
    END
    Create Client                                           ${firstname}    ${middlename}   ${lastname}     ${mobile_number}
    SELLIB.Wait Until Location Contains                     ${expected_url}     ${MAX_TIMEOUT}
    SELLIB.Wait Until Element Is Visible                    ${expected_display[0]}  ${MAX_TIMEOUT}
    SELLIB.Wait Until Element Contains                      ${expected_display[0]}  ${expected_display[1]}

*** Test Cases ***
Valid Client Creation
    [Tags]  valid-client-creation
    ${VALID_INPUT_CLIENT_INFO['FIRSTNAME']}                 ${VALID_INPUT_CLIENT_INFO['MIDDLENAME']}                                    ${VALID_INPUT_CLIENT_INFO['LASTNAME']}
...                                                         ${EMPTY}                                                                    ${VIEW_CLIENT_URL}
...                                                         ${PAGE_CLIENT['TITLE_VIEW_CLIENT']}                                         ${VALID_INPUT_CLIENT_INFO['FIRSTNAME']} ${VALID_INPUT_CLIENT_INFO['MIDDLENAME']} ${VALID_INPUT_CLIENT_INFO['LASTNAME']}
Invalid Client Creation - Blank First Name
    [Tags]  invalid-client-creation
    ${EMPTY}                                                ${VALID_INPUT_CLIENT_INFO['MIDDLENAME']}                                    ${VALID_INPUT_CLIENT_INFO['LASTNAME']}
...                                                         ${EMPTY}                                                                    ${CREATE_CLIENT_URL}
...                                                         ${COMPONENT_CREATE_CLIENT_ERROR['REQUIRED_FIRSTNAME']}                      ${ERROR_CREATE_CLIENT['REQUIRED_FIELD']}
Invalid Client Creation - Blank Last Name
    [Tags]  invalid-client-creation
    ${VALID_INPUT_CLIENT_INFO['FIRSTNAME']}                 ${VALID_INPUT_CLIENT_INFO['MIDDLENAME']}                                    ${EMPTY}
...                                                         ${EMPTY}                                                                    ${CREATE_CLIENT_URL}
...                                                         ${COMPONENT_CREATE_CLIENT_ERROR['REQUIRED_LASTNAME']}                       ${ERROR_CREATE_CLIENT['REQUIRED_FIELD']}
Invalid Client Creation - Invalid Mobile
    [Tags]  invalid-client-creation
    ${VALID_INPUT_CLIENT_INFO['FIRSTNAME']}                 ${VALID_INPUT_CLIENT_INFO['MIDDLENAME']}                                    ${VALID_INPUT_CLIENT_INFO['LASTNAME']}
...                                                         ${INVALID_INPUT_CLIENT_INFO['MOBILE']}                                      ${CREATE_CLIENT_URL}
...                                                         ${COMPONENT_CREATE_CLIENT_ERROR['NUMERIC_MOBILE']}                          ${ERROR_CREATE_CLIENT['NUMERIC_INPUT']}