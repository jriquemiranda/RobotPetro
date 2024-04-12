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

    # Wait For Elements State    xpath=//label[text()="Projeto"]    visible    2

    Click    xpath=//label[text()='Projeto']/.. >> css=.p-dropdown
    Click    xpath=//li[text()='${CABECALHO.Projeto}']

    Click    xpath=//label[text()='Zona/Revestimento']/.. >> css=.p-dropdown
    Click    xpath=//li[text()='${CABECALHO.Zona}']

    Click    xpath=//label[text()='Sonda']/.. >> css=.p-dropdown
    Click    xpath=//li[text()='${CABECALHO.Sonda}']

    Fill Text    css=#os_cabecalhoBSER    ${CABECALHO.OS}

    Fill Text    css=#sa_cabecalhoBSER    ${CABECALHO.SA}

    Click    xpath=//label[text()='Sup. Operação']/.. >> css=.p-dropdown
    Click    xpath=//li[text()='${CABECALHO.SupOper}']

    Click    xpath=//label[text()='Sup. Sonda']/.. >> css=.p-dropdown
    Click    xpath=//li[text()='${CABECALHO.SupSond}']

    Fill Text    css=#amem_cabecalhoBSER    ${CABECALHO.AMEM}

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

    Click    xpath=//h2[text()='Etapas']
    # Click    css=#inicioAtividadeData_etapaBSER
    # Click    xpath=//span[contains(.,'Hoje')]

    # Click    css=#inicioAtividadeData_etapaBSER
    # Click    xpath=//table[@class='p-datepicker-calendar']//span[text()=01]

    Press Keys    css=#inicioAtividadeData_etapaBSER    0    1    /    0    1    /    2    0    2    4
    Fill Text     css=#inicioAtividadeHora_etapaBSER    00:00
    
    Press Keys    css=#finalAtividadeData_etapaBSER    0    2    /    0    2    /    2    0    2    4
    Fill Text     css=#finalAtividadeHora_etapaBSER    00:00

    Press Keys    css=#layoutLocacaoData_etapaBSER    0    2    /    0    2    /    2    0    2    4
    Fill Text     css=#layoutLocacaoHora_etapaBSER    00:00

    Press Keys    css=#posicionamentoTanquesData_etapaBSER    0    2    /    0    2    /    2    0    2    4
    Fill Text     css=#posicionamentoTanquesHora_etapaBSER    00:00

    # Click    xpath=//span[contains(.,'Pessoal e Equipamento')]/../..//button[@title='Salvar']
    # Click    xpath=//span[text()='Pessoal e Equipamento']/../..//button[@title='Salvar']

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

    # Click    xpath=//label[@for='ativo_BSER']/..//input
    # Click    css=#ativo_BSER
    Click    xpath=//input[@id='ativo_BSER']/../..
    Click    xpath=//li[@aria-label][1]

    Click    xpath=//input[@id='equipamento_BSER']/../..
    Click    xpath=//li[@aria-label][1]

Clique no botão "${botão}" da seção "${seção}"
    [Documentation]    Keyword responsável clicar em um botão ??? em uma seção ???

    # IF    '${seção}' == 'Mistura'
    #     Click    xpath=//span[text()='Mistura']/../..//button[@title='Adicionar mistura']
    # ELSE
    #    Click    xpath=//span[text()='${seção}']/../..//button[@title='${botão}']        
    # END

    Click    xpath=//span[text()='${seção}']/../..//span[text()='${botão}']

Preencha seção "Mobilização"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Mobilização"

    Click        xpath=//h3[text()='Selecione a Origem']/..//span[text()='Outro']
    Fill Text    css=#origemNome_mobilizacaoBSER    Oiapoque 
    Fill Text    css=#dataInicio_mobilizacaoBSER    01/01/2024
    Fill Text    css=#horaInicio_mobilizacaoBSER    00:00    

    Click        xpath=//h3[text()='Selecione o Destino']/..//span[text()='Outro']
    Fill Text    css=#destinoNome_mobilizacaoBSER    Chuí
    Fill Text    css=#dataFim_mobilizacaoBSER        01/01/2024
    Fill Text    css=#horaFim_mobilizacaoBSER        23:59

    Click        xpath=//div[@class='p-multiselect-label-container']
    ${temp}    Get Element States   xpath=//li[@aria-selected='true']
    IF    '${temp}[0]' == 'detached'
        Click        xpath=//li[@tabindex='0']
    END    
    Click        xpath=//div[@class='p-multiselect-label-container']

Preencha seção "Montagem"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Montagem"

    Fill Text    css=#dataInicio_montagemBSER    01/01/2024
    Fill Text    css=#horaInicio_montagemBSER    00:00
    Fill Text    css=#dataFim_montagemBSER       01/01/2024
    Fill Text    css=#horaFim_montagemBSER       23:59
    Click        xpath=//span[text()='Montagem']/../..//span[text()='Outros']
    Fill Text    xpath=//input[@name='descricaoOutros_montagemBSER']    Montagem da rebimboca da parafuseta

