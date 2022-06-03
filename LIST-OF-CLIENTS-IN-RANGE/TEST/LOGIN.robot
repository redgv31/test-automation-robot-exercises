*** Settings ***
Resource                                    ${EXECDIR}${/}RESOURCE${/}COMMON.robot

Test Teardown                               Close Browser

*** Keywords ***
Login With Invalid Credentials
    [Arguments]                             ${uname}                                                ${pass}
    Open Browser                            ${MIFOS_LOGIN_PAGE_URL}                                 ${DEFAULT_BROWSER}
    Sleep                                   ${DEFAULT_TIME}
    Login User                              ${uname}                                                ${pass}
    Wait Until Element Contains             ${COMPONENT_LOGIN_ERROR['ALERT_BOX']}
    ...                                     ${SPIELS_LOGIN['INVALID_LOGIN_ERROR_MESSAGE']}
    Close Browser

*** Test Cases ***
Valid Login
    [Tags]  valid-login
    Open Browser                            ${MIFOS_LOGIN_PAGE_URL}                                 ${DEFAULT_BROWSER}
    Sleep                                   ${DEFAULT_TIME}
    Login User                              ${INPUT_LOGIN['VALID_USERNAME']}
    ...                                     ${INPUT_LOGIN['VALID_PASSWORD']}
    Wait Until Page Contains                ${SPIELS_LOGIN['VALID_LOGIN_WELCOME_MESSAGE']}

Invalid Login
    [Tags]  invalid-login
    [Template]                              Login With Invalid Credentials
    ${INPUT_LOGIN['INVALID_USERNAME']}      ${INPUT_LOGIN['VALID_PASSWORD']}
    ${INPUT_LOGIN['VALID_USERNAME']}        ${INPUT_LOGIN['INVALID_PASSWORD']}
    ${INPUT_LOGIN['INVALID_USERNAME']}      ${INPUT_LOGIN['INVALID_PASSWORD']}
    ${EMPTY}                                ${INPUT_LOGIN['INVALID_PASSWORD']}
    ${INPUT_LOGIN['INVALID_PASSWORD']}      ${EMPTY}
    ${EMPTY}                                ${EMPTY}

