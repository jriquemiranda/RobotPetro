*** Settings ***
Documentation            Usado para efetuar testes de keywords

Library            String
Library            JSONLibrary
Resource    ../resources/base.resource

*** Variables ***
# ${código}       Código: 0009-03-2024-BAH-A-BDOSERV
${texto}       BDO de serviço iniciado com sucesso.(0042-04-2024-BAH-A-BDOSERV) Deseja ir para a página de preenchimento das demais seções?

*** Test Cases ***
Get Number From String
    # @{list_string}     Split String    ${código}     ${SPACE}
    # ${código}  Set Variable  ${list_string}[1]
    # Log To Console    Esse deve vir já filtrado ${código}
    # Set Suite Variable    ${código}

    ${dic_texto}     Split String    ${texto}     (
    ${dic_texto}     Split String    ${dic_texto}[1]     )
    ${código}  Set Variable  ${dic_texto}[0]
    Set Suite Variable    ${código}   

Get Variable
    Log To Console    Agora esse tambem deve vir filtrado ${código}

Teste de JSON
    ${json}    Pegue massa de teste "criar" de "bdo_servicos"
    ${etapas}    Set Variable    ${json}[pessoalequipamento][etapas]

    Log To Console    ${\n}${etapas}

Teste FOR JSON
    ${json}    Pegue massa de teste "criar" de "bdo_servicos"
    ${teste}    Set Variable    ${json}[pessoalequipamento][produtos]
    FOR    ${element}    IN    ${teste}
        Log To Console    ${\n}${element}
    END
    Log To Console    ${\n}${teste}