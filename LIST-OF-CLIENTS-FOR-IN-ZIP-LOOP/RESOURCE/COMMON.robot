*** Settings ***
Variables                                   ${EXECDIR}${/}CONFIG${/}MX_SPIELS.py
Variables                                   ${EXECDIR}${/}INPUT${/}MX_INPUT_CREATE_CLIENT.py
Variables                                   ${EXECDIR}${/}INPUT${/}MX_INPUT_LOGIN.py
Variables                                   ${EXECDIR}${/}RESOURCE${/}RESOURCE-MAPPING${/}MX-RESOURCE-MAPPING.py
Resource                                    ${EXECDIR}${/}CONFIG${/}MX_BROWSERS.robot
Resource                                    ${EXECDIR}${/}CONFIG${/}MX_TIMEOUT.robot
Resource                                    ${EXECDIR}${/}CONFIG${/}MX_URLS.robot
Resource                                    ${EXECDIR}${/}INPUT${/}MX_INPUT_RANDOM_MOBILE.robot
Resource                                    ${EXECDIR}${/}RESOURCE${/}KEYWORDS${/}MX-PAGE-LOGIN.robot

Library                                     BuiltIn
Library                                     SeleniumLibrary     WITH NAME   SELLIB
Library                                     String
