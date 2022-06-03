*** Settings ***
Resource                                    ${EXECDIR}${/}RESOURCE${/}COMMON.robot

Test Teardown                               Close Browser

*** Keywords
Get the total number of pages
    ${last_page_number}                     Get Text                                                ${PAGE_CLIENT['TEXT_LAST_PAGE_NUMBER']}
    [Return]                                ${last_page_number}
Click the page number based on parity of last page number
    [Arguments]                             ${page_number}
    IF  ${page_number} % 2 == 0
        Click Element                       ${PAGE_CLIENT['TEXT_FIRST_PAGE_NUMBER']}
        ${new_page_number}                  Get Text                                                ${PAGE_CLIENT['TEXT_FIRST_PAGE_NUMBER']}
        Log To Console                      ${\n}${new_page_number}
    ELSE
        Click Element                       ${PAGE_CLIENT['TEXT_LAST_PAGE_NUMBER']}
        ${new_page_number}                  Get Text                                                ${PAGE_CLIENT['TEXT_LAST_PAGE_NUMBER']}
        Log To Console                      ${\n}${new_page_number}
    END
    [Return]                                ${new_page_number}
Wait until page is finish loading
    Wait Until Element Is Not Visible       ${COMPONENT_CLIENT['IMAGE_CENTER_LOADER']}
Verify if the page number is selected
    [Arguments]                             ${new_page_number}
    Wait Until Element Contains             ${PAGE_CLIENT['SELECTED_PAGE_NUMBER']}                  ${new_page_number}


*** Test Cases ***
View List of Clients - Pagination
    Open Browser                            ${MIFOS_LOGIN_PAGE_URL}                                 ${DEFAULT_BROWSER}
    Sleep                                   ${DEFAULT_TIME}
    Login User                              ${INPUT_LOGIN['VALID_USERNAME']}
    ...                                     ${INPUT_LOGIN['VALID_PASSWORD']}
    Wait Until Page Contains                ${SPIELS_LOGIN['VALID_LOGIN_WELCOME_MESSAGE']}
    Wait Until Element Is Visible           ${PAGE_CLIENT['TOP_MENU_CLIENTS']}
    Mouse Over                              ${PAGE_CLIENT['TOP_MENU_CLIENTS']}
    Wait Until Element Is Visible           ${PAGE_CLIENT['SUB_MENU_CLIENTS_LINK']}
    Mouse Over                              ${PAGE_CLIENT['SUB_MENU_CLIENTS_LINK']}
    Click Element                           ${PAGE_CLIENT['SUB_MENU_CLIENTS_LINK']}
    Wait Until Element Is Visible           ${PAGE_CLIENT['TITLE_LIST_OF_CLIENTS']}
    Wait Until Page Contains                ${TEXT_LIST_OF_CLIENTS['TITLE_LIST_OF_CLIENTS']}
    Wait Until Page Contains Element        ${PAGE_CLIENT['SYMBOL_LAST_PAGE_NUMBER']}
    ${total_number_of_pages}                Get the total number of pages
    ${selected_page_number}                 Click the page number based on parity of last page number
    ...                                     ${total_number_of_pages}
    Wait until page is finish loading
    Verify if the page number is selected   ${selected_page_number}
    Log To Console                          ${\n}${selected_page_number}