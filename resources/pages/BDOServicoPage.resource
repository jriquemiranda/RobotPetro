*** Settings ***
Documentation            Elementos e ações da página de BDO de Serviço

Library            Browser
Library            String

Resource           ../env.resource

*** Variables ***

#Tipo dicionario
&{CABECALHO}    Projeto=123456    Zona=10    Sonda=SPT-PR-01   OS=OS TESTE   SA=SA TESTE   SupOper=ABDON LIMA GOES NETO   SupSond=ZILMAR CAFE SOBRINHO   AMEM=${EMPTY}

&{ARQUIVO}         Nome=Teste.png    Caminho=C:\\DocTestes\\Teste.png
${COMENTARIO}      Tem que chamar o IBAMA    

${codigo}    0075-04-2024-BAH-A-BDOSERV                                                                # Isso é apenas temporário!!!

*** Keywords ***

# Clique no botão "${texto}"
#     IF    "${texto}" == "Adicionar"
#         Click    css=.p-button-primary >> text=${texto}
#     ELSE IF    "${texto}" == "Salvar"
#         Click    css=button[type=submit] >> text=${texto}
#     END    

Clique no botão "Adicionar"
    [Documentation]    Keyword responsável por selecionar o botão de "Adicionar"

    Click    css=.p-button-primary >> text='Adicionar'

Clique na seção "${seção}"
    [Documentation]    Keyword responsável por selecionar o seção

    # Click    xpath=//span[text()="${seção}"]/..//button[@class="p-panel-header-icon p-panel-toggler p-link"]
    Click    xpath=//span[text()='${seção}']/.. >> css=.p-link
        
Preencha seção "Cabeçalho"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Cabeçalho" 
    ...    Em um futuro esse campo vai ter que salvar alguns dos campos preechidos automaticamente

    Click    xpath=//label[text()='Projeto']/.. >> css=.p-dropdown
    Click    xpath=//li[text()='${CABECALHO.Projeto}']

    Click    xpath=//label[text()='Zona/Revestimento']/.. >> css=.p-dropdown
    Click    xpath=//li[text()='${CABECALHO.Zona}']

    Click    xpath=//label[text()='Sonda']/.. >> css=.p-dropdown
    Click    xpath=//li[text()='${CABECALHO.Sonda}']

    Type Text    css=#os_cabecalhoBSER    ${CABECALHO.OS}

    Type Text    css=#sa_cabecalhoBSER    ${CABECALHO.SA}

    Click    xpath=//label[text()='Sup. Operação']/.. >> css=.p-dropdown
    Click    xpath=//li[text()='${CABECALHO.SupOper}']

    Click    xpath=//label[text()='Sup. Sonda']/.. >> css=.p-dropdown
    Click    xpath=//li[text()='${CABECALHO.SupSond}']

    Type Text    css=#amem_cabecalhoBSER    ${CABECALHO.AMEM}

Clique no botão "${botão}" do "Cabeçalho"
    [Documentation]    Keyword responsável por selecionar o botão de "Salvar" da seção "Cabeçalho"

    Click    css=button[type=submit] >> text='${botão}'  

Escolha o botão "${botão}" do modal "${modal}"
    [Documentation]    Keyword responsável por escolher o botão de ??? do modal ???

    Wait For Condition    Text    h2.swal2-title    contains    ${modal}

    IF    "${botão}" == "Sim"
        Click    css=.swal2-styled >> text='${botão}'    

        ${texto}    Get Text    xpath=//h2[contains(.,'Código: ')]
        ${dic_texto}     Split String    ${texto}     ${SPACE}
        ${codigo}  Set Variable  ${dic_texto}[1]
        Set Suite Variable    ${codigo}

    ELSE IF    "${botão}" == "Não"
        ${texto}    Get Text    css=#swal2-html-container
        ${dic_texto}     Split String    ${texto}     (
        ${dic_texto}     Split String    ${dic_texto}[1]     )
        ${codigo}  Set Variable  ${dic_texto}[0]
        Set Suite Variable    ${codigo}
        
        Click    css=.swal2-styled >> text='${botão}'
    END

