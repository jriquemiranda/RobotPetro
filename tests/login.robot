*** Settings ***
Documentation            Teste recerentes ao login e logout

Resource                ../resources/base.resource

# Test Teardown           Encerre sessão

*** Test Cases ***
CT.INIT.001.0 - Efetuar login válido no PetroDigital
    [Documentation]    Teste
    [Tags]    Feliz

    Abre navegador
    Verifique tag <h1> com "Entre com suas credenciais"
    Submeta formulario com as ${CREDENCIAL}
    Se, Modal "Sessão ocupada!" clique em "Sim"
    Modal "Verifique sua senha" clique em "OK"
    Verifique usuário logado
    Verifique tag <h1> com "Dashboard"
    Encerre sessão

CT.INIT.001.1 - Efetuar login inválido, senha inválida, no PetroDigital
    [Documentation]    Teste de login usuário inv
    [Tags]    Não Feliz

    ${credenciais}    Create Dictionary    login=tester   senha=123

    Abre navegador
    Verifique tag <h1> com "Entre com suas credenciais"
    Submeta formulario com as ${credenciais}
    Verifique mensagem "Falha no login. Verificar credenciais login/senha." no modal de login inválido

CT.INIT.001.2 - Efetuar login inválido, senha em branco, no PetroDigital
    [Documentation]    Teste de login usuário inv
    [Tags]    Não Feliz

    ${credenciais}    Create Dictionary    login=tester   senha=

    Abre navegador
    Verifique tag <h1> com "Entre com suas credenciais"
    Submeta formulario com as ${credenciais}
    Verifique mensagem "Falha no login. Verificar credenciais login/senha." no modal de login inválido

CT.INIT.001.3 - Efetuar login inválido, login em branco, no PetroDigital
    [Documentation]    Teste de login usuário inv
    [Tags]    Não Feliz

    ${credenciais}    Create Dictionary    login=   senha=123

    Abre navegador
    Verifique tag <h1> com "Entre com suas credenciais"
    Submeta formulario com as ${credenciais}
    Verifique mensagem "Falha no login. Verificar credenciais login/senha." no modal de login inválido


CT.INIT.001.4 - Efetuar login inválido, login e senha em branco, no PetroDigital
    [Documentation]    Teste de login usuário inv
    [Tags]    Não Feliz

    ${credenciais}    Create Dictionary    login=   senha=

    Abre navegador
    Verifique tag <h1> com "Entre com suas credenciais"
    Submeta formulario com as ${credenciais}
    Verifique mensagem "Falha no login. Verificar credenciais login/senha." no modal de login inválido

