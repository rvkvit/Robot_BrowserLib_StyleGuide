*** Settings ***
Documentation    All used resources and libraries

Library                    Browser
Library                    RequestsLibrary
Library                    String
Library                    DateTime
Library                    Collections
Library                    OperatingSystem
Library                    BuiltIn
Library                    ../libraries/excel_library.py


Library                    pabot.PabotLib


Resource                   ./variables/general_properties.resource
Resource                   ./keywords/common_keywords.resource

Resource                   ../resources/pages/bstack_login.resource
Resource                   ../resources/pages/bstack_product.resource
Resource                   ../resources/pages/bstack_checkout.resource