Clique no botão "${botão}" do modal "${modal}"
    [Documentation]    Keyword responsável por selecionar no botão de ??? do modal ???

    Wait For Condition    Text    h2.swal2-title    contains    ${modal}
    Click    css=.swal2-styled >> text='${botão}'  

Verifique status "${status}"
    [Documentation]    Keyword responsável por verificar o status

    Get Text    xpath=//td[text()='${codigo}']/../td[3]    equals    ${status}

Verifique situação "${situação}"
    [Documentation]    Keyword responsável por verificar a situação

    Get Text    xpath=//td[text()='${codigo}']/../td[14]    equals    ${situação}

Clique no menu e escolha a opção "${opção}"
    [Documentation]    Keyword responsável por selecionar a opção do menu hamburger
    
    Click    xpath=//td[text()='${codigo}']/../td[1]            
    Click    xpath=//span[text()='${opção}']    

Preencha seção "Pessoal e Equipamento"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Pessoal e Equipamento"

    Preenche subseção "Etapas"
    Clique no botão "Salvar" da seção "Pessoal e Equipamento"
    Clique no botão "OK" do modal "Sucesso"
    
    Preenche subseção "Pessoal"
    Clique no botão "Salvar" da seção "Pessoal e Equipamento"
    Clique no botão "OK" do modal "Sucesso"
    
    Preenche subseção "Equipamentos"

Preenche subseção "Etapas"    
    [Documentation]    Keyword responsável pelo preenchimento da subseção "Etapas"
    
    ${etapas}    Create Dictionary    inicioAtividadeData=01/01/2024
    ...                               inicioAtividadeHora=00:00
    ...                               finalAtividadeData=02/02/2024
    ...                               finalAtividadeHora=00:00
    ...                               layoutLocacaoData=02/02/2024
    ...                               layoutLocacaoHora=00:00
    ...                               posicionamentoTanquesData=02/02/2024
    ...                               posicionamentoTanquesHora=00:00

    Click    xpath=//h2[text()='Etapas']

    Type Text     css=#inicioAtividadeData_etapaBSER    ${etapas.inicioAtividadeData}
    Type Text     css=#inicioAtividadeHora_etapaBSER    ${etapas.inicioAtividadeHora}
    
    Type Text     css=#finalAtividadeData_etapaBSER    ${etapas.finalAtividadeData}
    Type Text     css=#finalAtividadeHora_etapaBSER    ${etapas.finalAtividadeHora}

    Type Text     css=#layoutLocacaoData_etapaBSER    ${etapas.layoutLocacaoData}
    Type Text     css=#layoutLocacaoHora_etapaBSER    ${etapas.layoutLocacaoHora}

    Type Text     css=#posicionamentoTanquesData_etapaBSER    ${etapas.posicionamentoTanquesData}
    Type Text     css=#posicionamentoTanquesHora_etapaBSER    ${etapas.posicionamentoTanquesHora}

Preenche subseção "Pessoal"
    [Documentation]    Keyword responsável pelo preenchimento da sub-seção "Pessoal"

    Click    xpath=//h2[text()='Pessoal']

    Click    xpath=//label[text()='Selecione a origem']/..
    Click    xpath=//li[@aria-label][1]

    Wait For Elements State    xpath=//label[text()='Selecione a pessoa']/.. >> css=.p-dropdown.p-component.p-inputwrapper.p-dropdown-clearable    enabled    5
    Click    xpath=//label[text()='Selecione a pessoa']/..
    Click    xpath=//li[@aria-label][1]

Preenche subseção "Equipamentos"
    [Documentation]    Keyword responsável pelo preenchimento da sub-seção "Equipamentos"

    Click    xpath=//h2[text()='Equipamentos']

    Click    xpath=//input[@id='ativo_BSER']/../..
    Click    xpath=//li[@aria-label][1]

    Click    xpath=//input[@id='equipamento_BSER']/../..
    Click    xpath=//li[@aria-label][1]

