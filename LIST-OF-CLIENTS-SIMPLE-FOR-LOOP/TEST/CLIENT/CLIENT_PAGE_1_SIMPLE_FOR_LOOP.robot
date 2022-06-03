*** Settings ***
Resource                                        ${EXECDIR}${/}RESOURCE${/}COMMON.robot

Test Teardown                                   Close Browser

*** Keywords ***
Get Client Number Locators
    ${elements}                                 Get WebElements                                         ${PAGE_CLIENT['DATA_CLIENT_NUMBER']}
    [Return]                                    ${elements}
Log To Console the Page 1 Client Numbers
    [Arguments]                                 ${elements}
    FOR     ${element}      IN      @{elements}
            ${client_number}                    Get Text                                                ${element}
            Log To Console                      ${client_number}
    END

*** Test Cases ***
Log Page 1 Client Numbers
    Open Browser                                ${MIFOS_LOGIN_PAGE_URL}                                 ${DEFAULT_BROWSER}
    Sleep                                       ${DEFAULT_TIME}
    Login User                                  ${INPUT_LOGIN['VALID_USERNAME']}
    ...                                         ${INPUT_LOGIN['VALID_PASSWORD']}
    Wait Until Page Contains                    ${SPIELS_LOGIN['VALID_LOGIN_WELCOME_MESSAGE']}
    View Clients Page
    ${locators}                                 Get Client Number Locators
    Log To Console the Page 1 Client Numbers    ${locators}