Preencha seção "Carregamento"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Carregamento"

    Fill Text                  css=#dataInicio_carregamentoBSER    01/01/2024
    Fill Text                  css=#horaInicio_carregamentoBSER    00:00 
    Fill Text                  css=#dataFim_carregamentoBSER       01/01/2024
    Fill Text                  css=#horaFim_carregamentoBSER       23:59
    Press Keys                 css=#quantidade_carregamentoBSER    1    2    3                        # TEM QUE MELHORAR ISSO AQUI!!! 
    # Fill Text                  xpath=//input[@name='quantidade']              123
    Click                      xpath=//input[@id='descricao_carregamentoBSER']/../..
    Wait For Elements State    xpath=//li[@aria-label][1]    visible    1
    Click                      xpath=//li[@aria-label][1]
    Click                      xpath=//input[@id='tipoProduto_carregamentoBSER']/../..
    Wait For Elements State    xpath=//li[@aria-label][1]    visible    1
    Click                      xpath=//li[@aria-label][1]

Preencha seção "Mistura"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Mistura"

    Fill Text                  css=#dataInicio_mistura    01/01/2024
    Fill Text                  css=#horaInicio_mistura    00:00 
    Fill Text                  css=#dataFim_mistura       01/01/2024
    Fill Text                  css=#horaFim_mistura       23:59    
    # Fill Text                  xpath=//span[@id='volume_mistura']//input    123
    # Fill Text                  xpath=//input[@name='volume']              123
    Press Keys                 xpath=//input[@name='volume']    1    2    3                        # TEM QUE MELHORAR ISSO AQUI!!! 
    # Fill Text                  xpath=//input[@name='peso']                123
    Press Keys                 xpath=//input[@name='peso']    1    2    3                          # TEM QUE MELHORAR ISSO AQUI!!! 
    Click                      xpath=//input[@id='descricao_mistura']/../..
    Wait For Elements State    xpath=//li[@aria-label][1]    visible    1
    Click                      xpath=//li[@aria-label][1]

Preencha seção "Bombeio"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Bombeio"

    Fill Text                  css=#dataInicio_bombeioBSER    01/01/2024
    Fill Text                  css=#horaInicio_bombeioBSER    00:00 
    Fill Text                  css=#dataFim_bombeioBSER       01/01/2024
    Fill Text                  css=#horaFim_bombeioBSER       23:59
    Press Keys                 css=#volume_bombeioBSER        1    2    3                        # TEM QUE MELHORAR ISSO AQUI!!!
    # Fill Text                  css=#volume_bombeioBSER        123
    Press Keys                 css=#pressao_bombeioBSER       1    2    3                        # TEM QUE MELHORAR ISSO AQUI!!!
    # Fill Text                  css=#pressao_bombeioBSER       123
    Press Keys                 css=#vazao_bombeioBSER         1    2    3                        # TEM QUE MELHORAR ISSO AQUI!!!
    # Fill Text                  css=#vazao_bombeioBSER        123
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

    # Wait For Elements State    xpath=//button[@title='Baixar anexo'][contains(.,'${ARQUIVO.Caminho}')]    visible    1
    Wait For Elements State    xpath=//button[@title='Baixar anexo'] >> text='${ARQUIVO.Nome}'    visible    1

    Click    xpath=//button[@aria-label='Close']

Preencha seção "Aguardo"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Aguardo"

    Fill Text    css=#dataInicio_aguardo    01/01/2024
    Fill Text    css=#horaInicio_aguardo    00:00
    Fill Text    css=#dataFim_aguardo       01/01/2024
    Fill Text    css=#horaFim_aguardo       23:59
    Click        xpath=//span[text()='Aguardo']/../..//span[text()='Outros']
    Fill Text    xpath=//input[@name='descricaoOutros_aguardo']    Perando...

Preencha seção "Desmontagem"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Desmontagem"

    Fill Text    css=#dataInicio_desmontagem    01/01/2024
    Fill Text    css=#horaInicio_desmontagem    00:00
    Fill Text    css=#dataFim_desmontagem       01/01/2024
    Fill Text    css=#horaFim_desmontagem       23:59
    Click        xpath=//span[text()='Desmontagem']/../..//span[text()='Outros']
    Fill Text    xpath=//input[@name='descricaoOutros_desmontagem']    Desmontagem da montagem!

Preencha seção "Registro de Anomalias"
    [Documentation]    Keyword responsável pelo preenchimento da seção "Registro de Anomalias"
    
    ${temp}    Get Text    xpath=//span[text()='Registro de Anomalias']/../..//button[contains(@class,'p-button')][@disabled]
    IF    '${temp}' == 'Não'
        Click        xpath=//button[@title='Sim']
        Clique no botão "Sim" do modal "Possui anomalia"
    END
    
    Fill Text    css=#data_anomaliaBSER    01/01/2024
    Click        xpath=//span[text()='Registro de Anomalias']/../..//span[text()='Outro']
    Fill Text    css=#descricaoNome_anomaliaBSER    Lobo guará na plataforma

Inclua comentário na seção "${seção}"
    [Documentation]    Keyword responsável por incluir comentário na seção "Registro de Anomalias"

    Click        xpath=//span[text()='${seção}']/../..//button[@title='Comentários']
    Wait For Elements State    xpath=//div[@class='p-dialog-header']    visible    1
    
    Fill Text    css=#comentario    ${comentario}
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

