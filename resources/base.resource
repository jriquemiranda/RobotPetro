*** Settings ***
Documentation            Elementos e ações comuns entre as páginas

Library            Browser

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