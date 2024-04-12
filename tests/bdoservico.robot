*** Settings ***
Documentation            Testes referente aos cenários de BDO de Serviços

Resource                ../resources/base.resource

Test Setup              Inicie sessão
Test Teardown           Encerre sessão

*** Test Cases ***
# CT.BDOSERV.000.0 - Acessar página de BDO de Serviço
#     Acesse pagina "bdo-de-servico"
#     Verifique <h1> com "BDO de Serviço"

CT.BDOSERV.001.0 - Cadastrar um BDO de Serviço
    [Documentation]    Teste
    [Tags]    Feliz

    Acesse pagina "bdo-de-servico"
    Verifique tag <h1> com "BDO de Serviço"

    Clique no botão "Adicionar"

    Verifique tag <h1> com "BDO de Serviço - Cadastro"

    Clique na seção "Cabeçalho"
    Preencha seção "Cabeçalho"
    Clique no botão "Salvar" do "Cabeçalho"
    Escolha o botão "Sim" do modal "Sucesso"

CT.BDOSERV.002.0 - Listar um BDO de Serviço
    [Documentation]    Teste
    [Tags]    Feliz

    Acesse pagina "bdo-de-servico"
    Verifique tag <h1> com "BDO de Serviço"

    Verifique status "Novo"

CT.BDOSERV.003.0 - Preencher um BDO de Serviço
    [Documentation]    Teste
    [Tags]    Feliz

    Acesse pagina "bdo-de-servico"    
    Verifique tag <h1> com "BDO de Serviço"

    Clique no menu e escolha a opção "Editar"
    Verifique código cadastrado
    
    Clique na seção "Cabeçalho"         
                                  
    Clique na seção "Pessoal e Equipamento"
    Preencha seção "Pessoal e Equipamento"
    Clique no botão "Salvar" da seção "Pessoal e Equipamento"
    Clique no botão "OK" do modal "Sucesso"
    
    Clique na seção "Mobilização"
    Preencha seção "Mobilização"
    Clique no botão "Salvar" da seção "Mobilização"
    Clique no botão "OK" do modal "Sucesso"
    
    Clique na seção "Montagem"
    Preencha seção "Montagem"
    Clique no botão "Salvar" da seção "Montagem"
    Clique no botão "OK" do modal "Sucesso"
    
    Clique na seção "Carregamento"
    Preencha seção "Carregamento"
    Clique no botão "Salvar" da seção "Carregamento"
    Clique no botão "OK" do modal "Sucesso"
    
    Clique na seção "Mistura"
    Preencha seção "Mistura"
    Clique no botão "Salvar" da seção "Mistura"
    Clique no botão "OK" do modal "Sucesso"    

    Clique na seção "Bombeio"
    Preencha seção "Bombeio"
    Clique no botão "Salvar" da seção "Bombeio"
    Clique no botão "OK" do modal "Sucesso"
    Inclua foto de anexo na seção "Bombeio"
    Verifique foto de anexo na seção "Bombeio"

    Clique na seção "Aguardo"
    Preencha seção "Aguardo"
    Clique no botão "Salvar" da seção "Aguardo"
    Clique no botão "OK" do modal "Sucesso"

    Clique na seção "Desmontagem"
    Preencha seção "Desmontagem"
    Clique no botão "Salvar" da seção "Desmontagem"
    Clique no botão "OK" do modal "Sucesso"

    Clique na seção "Registro de Anomalias"
    Preencha seção "Registro de Anomalias"
    Clique no botão "Salvar" da seção "Registro de Anomalias"
    Clique no botão "OK" do modal "Sucesso"
    Inclua comentário na seção "Registro de Anomalias"
    Inclua foto de anexo na seção "Registro de Anomalias"
    Verifique comentário na seção "Registro de Anomalias"
    Verifique foto de anexo na seção "Registro de Anomalias"

