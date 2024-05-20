*** Settings ***
Documentation            Testes referente aos cenários de BDO de Serviços

Resource                ../resources/base.resource

Test Setup              Inicie sessão
Test Teardown           Encerre sessão

*** Test Cases ***
# CT.BDOSERV.000.0 - Acessar página de BDO de Serviço
#     Acesse pagina "bdo-de-servico"
#     Verifique <h1> com "BDO de Serviço"

CT.BDOSERV.001.0 - Cadastrar BDO de Serviço
    [Documentation]    Teste
    [Tags]    Feliz

    ${servico}    Retorna massa de teste "criar" de "bdo_servicos"

    Acesse pagina "bdo-de-servico"
    Verifique tag <h1> com "BDO de Serviço"

    Clique no botão "Adicionar"

    Verifique tag <h1> com "BDO de Serviço - Cadastro"

    Clique na seção "Cabeçalho"
    Preencha seção "Cabeçalho" com ${servico}[cabecalho]
    Clique no botão "Salvar" do "Cabeçalho"
    Escolha o botão "Sim" do modal "Sucesso"

CT.BDOSERV.002.0 - Listar BDO de Serviço cadastrado
    [Documentation]    Teste
    [Tags]    Feliz

    Acesse pagina "bdo-de-servico"
    Verifique tag <h1> com "BDO de Serviço"

    Verifique status "Novo"

CT.BDOSERV.003.0 - Preencher BDO de Serviço cadastrado
    [Documentation]    Teste
    [Tags]    Feliz

    ${servico}    Retorna massa de teste "criar" de "bdo_servicos"

    Acesse pagina "bdo-de-servico"    
    Verifique tag <h1> com "BDO de Serviço"

    Clique no menu e escolha a opção "Editar"
    Verifique código cadastrado
    
    Clique na seção "Cabeçalho"         
                                  
    Clique na seção "Pessoal e Equipamento"
    Preencha e salve as subseções "Pessoal e Equipamento" com ${servico}[pessoalequipamento]
    Verifique as subseções "Pessoal e Equipamento" com ${servico}[pessoalequipamento]
    
    Clique na seção "Mobilização"
    Preencha seção "Mobilização" com ${servico}[mobilizacao]
    Clique no botão "Salvar" da seção "Mobilização"
    Clique no botão "OK" do modal "Sucesso"
    Verifique seção "Mobilização" usando ${servico}[mobilizacao]
    
    Clique na seção "Montagem"
    Preencha seção "Montagem" com ${servico}[montagem]
    Clique no botão "Salvar" da seção "Montagem"
    Clique no botão "OK" do modal "Sucesso"
    Verifique seção "Montagem" usando ${servico}[montagem]
    
    Clique na seção "Carregamento"
    Preencha seção "Carregamento" com ${servico}[carregamento]
    Clique no botão "Salvar" da seção "Carregamento"
    Clique no botão "OK" do modal "Sucesso"
    Verifique seção "Carregamento" usando ${servico}[carregamento]
    
    Clique na seção "Mistura"
    Preencha seção "Mistura" com ${servico}[mistura]
    Clique no botão "Salvar" da seção "Mistura"
    Clique no botão "OK" do modal "Sucesso"
    Verifique seção "Mistura" usando ${servico}[mistura]

    Clique na seção "Bombeio"
    Preencha seção "Bombeio" com ${servico}[bombeio]
    Clique no botão "Salvar" da seção "Bombeio"
    Clique no botão "OK" do modal "Sucesso"
    Inclua foto de anexo na seção "Bombeio" usando ${servico}[anexos]
    Verifique seção "Bombeio" usando ${servico}[bombeio]
    Verifique foto de anexo na seção "Bombeio" usando ${servico}[anexos]

    Clique na seção "Aguardo"
    Preencha seção "Aguardo" com ${servico}[aguardo]
    Clique no botão "Salvar" da seção "Aguardo"
    Clique no botão "OK" do modal "Sucesso"
    Verifique seção "Aguardo" usando ${servico}[aguardo]

    Clique na seção "Desmontagem"
    Preencha seção "Desmontagem" com ${servico}[desmontagem]
    Clique no botão "Salvar" da seção "Desmontagem"
    Clique no botão "OK" do modal "Sucesso"
    Verifique seção "Desmontagem" usando ${servico}[desmontagem]

    Clique na seção "Registro de Anomalias"
    Preencha seção "Registro de Anomalias" com ${servico}[anomalia]
    Clique no botão "Salvar" da seção "Registro de Anomalias"
    Clique no botão "OK" do modal "Sucesso"
    Inclua comentário na seção "Registro de Anomalias" usando ${servico}[comentarios]
    Inclua foto de anexo na seção "Registro de Anomalias" usando ${servico}[anexos]
    Verifique seção "Registro de Anomalias" usando ${servico}[anomalia]
    Verifique comentário na seção "Registro de Anomalias" usando ${servico}[comentarios]
    Verifique foto de anexo na seção "Registro de Anomalias" usando ${servico}[anexos]

