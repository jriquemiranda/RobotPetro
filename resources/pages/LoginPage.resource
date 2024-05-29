*** Settings ***
Documentation            Elementos e ações da página de Login

Library            Browser

Resource           ../env.resource

Resource           components/Header.resource

*** Keywords ***
Abre navegador
    New Browser        browser=chromium    headless=False    args=["--ignore-certificate-errors"]
    New Context        viewport={'width': 1760, 'height': 900}
    New Page           ${BASE_URL}
    
Submeta formulario com as ${credenciais}
    Fill Text    css=#login                  ${credenciais}[login]
    Fill Text    css=input[name=password]    ${credenciais}[senha]

    Click        css=button[type=submit] >> text=Entrar

Se, Modal "${mensagem}" clique em "${botão}"
    ${cond} =    Get Text    h2#swal2-title
    Run Keyword If   "${cond}"=="${mensagem}"    Modal "${mensagem}" clique em "${botão}"

Modal "${mensagem}" clique em "${botão}"
    ${cond}=    Wait For Condition    Text    h2#swal2-title   ==    ${mensagem}
    # ${cond}=    Get Text    h2#swal2-title    contains    ${mensagem}
    IF    "${cond}"=="${mensagem}"
        Click    css=button[type=button] >> text=${botão}
    END

Verifique mensagem "${mensagem}" no modal de login inválido
    Get Text    h2#swal2-title    contains    ${mensagem}

Inicie sessão
    Abre navegador
    Submeta formulario com as ${CREDENCIAL}
    Se, Modal "Sessão ocupada!" clique em "Sim"
    Modal "Verifique sua senha" clique em "OK"
    Verifique usuário logado

Encerre sessão    
    Click                      css=#menu-user
    Wait For Elements State    css=#menu-user-sair    visible    1
    Click                      css=#menu-user-sair
    
    Wait For Condition    Text    h3    contains    Sua sessão foi encerrada.
    Close Browser