CT.BDOSERV.004.0 - Editar um BDO de Serviço
    [Documentation]    Teste
    [Tags]    Feliz

    Acesse pagina "bdo-de-servico"    
    Verifique tag <h1> com "BDO de Serviço"

    Clique no menu e escolha a opção "Editar"
    Verifique código cadastrado
    
    Clique na seção "Cabeçalho"         
                                  
    Clique na seção "Pessoal e Equipamento"
    
    Clique na seção "Mobilização"
    Edite o registro da seção "Mobilização"
    Preencha seção "Mobilização"
    Clique no botão "Salvar" da seção "Mobilização"
    Clique no botão "OK" do modal "Sucesso"
    
    Clique na seção "Montagem"
    Edite o registro da seção "Montagem"
    Preencha seção "Montagem"
    Clique no botão "Salvar" da seção "Montagem"
    Clique no botão "OK" do modal "Sucesso"
    
    Clique na seção "Carregamento"
    Edite o registro da seção "Carregamento"
    Preencha seção "Carregamento"
    Clique no botão "Salvar" da seção "Carregamento"
    Clique no botão "OK" do modal "Sucesso"
    
    Clique na seção "Mistura"
    Edite o registro da seção "Mistura"
    Preencha seção "Mistura"
    Clique no botão "Salvar" da seção "Mistura"
    Clique no botão "OK" do modal "Sucesso"    

    Clique na seção "Bombeio"
    Edite o registro da seção "Bombeio"
    Preencha seção "Bombeio"
    Clique no botão "Salvar" da seção "Bombeio"
    Clique no botão "OK" do modal "Sucesso"
    Verifique foto de anexo na seção "Bombeio"

    Clique na seção "Aguardo"
    Edite o registro da seção "Aguardo"
    Preencha seção "Aguardo"
    Clique no botão "Salvar" da seção "Aguardo"
    Clique no botão "OK" do modal "Sucesso"

    Clique na seção "Desmontagem"
    Edite o registro da seção "Desmontagem"
    Preencha seção "Desmontagem"
    Clique no botão "Salvar" da seção "Desmontagem"
    Clique no botão "OK" do modal "Sucesso"

    Clique na seção "Registro de Anomalias"
    Edite o registro da seção "Registro de Anomalias"
    Preencha seção "Registro de Anomalias"
    Clique no botão "Salvar" da seção "Registro de Anomalias"
    Clique no botão "OK" do modal "Sucesso"
    Verifique comentário na seção "Registro de Anomalias"
    Verifique foto de anexo na seção "Registro de Anomalias"

CT.BDOSERV.005.0 - Visualizar um BDO de Serviço
    [Documentation]    Teste
    [Tags]    Feliz

    Acesse pagina "bdo-de-servico"
    Verifique tag <h1> com "BDO de Serviço"

    Clique no menu e escolha a opção "Visualizar"
    Verifique código cadastrado

CT.BDOSERV.006.0 - Imprimir um BDO de Serviço
    [Documentation]    Teste
    [Tags]    Feliz          

    Acesse pagina "bdo-de-servico"
    Verifique tag <h1> com "BDO de Serviço"

    Clique no menu e escolha a opção "Imprimir"
    Verifique impressão                                       # Tem que fazer essa parte, táok?!

CT.BDOSERV.007.1 - Encerrar um BDO de Serviço 'Com Sucesso'
    [Documentation]    Teste
    [Tags]    ComSucesso
    Acesse pagina "bdo-de-servico"
    Verifique tag <h1> com "BDO de Serviço"

    Clique no menu e escolha a opção "Encerrar"

    Escolha a situação "Com Sucesso" no modal "Encerrar BDO de serviços"
    Clique no botão "Sim" do modal "Confirmar escolha?"
    Clique no botão "OK" do modal "Encerrado"

    Verifique situação "Com sucesso"

CT.BDOSERV.007.2 - Encerrar um BDO de Serviço 'Sem Sucesso'
    [Documentation]    Teste
    [Tags]    SemSucesso

    Acesse pagina "bdo-de-servico"
    Verifique tag <h1> com "BDO de Serviço"

    Clique no menu e escolha a opção "Encerrar"
    
    Escolha a situação "Sem Sucesso" no modal "Encerrar BDO de serviços"
    Clique no botão "Sim" do modal "Confirmar escolha?"
    Clique no botão "OK" do modal "Encerrado"

    Verifique situação "Sem sucesso"

CT.BDOSERV.008.0 - Remover (Cancelar) um BDO de Serviço
    [Documentation]    Teste
    [Tags]    Feliz

    Acesse pagina "bdo-de-servico"
    Verifique tag <h1> com "BDO de Serviço"

    Clique no menu e escolha a opção "Cancelar"

    Clique no botão "Sim" do modal "Cancelar BDO de Serviço"
    Clique no botão "OK" do modal "Sucesso"

    Verifique status "Cancelado"


# CT.BDOSERV.000.0 - D'Teste
#     Acesse pagina "bdo-de-servico"    
#     Verifique tag <h1> com "BDO de Serviço"

#     Clique no menu e escolha a opção "Editar"
#     Verifique código cadastrado
    
#     Clique na seção "Desmontagem"
#     Preencha seção "Desmontagem"
#     Clique no botão "Salvar" da seção "Desmontagem"
#     Clique no botão "OK" do modal "Sucesso"

#     Sleep    3