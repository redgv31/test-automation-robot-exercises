*** Settings ***
Resource                                           ${EXECDIR}${/}RESOURCE${/}COMMON.robot

*** Keywords ***
Generate Random Mobile Number
    ${RANDOM_MOBILE}     Generate Random String     11      [NUMBERS]
    [return]    ${RANDOM_MOBILE}