CT.BDOSERV.004.0 - Editar um BDO de Serviço
    [Documentation]    Teste
    [Tags]    Feliz

    ${servico}    Retorna massa de teste "criar" de "bdo_servicos"

    Acesse pagina "bdo-de-servico"    
    Verifique tag <h1> com "BDO de Serviço"

    Clique no menu e escolha a opção "Editar"
    Verifique código cadastrado
    
    Clique na seção "Cabeçalho"         
                                  
    Clique na seção "Pessoal e Equipamento"
    
    Clique na seção "Mobilização"
    Edite o registro da seção "Mobilização"
    Preencha seção "Mobilização" com ${servico}[mobilizacao]
    Clique no botão "Salvar" da seção "Mobilização"
    Clique no botão "OK" do modal "Sucesso"
    Verifique seção "Mobilização" usando ${servico}[mobilizacao]
    
    Clique na seção "Montagem"
    Edite o registro da seção "Montagem"
    Preencha seção "Montagem" com ${servico}[montagem]
    Clique no botão "Salvar" da seção "Montagem"
    Clique no botão "OK" do modal "Sucesso"
    
    Clique na seção "Carregamento"
    Edite o registro da seção "Carregamento"
    Preencha seção "Carregamento" com ${servico}[carregamento]
    Clique no botão "Salvar" da seção "Carregamento"
    Clique no botão "OK" do modal "Sucesso"
    Verifique seção "Carregamento" usando ${servico}[carregamento]
    
    Clique na seção "Mistura"
    Edite o registro da seção "Mistura"
    Preencha seção "Mistura" com ${servico}[mistura]
    Clique no botão "Salvar" da seção "Mistura"
    Clique no botão "OK" do modal "Sucesso"
    Verifique seção "Mistura" usando ${servico}[mistura]

    Clique na seção "Bombeio"
    Edite o registro da seção "Bombeio"
    Preencha seção "Bombeio" com ${servico}[bombeio]
    Clique no botão "Salvar" da seção "Bombeio"
    Clique no botão "OK" do modal "Sucesso"
    Verifique seção "Bombeio" usando ${servico}[bombeio]
    Verifique foto de anexo na seção "Bombeio" usando ${servico}[anexos]

    Clique na seção "Aguardo"
    Edite o registro da seção "Aguardo"
    Preencha seção "Aguardo" com ${servico}[aguardo]
    Clique no botão "Salvar" da seção "Aguardo"
    Clique no botão "OK" do modal "Sucesso"
    Verifique seção "Aguardo" usando ${servico}[aguardo]

    Clique na seção "Desmontagem"
    Edite o registro da seção "Desmontagem"
    Preencha seção "Desmontagem" com ${servico}[desmontagem]
    Clique no botão "Salvar" da seção "Desmontagem"
    Clique no botão "OK" do modal "Sucesso"
    Verifique seção "Desmontagem" usando ${servico}[desmontagem]

    Clique na seção "Registro de Anomalias"
    Edite o registro da seção "Registro de Anomalias"
    Preencha seção "Registro de Anomalias" com ${servico}[anomalia]
    Clique no botão "Salvar" da seção "Registro de Anomalias"
    Clique no botão "OK" do modal "Sucesso"
    Verifique seção "Registro de Anomalias" usando ${servico}[anomalia]
    Verifique comentário na seção "Registro de Anomalias" usando ${servico}[comentarios]
    Verifique foto de anexo na seção "Registro de Anomalias" usando ${servico}[anexos]

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


CT.BDOSERV.000.0 - D'Teste
    ${servico}    Retorna massa de teste "criar" de "bdo_servicos"

    Acesse pagina "bdo-de-servico"    
    Verifique tag <h1> com "BDO de Serviço"

    ${tabela}    Set Variable    //table
    ${coluna}    Set Variable    "Sup. Sonda"
    ${linha}     Set Variable    "0096-04-2024-BAH-A-BDOSERV"

    ${elemento}    Retorne o elemento da ${tabela} cruzando ${coluna} com ${linha}
    Log To Console    ${\n}=>${elemento}<=

    Sleep    5