*** Settings ***
Resource                                           ${EXECDIR}${/}RESOURCE${/}COMMON.robot

*** Keywords ***
Login User
    [Arguments]                                    ${username}                                             ${password}
    SELLIB.Maximize Browser Window
    SELLIB.Wait Until Element Is Visible           ${PAGE_LOGIN['TEXTBOX_USERNAME']}
    SELLIB.Wait Until Element Is Visible           ${PAGE_LOGIN['TEXTBOX_PASSWORD']}
    SELLIB.Wait Until Element Is Visible           ${PAGE_LOGIN['BUTTON_LOGIN']}
    SELLIB.Wait Until Page Contains Element        ${PAGE_LOGIN['TEXTBOX_USERNAME']}
    SELLIB.Wait Until Page Contains Element        ${PAGE_LOGIN['TEXTBOX_PASSWORD']}
    SELLIB.Wait Until Page Contains Element        ${PAGE_LOGIN['BUTTON_LOGIN']}
    SELLIB.Input Text                              ${PAGE_LOGIN['TEXTBOX_USERNAME']}                       ${username}
    SELLIB.Input Password                          ${PAGE_LOGIN['TEXTBOX_PASSWORD']}                       ${password}
    SELLIB.Click Button                            ${PAGE_LOGIN['BUTTON_LOGIN']}

Create Client
    [Arguments]                                    ${fname}     ${mname}    ${lname}    ${mobile}
    SELLIB.Wait Until Element Is Visible           ${COMPONENT_SIDE_BAR_CLIENT['LINK_CREATE_CLIENT']}
    SELLIB.Mouse Over                              ${COMPONENT_SIDE_BAR_CLIENT['LINK_CREATE_CLIENT']}
    SELLIB.Click Element                           ${COMPONENT_SIDE_BAR_CLIENT['LINK_CREATE_CLIENT']}
    SELLIB.Wait Until Element Is Visible           ${PAGE_CREATE_CLIENT['DROPDOWN_LIST_OFFICE']}
    SELLIB.Click Element                           ${PAGE_CREATE_CLIENT['DROPDOWN_LIST_OFFICE']}
    SELLIB.Wait Until Element Is Visible           ${VALID_INPUT_CLIENT_INFO['DROPDOWN_SELECTED_OFFICE']}
    SELLIB.Click Element                           ${VALID_INPUT_CLIENT_INFO['DROPDOWN_SELECTED_OFFICE']}
    SELLIB.Select From List By Label               ${PAGE_CREATE_CLIENT['DROPDOWN_LIST_LEGAL_FORM']}       ${VALID_INPUT_CLIENT_INFO['LEGAL_FORM']}
    SELLIB.Input Text                              ${PAGE_CREATE_CLIENT['TEXTBOX_FIRSTNAME']}              ${fname}
    SELLIB.Input Text                              ${PAGE_CREATE_CLIENT['TEXTBOX_MIDDLENAME']}             ${mname}
    SELLIB.Input Text                              ${PAGE_CREATE_CLIENT['TEXTBOX_LASTNAME']}               ${lname}
    SELLIB.Input Text                              ${PAGE_CREATE_CLIENT['TEXTBOX_MOBILE']}                 ${mobile}
    SELLIB.Click Element                           ${PAGE_CREATE_CLIENT['DATEPICKER_DATE_OF_BIRTH']}
    SELLIB.Input Text                              ${PAGE_CREATE_CLIENT['DATEPICKER_DATE_OF_BIRTH']}       ${VALID_INPUT_CLIENT_INFO['DATE_OF_BIRTH']}
    SELLIB.Click Element                           ${PAGE_CREATE_CLIENT['TEXT_MOBILE']}
    SELLIB.Select Checkbox                         ${PAGE_CREATE_CLIENT['CHECKBOX_ACTIVE']}
    SELLIB.Click Element                           ${PAGE_CREATE_CLIENT['DATEPICKER_ACTIVATION_DATE']}
    SELLIB.Input Text                              ${PAGE_CREATE_CLIENT['DATEPICKER_ACTIVATION_DATE']}     ${VALID_INPUT_CLIENT_INFO['DEFAULT_DATE']}
    SELLIB.Click Element                           ${PAGE_CREATE_CLIENT['TEXT_MOBILE']}
    SELLIB.Click Element                           ${PAGE_CREATE_CLIENT['DATEPICKER_SUBMITTED_ON']}
    SELLIB.Input Text                              ${PAGE_CREATE_CLIENT['DATEPICKER_SUBMITTED_ON']}        ${VALID_INPUT_CLIENT_INFO['DEFAULT_DATE']}
    SELLIB.Click Element                           ${PAGE_CREATE_CLIENT['TEXT_MOBILE']}
    SELLIB.Select Checkbox                         ${PAGE_CREATE_CLIENT['CHECKBOX_OPEN_SAVINGS']}
    SELLIB.Select From List By Label               ${PAGE_CREATE_CLIENT['DROPDOWN_LIST_SAVINGS_PRODUCT']}   ${VALID_INPUT_CLIENT_INFO['SAVINGS_PRODUCT']}
    SELLIB.Wait Until Element Is Enabled           ${PAGE_CREATE_CLIENT['BUTTON_SUBMIT']}
    SELLIB.Click Element                           ${PAGE_CREATE_CLIENT['BUTTON_SUBMIT']}