Clique no botão "${botão}" da seção "${seção}"
    [Documentation]    Keyword responsável clicar em um botão ??? em uma seção ???

    Click    xpath=//span[text()='${seção}']/../..//span[text()='${botão}']

Preencha seção "Mobilização"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Mobilização"

    ${mobilizacao}    Create Dictionary    origemNome=Oiapoque
    ...                                    dataInicio=01/01/2024
    ...                                    horaInicio='00:00
    ...                                    destinoNome=Chuí
    ...                                    dataFim=01/01/2024
    ...                                    horaFim=23:59

    Click        xpath=//h3[text()='Selecione a Origem']/..//span[text()='Outro']

    Type Text    css=#origemNome_mobilizacaoBSER    ${mobilizacao.origemNome}
    Type Text    css=#dataInicio_mobilizacaoBSER    ${mobilizacao.dataInicio}
    Type Text    css=#horaInicio_mobilizacaoBSER    ${mobilizacao.horaInicio}

    Click        xpath=//h3[text()='Selecione o Destino']/..//span[text()='Outro']
    Type Text    css=#destinoNome_mobilizacaoBSER    ${mobilizacao.destinoNome}
    Type Text    css=#dataFim_mobilizacaoBSER        ${mobilizacao.dataFim}
    Type Text    css=#horaFim_mobilizacaoBSER        ${mobilizacao.horaFim}

    Click        xpath=//div[@class='p-multiselect-label-container']
    ${states}    Get Element States   xpath=//li[@aria-selected='true']
    IF    '${states}[0]' == 'detached'
        Click        xpath=//li[@tabindex='0']
    END    
    Click        xpath=//div[@class='p-multiselect-label-container']

Preencha seção "Montagem"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Montagem"

    ${montagem}    Create Dictionary    dataInicio=01/01/2024
    ...                                 horaInicio=00:00
    ...                                 dataFim=01/01/2024
    ...                                 horaFim=23:59
    ...                                 descricaoOutros=Montagem da rebimboca da parafuseta

    # Type Text    css=#dataInicio_montagemBSER    01/01/2024
    # Type Text    css=#horaInicio_montagemBSER    00:00
    # Type Text    css=#dataFim_montagemBSER       01/01/2024
    # Type Text    css=#horaFim_montagemBSER       23:59
    # Click        xpath=//span[text()='Montagem']/../..//span[text()='Outros']
    # Type Text    xpath=//input[@name='descricaoOutros_montagemBSER']    Montagem da rebimboca da parafuseta

    Type Text    css=#dataInicio_montagemBSER                                        ${montagem.dataInicio}
    Type Text    css=#horaInicio_montagemBSER                                        ${montagem.horaInicio}
    Type Text    css=#dataFim_montagemBSER                                           ${montagem.dataFim}
    Type Text    css=#horaFim_montagemBSER                                           ${montagem.horaFim}
    Click        xpath=//span[text()='Montagem']/../..//span[text()='Outros']
    Type Text    xpath=//input[@name='descricaoOutros_montagemBSER']                 ${montagem.descricaoOutros}

Preencha seção "Carregamento"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Carregamento"

    ${carregamento}    Create Dictionary    dataInicio=01/01/2024
    ...                                     horaInicio=00:00
    ...                                     dataFim=01/01/2024
    ...                                     horaFim=23:59
    ...                                     quantidade=123

    Type Text                  css=#dataInicio_carregamentoBSER    ${carregamento.dataInicio}
    Type Text                  css=#horaInicio_carregamentoBSER    ${carregamento.horaInicio}
    Type Text                  css=#dataFim_carregamentoBSER       ${carregamento.dataFim}
    Type Text                  css=#horaFim_carregamentoBSER       ${carregamento.horaFim}
    Type Text                  css=#quantidade_carregamentoBSER    ${carregamento.quantidade}
    Click                      xpath=//input[@id='descricao_carregamentoBSER']/../..
    Wait For Elements State    xpath=//li[@aria-label][1]    visible    1
    Click                      xpath=//li[@aria-label][1]
    Click                      xpath=//input[@id='tipoProduto_carregamentoBSER']/../..
    Wait For Elements State    xpath=//li[@aria-label][1]    visible    1
    Click                      xpath=//li[@aria-label][1]

