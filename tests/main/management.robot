*** Settings ***
Resource    ../resources/common.robot
Library    Cumulocity

Suite Setup    Set Main Device


*** Test Cases ***     CONFIG_JSON              EXPECTED_LITERAL_STRING

Supported operation is set
    Should Contain Supported Operations    c8y_Configuration
