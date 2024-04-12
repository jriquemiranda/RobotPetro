*** Settings ***
Documentation            Teste recerentes ao login e logout

Resource                ../resources/base.resource

Test Teardown           Encerre sessão

*** Test Cases ***
CT.INIT.001.0 - Efetuar login no PetroDigital
    Abre navegador
    Verifique tag <h1> com "Entre com suas credenciais"
    Submeta formulario com as credenciais
    Se, Modal "Sessão ocupada!" clique em "Sim"
    Modal "Verifique sua senha" clique em "OK"
    Verifique usuário logado
    Verifique tag <h1> com "Dashboard"