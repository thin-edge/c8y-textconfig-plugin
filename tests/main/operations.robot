*** Settings ***
Resource    ../resources/common.robot
Library    Cumulocity

Suite Setup    Set Main Device

Test Template    Send configuration


*** Test Cases ***               CONFIG_JSON                      EXPECTED_LITERAL_STRING

Multiline configuration          line1\\nline2\\nline3            line1${\n}line2${\n}line3
Config with double quotes        line1\\nline\\"again\\nline3     line1${\n}line"again${\n}line3
Single line                      line1äúœ                         line1äúœ

*** Keywords ***

Send configuration
    [Arguments]    ${config_json}    ${expected_literal}
    ${operation}=    Cumulocity.Create Operation    fragments={"c8y_Configuration": {"config":"${config_json}"}}
    Operation Should Be SUCCESSFUL    ${operation}
    ${mo}=    Cumulocity.Device Should Have Fragments    c8y_Configuration
    Should Be Equal    ${mo["c8y_Configuration"]["config"]}    ${expected_literal}
