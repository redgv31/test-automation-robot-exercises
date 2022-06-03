*** Settings ***
Resource                                        ${EXECDIR}${/}RESOURCE${/}COMMON.robot

Test Teardown                                   Close Browser

*** Keywords ***
Log To Console the Page 1 First Three Client Numbers
    FOR     ${index}    IN RANGE                1   4
        ${client_number}                        Get Text                                                xpath://tr[${index}]/td[2]
        Log To Console                          ${\n}${client_number}
    END

*** Test Cases ***
Log Page 1 First Three Client Numbers
    Open Browser                                ${MIFOS_LOGIN_PAGE_URL}                                 ${DEFAULT_BROWSER}
    Sleep                                       ${DEFAULT_TIME}
    Login User                                  ${INPUT_LOGIN['VALID_USERNAME']}
    ...                                         ${INPUT_LOGIN['VALID_PASSWORD']}
    Wait Until Page Contains                    ${SPIELS_LOGIN['VALID_LOGIN_WELCOME_MESSAGE']}
    View Clients Page
    Log To Console the Page 1 First Three Client Numbers