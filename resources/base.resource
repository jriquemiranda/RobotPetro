*** Settings ***
Documentation            Elementos e ações comuns entre as páginas

Library            Browser
Library            JSONLibrary

Resource           ../resources/env.resource

Resource           ../resources/pages/LoginPage.resource
Resource           ../resources/pages/BDOServicoPage.resource

*** Keywords ***
Acesse pagina "${url}"
    IF    "${url}" != ""    Go To    ${BASE_URL}/${url}

Verifique tag <${tag}> com "${mensagem}"
    Get Text    ${tag}    contains    ${mensagem}

# Se, Modal "${mensagem}" clique em "${botão}"
#     ${cond} =    Get Text    h2#swal2-title
#     Run Keyword If   "${cond}"=="${mensagem}"    Modal "${mensagem}" clique em "${botão}"

# Modal "${mensagem}" clique em "${botão}"
#     ${cond}=    Wait For Condition    Text    h2#swal2-title   ==    ${mensagem}
#     # ${cond}=    Get Text    h2#swal2-title    contains    ${mensagem}
#     IF    "${cond}"=="${mensagem}"
#         Click    css=button[type=button] >> text=${botão}
#     END


#HELPERS
Retorna massa de teste "${cenario}" de "${arquivo}"
    ${json}    Load Json From File    ${EXECDIR}/resources/fixtures/${arquivo}.json    encoding=UTF-8
    RETURN    ${json}[${cenario}]

Retorna o elemento da ${tabela} cruzando ${coluna} com ${linha}
    ${ColInd}    Get Table Cell Index    xpath=${tabela} >> ${coluna}
    ${LinInd}    Get Table Row Index    xpath=${tabela} >> ${linha}

    ${TabelaElemento}    Get Table Cell Element    xpath=${tabela}    ${ColInd}    ${LinInd}
    ${elemento}    Get Text    ${TabelaElemento}
    RETURN    ${elemento}

Retorna o xpath da ${tabela} cruzando ${coluna} com ${linha}
    ${ColInd}    Get Table Cell Index    xpath=${tabela} >> ${coluna}
    ${LinInd}    Get Table Row Index    xpath=${tabela} >> ${linha}

    ${TabelaElemento}    Get Table Cell Element    xpath=${tabela}    ${ColInd}    ${LinInd}
    RETURN    ${TabelaElemento}