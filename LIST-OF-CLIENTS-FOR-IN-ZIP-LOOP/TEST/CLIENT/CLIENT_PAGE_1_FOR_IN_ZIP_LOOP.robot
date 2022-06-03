*** Settings ***
Resource                                        ${EXECDIR}${/}RESOURCE${/}COMMON.robot

Test Teardown                                   Close Browser

*** Keywords ***
Get Client Name Locators
    ${client_name_elements}                     Get WebElements                                         ${PAGE_CLIENT['DATA_CLIENT_NAME']}
    [Return]                                    ${client_name_elements}
Get Client Number Locators
    ${client_num_elements}                      Get WebElements                                         ${PAGE_CLIENT['DATA_CLIENT_NUMBER']}
    [Return]                                    ${client_num_elements}
Log To Console The Page 1 Client Name And Client Numbers
    [Arguments]                                 ${client_num_elements}                                  ${client_name_elements}
    FOR     ${client_num_element}   ${client_name_element}     IN ZIP   ${client_num_elements}   ${client_name_elements}
            ${client_number}                    Get Text                                                ${client_num_element}
            ${client_name}                      Get Text                                                ${client_name_element}
            Log                                 Client #: ${client_number} | Client Name: ${client_name}
    END

*** Test Cases ***
Log Page 1 Client Name And Client Numbers
    Open Browser                                ${MIFOS_LOGIN_PAGE_URL}                                 ${DEFAULT_BROWSER}
    Sleep                                       ${DEFAULT_TIME}
    Login User                                  ${INPUT_LOGIN['VALID_USERNAME']}
    ...                                         ${INPUT_LOGIN['VALID_PASSWORD']}
    Wait Until Page Contains                    ${SPIELS_LOGIN['VALID_LOGIN_WELCOME_MESSAGE']}
    View Clients Page
    ${client_name_locators}                     Get Client Name Locators
    ${client_num_locators}                      Get Client Number Locators
    Log To Console The Page 1 Client Name And Client Numbers
    ...                                         ${client_num_locators}                                  ${client_name_locators}