Preencha seção "Mistura"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Mistura"

    ${mistura}    Create Dictionary    dataInicio=01/01/2024
    ...                                horaInicio=00:00
    ...                                dataFim=01/01/2024
    ...                                horaFim=23:59
    ...                                volume=123
    ...                                peso=123

    Type Text                  css=#dataInicio_mistura          ${mistura.dataInicio}
    Type Text                  css=#horaInicio_mistura          ${mistura.horaInicio}
    Type Text                  css=#dataFim_mistura             ${mistura.dataFim}
    Type Text                  css=#horaFim_mistura             ${mistura.horaFim}
    Type Text                  xpath=//input[@name='volume']    ${mistura.volume}
    Type Text                  xpath=//input[@name='peso']      ${mistura.peso}

    Click                      xpath=//input[@id='descricao_mistura']/../..
    Wait For Elements State    xpath=//li[@aria-label][1]    visible    1
    Click                      xpath=//li[@aria-label][1]

Preencha seção "Bombeio"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Bombeio"

    ${bombeio}    Create Dictionary    dataInicio=01/01/2024
    ...                                horaInicio=00:00
    ...                                dataFim=01/01/2024
    ...                                horaFim=23:59
    ...                                volume=123
    ...                                pressao=123
    ...                                vazao=123

    Type Text                  css=#dataInicio_bombeioBSER    ${bombeio.dataInicio}
    Type Text                  css=#horaInicio_bombeioBSER    ${bombeio.horaInicio}
    Type Text                  css=#dataFim_bombeioBSER       ${bombeio.dataFim}
    Type Text                  css=#horaFim_bombeioBSER       ${bombeio.horaFim}
    Type Text                  css=#volume_bombeioBSER        ${bombeio.volume}
    Type Text                  css=#pressao_bombeioBSER       ${bombeio.pressao}
    Type Text                  css=#vazao_bombeioBSER         ${bombeio.vazao}
    Click                      xpath=//input[@id='descricao_bombeioBSER']/../..
    Wait For Elements State    xpath=//li[@aria-label][1]     visible    1
    Click                      xpath=//li[@aria-label][1]

Inclua foto de anexo na seção "${seção}"                                                        
    [Documentation]    Keyword responsável por incluir fotos em uma seção ???
    Click    xpath=//span[text()='${seção}']/../..//button[@title='Anexos']
    Wait For Elements State    xpath=//div[@class='p-dialog-header']    visible    1

    Upload File By Selector    css=#anexos    ${ARQUIVO.Caminho}
    Click    xpath=//div[@class='p-dialog-header']/..//button[@type='submit']
    Clique no botão "OK" do modal "Sucesso"

    Click    xpath=//button[@aria-label='Close']

Verifique foto de anexo na seção "${seção}"                                                       
    [Documentation]    Keyword responsável por verificar fotos em uma seção ???
    Click    xpath=//span[text()='${seção}']/../..//button[@title='Anexos']
    Wait For Elements State    xpath=//div[@class='p-dialog-header']    visible    1

    Wait For Elements State    xpath=//button[@title='Baixar anexo'] >> text='${ARQUIVO.Nome}'    visible    1

    Click    xpath=//button[@aria-label='Close']

