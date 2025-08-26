*** Settings ***
Documentation    All used resources and libraries

Library                    Browser    jsextension=${CURDIR}/../libraries/browserstack_executor.js
Library                    RequestsLibrary
Library                    String
Library                    DateTime
Library                    Collections
Library                    OperatingSystem
Library                    BuiltIn
Library                    ../libraries/excel_library.py
Library                    ../libraries/zephyr_utilities.py
Library                    ../libraries/custom_lib.py
Library                    pabot.PabotLib
Library                    ../libraries/contentful_validation.py

Resource                   ./variables/general_properties.resource
Resource                   ./keywords/common_keywords.resource

Resource                   ./pages/bank_selection.resource
Resource                   ./pages/yrd_company_selection.resource
Resource                   ./pages/yrd_insurance_list.resource
Resource                   ../resources/pages/yrd_company_selection.resource
Resource                   ../resources/pages/yrd_insurance_list.resource
Resource                   ../resources/pages/wci_policy_details.resource
