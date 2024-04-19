*** Settings ***

Documentation            Ações e elementos do cabeçalho

Library            Browser

Resource           ../../env.resource

*** Keywords ***
Verifique usuário logado
    Get Text    css=header #menu-user h5    equals    ${CREDENCIAL}[USUARIO]