Preencha seção "Aguardo"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Aguardo"

    ${aguardo}    Create Dictionary    dataInicio=01/01/2024
    ...                                horaInicio=00:00
    ...                                dataFim=01/01/2024
    ...                                horaFim=23:59
    ...                                descricao=Perando...

    Type Text    css=#dataInicio_aguardo    ${aguardo.dataInicio}
    Type Text    css=#horaInicio_aguardo    ${aguardo.horaInicio}
    Type Text    css=#dataFim_aguardo       ${aguardo.dataFim}
    Type Text    css=#horaFim_aguardo       ${aguardo.horaFim}
    
    Click        xpath=//span[text()='Aguardo']/../..//span[text()='Outros']
    Type Text    xpath=//input[@name='descricaoOutros_aguardo']    ${aguardo.descricao}

Preencha seção "Desmontagem"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Desmontagem"

    ${desmontagem}    Create Dictionary    dataInicio=01/01/2024
    ...                                    horaInicio=00:00
    ...                                    dataFim=01/01/2024
    ...                                    horaFim=23:59
    ...                                    descricao=Desmontagem da montagem!

    Type Text    css=#dataInicio_desmontagem    ${desmontagem.dataInicio}
    Type Text    css=#horaInicio_desmontagem    ${desmontagem.horaInicio}
    Type Text    css=#dataFim_desmontagem       ${desmontagem.dataFim}
    Type Text    css=#horaFim_desmontagem       ${desmontagem.horaFim}
    
    Click        xpath=//span[text()='Desmontagem']/../..//span[text()='Outros']
    Type Text    xpath=//input[@name='descricaoOutros_desmontagem']    ${desmontagem.descricao}

Preencha seção "Registro de Anomalias"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Registro de Anomalias"
    
    ${anomalia}    Create Dictionary    data=01/01/2024
    ...                                 descricao=Lobo guará na plataforma!

    ${temp}    Get Text    xpath=//span[text()='Registro de Anomalias']/../..//button[contains(@class,'p-button')][@disabled]
    IF    '${temp}' == 'Não'
        Click        xpath=//button[@title='Sim']
        Clique no botão "Sim" do modal "Possui anomalia"
    END
    
    Type Text    css=#data_anomaliaBSER    ${anomalia.data}
    Click        xpath=//span[text()='Registro de Anomalias']/../..//span[text()='Outro']
    Type Text    css=#descricaoNome_anomaliaBSER    ${anomalia.descricao}

Inclua comentário na seção "${seção}"
    [Documentation]    Keyword responsável por incluir comentário na seção "Registro de Anomalias"

    Click        xpath=//span[text()='${seção}']/../..//button[@title='Comentários']
    Wait For Elements State    xpath=//div[@class='p-dialog-header']    visible    1
    
    Type Text    css=#comentario    ${comentario}
    Click        xpath=//div[@class='p-dialog-header']/..//button[@type='submit']
    Clique no botão "OK" do modal "Sucesso"

    Click    xpath=//button[@aria-label='Close']

Verifique comentário na seção "${seção}"
    [Documentation]    Keyword responsável por incluir comentário na seção "Registro de Anomalias"

    Click        xpath=//span[text()='${seção}']/../..//button[@title='Comentários']
    Wait For Elements State    xpath=//div[@class='p-dialog-header']    visible    1
    
    Wait For Elements State    xpath=//div[@class='product-item'][contains(.,'${comentario}')]    visible    1

    Click    xpath=//button[@aria-label='Close']

Escolha a situação "${situação}" no modal "${modal}"
    [Documentation]    Keyword responsável por selecionar situação ??? no modal ???
    
    Wait For Elements State    xpath=//div[text()='${modal}']    visible    1
    Click                      xpath=//button[text()='${situação}']

Verifique código cadastrado
    [Documentation]    Keyword responsável por verificar o código do BDO de Serviço
    
    Wait For Condition    Text    xpath=//h2[contains(.,'Código:')]    contains    ${codigo}

Verifique impressão
    [Documentation]    Keyword responsável por verificar a impressão

    ${status}    Wait For Response
    Pass Execution If    ${status}[status] == 200    OK

Edite o registro da seção "${seção}"
    [Documentation]    Keyword responsável por verificar o código do BDO de Serviço

    Click        xpath=//span[text()='${seção}']/../..//button[@title='Editar']

