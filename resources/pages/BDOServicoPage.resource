*** Settings ***
Documentation            Elementos e ações da página de BDO de Serviço

Library            Browser
Library            String

#Resource           ../env.resource
Resource           ../base.resource

*** Variables ***

${codigo}    0075-04-2024-BAH-A-BDOSERV                                                                # Isso é apenas temporário!!!

*** Keywords ***

### COMUM ###

Clique no botão "Adicionar"
    [Documentation]    Keyword responsável por selecionar o botão de "Adicionar"

    Click    css=.p-button-primary >> text='Adicionar'

Clique na seção "${seção}"
    [Documentation]    Keyword responsável por selecionar o seção

    # Click    xpath=//span[text()="${seção}"]/..//button[@class="p-panel-header-icon p-panel-toggler p-link"]
    Click    xpath=//span[text()='${seção}']/.. >> css=.p-link

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
    Click                 css=.swal2-styled >> text='${botão}'  

Verifique status "${status}"
    [Documentation]    Keyword responsável por verificar o status

    Get Text    xpath=//td[text()='${codigo}']/../td[3]    equals    ${status}

Verifique situação "${situação}"
    [Documentation]    Keyword responsável por verificar a situação

    Get Text    xpath=//td[text()='${codigo}']/../td[14]    equals    ${situação}

Clique no menu e escolha a opção "${opção}"
    [Documentation]    Keyword responsável por selecionar a opção do menu hamburger

    Type Text                  xpath=(//input[@placeholder='Filtrar'])[1]    ${codigo}
    Wait For Elements State    xpath=//span[text()='Exibindo do 1 ao 1 de 1 registros']    visible    3

    Click                      xpath=//td[text()='${codigo}']/../td[1]            
    Click                      xpath=//span[text()='${opção}']    

Clique no botão "${botão}" da seção "${seção}"
    [Documentation]    Keyword responsável clicar em um botão ??? em uma seção ???

    Click    xpath=//span[text()='${seção}']/../..//span[text()='${botão}']

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

### CABEÇALHO ###

Preencha seção "Cabeçalho" com ${cabecalho}
    [Documentation]    Keyword responsável pelo preenchimento da seção "Cabeçalho" 

    # ${cabecalho}    Pegue massa de teste "cabecalho" de "bdo_servicos"

    Click        xpath=//label[text()='Projeto']/.. >> css=.p-dropdown
    Click        xpath=//li[text()='${cabecalho}[projeto][projeto]']

    Verifique dados "Projeto" usando ${cabecalho}[projeto]

    Click        xpath=//label[text()='Zona/Revestimento']/.. >> css=.p-dropdown
    Click        xpath=//li[text()='${cabecalho}[zona]']

    Click        xpath=//label[text()='Sonda']/.. >> css=.p-dropdown
    Click        xpath=//li[text()='${cabecalho}[sonda]']

    Type Text    css=#os_cabecalhoBSER    ${cabecalho}[os]

    Type Text    css=#sa_cabecalhoBSER    ${cabecalho}[sa]

    Click        xpath=//label[text()='Sup. Operação']/.. >> css=.p-dropdown
    Click        xpath=//li[text()='${cabecalho}[supoper]']

    Click        xpath=//label[text()='Sup. Sonda']/.. >> css=.p-dropdown
    Click        xpath=//li[text()='${cabecalho}[supsond]']

    Type Text    css=#amem_cabecalhoBSER    ${cabecalho}[amem]

Verifique dados "Projeto" usando ${projeto}
    [Documentation]    Keyword responsável pela verificação dos dados do "Projeto"

    Wait For Elements State    css=input[value='${projeto}[campo]']       visible    1
    Wait For Elements State    css=input[value='${projeto}[poco]']        visible    1
    Wait For Elements State    css=input[value='${projeto}[ativo]']       visible    1
    Wait For Elements State    css=input[value='${projeto}[operacao]']    visible    1

Clique no botão "${botão}" do "Cabeçalho"
    [Documentation]    Keyword responsável por selecionar o botão de "???" da seção "Cabeçalho"

    Click    css=button[type=submit] >> text='${botão}'  


Preencha e salve as subseções "Pessoal e Equipamento" com ${pessoalequipamento}
    [Documentation]    Keyword responsável pelo preenchimento da seção "Pessoal e Equipamento"

    Preenche subseção "Etapas" com ${pessoalequipamento}[etapas]
    Clique no botão "Salvar" da seção "Pessoal e Equipamento"
    Clique no botão "OK" do modal "Sucesso"
    
    Preenche subseção "Pessoal" com ${pessoalequipamento}[pessoal]
    Clique no botão "Salvar" da seção "Pessoal e Equipamento"
    Clique no botão "OK" do modal "Sucesso"
    
    Preenche subseção "Equipamentos" com ${pessoalequipamento}[equipamentos]
    Clique no botão "Salvar" da seção "Pessoal e Equipamento"
    Clique no botão "OK" do modal "Sucesso"

    Preenche subseção "Produtos" com ${pessoalequipamento}[produtos]
    Clique no botão "Salvar" da seção "Pessoal e Equipamento"
    Clique no botão "OK" do modal "Sucesso"

Preenche subseção "Etapas" com ${etapas}
    [Documentation]    Keyword responsável pelo preenchimento da subseção "Etapas"

    Click         xpath=//h2[text()='Etapas']

    Type Text     css=#inicioAtividadeData_etapaBSER    ${etapas}[inicioAtividadeData]
    Type Text     css=#inicioAtividadeHora_etapaBSER    ${etapas}[inicioAtividadeHora]
    
    Type Text     css=#finalAtividadeData_etapaBSER    ${etapas}[finalAtividadeData]
    Type Text     css=#finalAtividadeHora_etapaBSER    ${etapas}[finalAtividadeHora]

    Type Text     css=#layoutLocacaoData_etapaBSER    ${etapas}[layoutLocacaoData]
    Type Text     css=#layoutLocacaoHora_etapaBSER    ${etapas}[layoutLocacaoHora]

    Type Text     css=#posicionamentoTanquesData_etapaBSER    ${etapas}[posicionamentoTanquesData]
    Type Text     css=#posicionamentoTanquesHora_etapaBSER    ${etapas}[posicionamentoTanquesHora]

Preenche subseção "Pessoal" com ${pessoal}
    [Documentation]    Keyword responsável pelo preenchimento da sub-seção "Pessoal"

    Click    xpath=//h2[text()='Pessoal']

    Click    xpath=//input[@id='origem_pessoalBSER']/../..
    Click    css=li[aria-label='${pessoal}[origem]']

    #Wait For Elements State    xpath=//label[text()='Selecione a pessoa']/.. >> css=.p-dropdown.p-component.p-inputwrapper.p-dropdown-clearable    enabled    5
    Click    xpath=//input[@id='pessoaId_pessoalBSER']/../..
    Click    css=li[aria-label='${pessoal}[pessoa]']

Preenche subseção "Equipamentos" com ${equipamentos}
    [Documentation]    Keyword responsável pelo preenchimento da sub-seção "Equipamentos"

    Click    xpath=//h2[text()='Equipamentos']

    Click    xpath=//input[@id='ativo_BSER']/../..
    Click    css=li[aria-label='${equipamentos}[local]']

    Click    xpath=//input[@id='equipamento_BSER']/../..
    Click    css=li[aria-label*='${equipamentos}[equipamento]']

Preenche subseção "Produtos" com ${produtos}
    [Documentation]    Keyword responsável pelo preenchimento da sub-seção "Produtos"

    Click        xpath=//h2[text()='Produtos']

    Click        xpath=//input[@id='ativo_BSER']/../..
    Click        css=li[aria-label='${produtos}[local]']

    Click        xpath=//input[@id='produto_BSER']/../..
    Click        css=li[aria-label*='${produtos}[produto]']

    Type Text    css=#quantidade_BSER    ${produtos}[quantidade]

    Type Text    css=#lote_BSER    ${produtos}[lote]

Verifique as subseções "Pessoal e Equipamento" com ${pessoalequipamento}
    [Documentation]    Keyword responsável pela verificação da seção "Pessoal e Equipamento"
        
    Verifique subseção "Pessoal" com ${pessoalequipamento}[pessoal]
        
    Verifique subseção "Equipamentos" com ${pessoalequipamento}[equipamentos]
    
    Verifique subseção "Produtos" com ${pessoalequipamento}[produtos]

Verifique subseção "Pessoal" com ${pessoal}
    [Documentation]    Keyword responsável pela verificação da sub-seção "Pessoal"

    Click                      xpath=//h2[text()='Pessoal']

    Wait For Elements State    xpath=//h2[text()='Pessoal']/../../..//td >> text=${pessoal}[pessoa]    visible    1

Verifique subseção "Equipamentos" com ${equipamentos}
    [Documentation]    Keyword responsável pela verificação da sub-seção "Equipamentos"

    Click                      xpath=//h2[text()='Equipamentos']

    Wait For Elements State    xpath=//h2[text()='Equipamentos']/../../..//td >> text=${equipamentos}[equipamento]    visible    1

Verifique subseção "Produtos" com ${produtos}
    [Documentation]    Keyword responsável pela verificação da sub-seção "Produtos"

    Click                      xpath=//h2[text()='Produtos']

    Wait For Elements State    xpath=//h2[text()='Produtos']/../../..//td[2] >> text=${produtos}[produto]       visible    1
    Wait For Elements State    xpath=//h2[text()='Produtos']/../../..//td[3] >> text=${produtos}[quantidade]    visible    1
    Wait For Elements State    xpath=//h2[text()='Produtos']/../../..//td[5] >> text=${produtos}[lote]          visible    1

### MOBILIZAÇÃO ###

Preencha seção "Mobilização" com ${mobilizacao}
    [Documentation]    Keyword responsável pelo preenchimento da seção "Mobilização"

    Click        xpath=//h3[text()='Selecione a Origem']/..//span[text()='Outro']

    Type Text    css=#origemNome_mobilizacaoBSER    ${mobilizacao}[origemNome]
    Type Text    css=#dataInicio_mobilizacaoBSER    ${mobilizacao}[dataInicio]
    Type Text    css=#horaInicio_mobilizacaoBSER    ${mobilizacao}[horaInicio]

    Click        xpath=//h3[text()='Selecione o Destino']/..//span[text()='Outro']
    Type Text    css=#destinoNome_mobilizacaoBSER    ${mobilizacao}[destinoNome]
    Type Text    css=#dataFim_mobilizacaoBSER        ${mobilizacao}[dataFim]
    Type Text    css=#horaFim_mobilizacaoBSER        ${mobilizacao}[horaFim]

    Click        xpath=//div[@class='p-multiselect-label-container']
    
    ${states}    Get Element States   xpath=//li[@aria-selected='true']
    IF    '${states}[0]' == 'detached'
        Click        xpath=//li[contains(.,'${mobilizacao}[equipamento]')]
    END    
    Click        xpath=//div[@class='p-multiselect-label-container']

Verifique seção "Mobilização" usando ${mobilizacao}
    [Documentation]    Keyword responsável pela verificação da seção "Mobilização"

    Wait For Elements State    xpath=//span[text()='Mobilização']/../..//td[1] >> text=${mobilizacao}[dataInicio]     visible    1
    Wait For Elements State    xpath=//span[text()='Mobilização']/../..//td[2] >> text=${mobilizacao}[origemNome]     visible    1
    Wait For Elements State    xpath=//span[text()='Mobilização']/../..//td[3] >> text=${mobilizacao}[horaInicio]     visible    1
    Wait For Elements State    xpath=//span[text()='Mobilização']/../..//td[4] >> text=${mobilizacao}[dataFim]        visible    1
    Wait For Elements State    xpath=//span[text()='Mobilização']/../..//td[5] >> text=${mobilizacao}[destinoNome]    visible    1    
    Wait For Elements State    xpath=//span[text()='Mobilização']/../..//td[6] >> text=${mobilizacao}[horaFim]        visible    1
    Wait For Elements State    xpath=//span[text()='Mobilização']/../..//td[7] >> text=${mobilizacao}[equipamento]    visible    1

### MONTAGEM ###

Preencha seção "Montagem" com ${montagem}
    [Documentation]    Keyword responsável pelo preenchimento da seção "Montagem"

    Type Text    css=#dataInicio_montagemBSER                                        ${montagem}[dataInicio]
    Type Text    css=#horaInicio_montagemBSER                                        ${montagem}[horaInicio]
    Type Text    css=#dataFim_montagemBSER                                           ${montagem}[dataFim]
    Type Text    css=#horaFim_montagemBSER                                           ${montagem}[horaFim]
    Click        xpath=//span[text()='Montagem']/../..//span[text()='Outros']
    Type Text    xpath=//input[@name='descricaoOutros_montagemBSER']                 ${montagem}[descricaoOutros]

Verifique seção "Montagem" usando ${montagem}
    [Documentation]    Keyword responsável pela verificação da seção "Montagem"

    Wait For Elements State    xpath=//span[text()='Montagem']/../..//td[1] >> text=${montagem}[dataInicio]
    Wait For Elements State    xpath=//span[text()='Montagem']/../..//td[2] >> text=${montagem}[horaInicio]
    Wait For Elements State    xpath=//span[text()='Montagem']/../..//td[3] >> text=${montagem}[dataFim]
    Wait For Elements State    xpath=//span[text()='Montagem']/../..//td[4] >> text=${montagem}[horaFim]
    Wait For Elements State    xpath=//span[text()='Montagem']/../..//td[5] >> text=${montagem}[descricaoOutros]

### CARREGAMENTO ###

Preencha seção "Carregamento" com ${carregamento}
    [Documentation]    Keyword responsável pelo preenchimento da seção "Carregamento"

    Type Text                  css=#dataInicio_carregamentoBSER    ${carregamento}[dataInicio]
    Type Text                  css=#horaInicio_carregamentoBSER    ${carregamento}[horaInicio]
    Type Text                  css=#dataFim_carregamentoBSER       ${carregamento}[dataFim]
    Type Text                  css=#horaFim_carregamentoBSER       ${carregamento}[horaFim]
    Type Text                  css=#quantidade_carregamentoBSER    ${carregamento}[quantidade]
    Click                      xpath=//input[@id='descricao_carregamentoBSER']/../..
    Click                      css=li[aria-label='${carregamento}[descricao]']
    Click                      xpath=//input[@id='tipoProduto_carregamentoBSER']/../..
    Click                      css=li[aria-label='${carregamento}[tipo]']

Verifique seção "Carregamento" usando ${carregamento}
    [Documentation]    Keyword responsável pela verificação da seção "Carregamento"

    Wait For Elements State    xpath=//span[text()='Carregamento']/../..//td[1] >> text=${carregamento}[dataInicio]
    Wait For Elements State    xpath=//span[text()='Carregamento']/../..//td[2] >> text=${carregamento}[horaInicio]
    Wait For Elements State    xpath=//span[text()='Carregamento']/../..//td[3] >> text=${carregamento}[dataFim]
    Wait For Elements State    xpath=//span[text()='Carregamento']/../..//td[4] >> text=${carregamento}[horaFim]
    Wait For Elements State    xpath=//span[text()='Carregamento']/../..//td[5] >> text=${carregamento}[quantidade]
    Wait For Elements State    xpath=//span[text()='Carregamento']/../..//td[7] >> text=${carregamento}[descricao]
    Wait For Elements State    xpath=//span[text()='Carregamento']/../..//td[8] >> text=${carregamento}[tipo]

### MISTURA ###

Preencha seção "Mistura" com ${mistura}
    [Documentation]    Keyword responsável pelo preenchimento da seção "Mistura"

    Type Text                  css=#dataInicio_mistura          ${mistura}[dataInicio]
    Type Text                  css=#horaInicio_mistura          ${mistura}[horaInicio]
    Type Text                  css=#dataFim_mistura             ${mistura}[dataFim]
    Type Text                  css=#horaFim_mistura             ${mistura}[horaFim]
    Type Text                  xpath=//input[@name='volume']    ${mistura}[volume]
    Type Text                  xpath=//input[@name='peso']      ${mistura}[peso]

    Click                      xpath=//input[@id='descricao_mistura']/../..
    Click                      css=li[aria-label='${mistura}[descricao]']

Verifique seção "Mistura" usando ${mistura}
    [Documentation]    Keyword responsável pela verificação da seção "Mistura"

    Wait For Elements State    xpath=//span[text()='Mistura']/../..//td[1] >> text=${mistura}[dataInicio]
    Wait For Elements State    xpath=//span[text()='Mistura']/../..//td[2] >> text=${mistura}[horaInicio]
    Wait For Elements State    xpath=//span[text()='Mistura']/../..//td[3] >> text=${mistura}[dataFim]
    Wait For Elements State    xpath=//span[text()='Mistura']/../..//td[4] >> text=${mistura}[horaFim]
    Wait For Elements State    xpath=//span[text()='Mistura']/../..//td[5] >> text=${mistura}[volume]
    Wait For Elements State    xpath=//span[text()='Mistura']/../..//td[7] >> text=${mistura}[peso]
    Wait For Elements State    xpath=//span[text()='Mistura']/../..//td[8] >> text=${mistura}[descricao]

### BOMBEIO ###

Preencha seção "Bombeio" com ${bombeio}
    [Documentation]    Keyword responsável pelo preenchimento da seção "Bombeio"

    Type Text                  css=#dataInicio_bombeioBSER    ${bombeio}[dataInicio]
    Type Text                  css=#horaInicio_bombeioBSER    ${bombeio}[horaInicio]
    Type Text                  css=#dataFim_bombeioBSER       ${bombeio}[dataFim]
    Type Text                  css=#horaFim_bombeioBSER       ${bombeio}[horaFim]
    Type Text                  css=#volume_bombeioBSER        ${bombeio}[volume]
    Type Text                  css=#pressao_bombeioBSER       ${bombeio}[pressao]
    Type Text                  css=#vazao_bombeioBSER         ${bombeio}[vazao]
    Click                      xpath=//input[@id='descricao_bombeioBSER']/../..
    Click                      css=li[aria-label='${bombeio}[descricao]']

Verifique seção "Bombeio" usando ${bombeio}
    [Documentation]    Keyword responsável pela verificação da seção "Bombeio"

    Wait For Elements State    xpath=//span[text()='Bombeio']/../..//td[1] >> text=${bombeio}[dataInicio]
    Wait For Elements State    xpath=//span[text()='Bombeio']/../..//td[2] >> text=${bombeio}[horaInicio]
    Wait For Elements State    xpath=//span[text()='Bombeio']/../..//td[3] >> text=${bombeio}[dataFim]
    Wait For Elements State    xpath=//span[text()='Bombeio']/../..//td[4] >> text=${bombeio}[horaFim]
    Wait For Elements State    xpath=//span[text()='Bombeio']/../..//td[5] >> text=${bombeio}[volume]
    Wait For Elements State    xpath=//span[text()='Bombeio']/../..//td[7] >> text=${bombeio}[pressao]
    Wait For Elements State    xpath=//span[text()='Bombeio']/../..//td[8] >> text=${bombeio}[vazao]
    Wait For Elements State    xpath=//span[text()='Bombeio']/../..//td[9] >> text=${bombeio}[descricao]
    
    

Inclua foto de anexo na seção "${seção}" usando ${anexos}
    [Documentation]    Keyword responsável por incluir fotos em uma seção ???

    Click                      xpath=//span[text()='${seção}']/../..//button[@title='Anexos']
    Wait For Elements State    xpath=//div[@class='p-dialog-header']    visible    1

    Upload File By Selector    css=#anexos    ${anexos}[caminho]
    Click                      xpath=//div[@class='p-dialog-header']/..//button[@type='submit']
    Clique no botão "OK" do modal "Sucesso"

    Click                      xpath=//button[@aria-label='Close']

Verifique foto de anexo na seção "${seção}" usando ${anexos}
    [Documentation]    Keyword responsável por verificar fotos em uma seção ???

    Click                      xpath=//span[text()='${seção}']/../..//button[@title='Anexos']
    Wait For Elements State    xpath=//div[@class='p-dialog-header']    visible    1

    Wait For Elements State    xpath=//button[@title='Baixar anexo'] >> text='${anexos}[nome]'    visible    1

    Click                      xpath=//button[@aria-label='Close']

### AGUARDO ###

Preencha seção "Aguardo" com ${aguardo}
    [Documentation]    Keyword responsável pelo preenchimento da seção "Aguardo"

    Type Text    css=#dataInicio_aguardo    ${aguardo}[dataInicio]
    Type Text    css=#horaInicio_aguardo    ${aguardo}[horaInicio]
    Type Text    css=#dataFim_aguardo       ${aguardo}[dataFim]
    Type Text    css=#horaFim_aguardo       ${aguardo}[horaFim]
    
    Click        xpath=//span[text()='Aguardo']/../..//span[text()='Outros']
    Type Text    xpath=//input[@name='descricaoOutros_aguardo']    ${aguardo}[descricao]

Verifique seção "Aguardo" usando ${aguardo}
    [Documentation]    Keyword responsável pela verificação da seção "Aguardo"

    Wait For Elements State    xpath=//span[text()='Aguardo']/../..//td[1] >> text=${aguardo}[dataInicio]
    Wait For Elements State    xpath=//span[text()='Aguardo']/../..//td[2] >> text=${aguardo}[horaInicio]
    Wait For Elements State    xpath=//span[text()='Aguardo']/../..//td[3] >> text=${aguardo}[dataFim]
    Wait For Elements State    xpath=//span[text()='Aguardo']/../..//td[4] >> text=${aguardo}[horaFim]
    Wait For Elements State    xpath=//span[text()='Aguardo']/../..//td[5] >> text=${aguardo}[descricao]

### DESMONTAGEM ###

Preencha seção "Desmontagem" com ${desmontagem}
    [Documentation]    Keyword responsável pelo preenchimento da seção "Desmontagem"

    Type Text    css=#dataInicio_desmontagem    ${desmontagem}[dataInicio]
    Type Text    css=#horaInicio_desmontagem    ${desmontagem}[horaInicio]
    Type Text    css=#dataFim_desmontagem       ${desmontagem}[dataFim]
    Type Text    css=#horaFim_desmontagem       ${desmontagem}[horaFim]
    
    Click        xpath=//span[text()='Desmontagem']/../..//span[text()='Outros']
    Type Text    xpath=//input[@name='descricaoOutros_desmontagem']    ${desmontagem}[descricao]

Verifique seção "Desmontagem" usando ${desmontagem}
    [Documentation]    Keyword responsável pela verificação da seção "Desmontagem"

    Wait For Elements State    xpath=//span[text()='Desmontagem']/../..//td[1] >> text=${desmontagem}[dataInicio]
    Wait For Elements State    xpath=//span[text()='Desmontagem']/../..//td[2] >> text=${desmontagem}[horaInicio]
    Wait For Elements State    xpath=//span[text()='Desmontagem']/../..//td[3] >> text=${desmontagem}[dataFim]
    Wait For Elements State    xpath=//span[text()='Desmontagem']/../..//td[4] >> text=${desmontagem}[horaFim]
    Wait For Elements State    xpath=//span[text()='Desmontagem']/../..//td[5] >> text=${desmontagem}[descricao]

### REGISTRO DE ANOMALIAS ###

Preencha seção "Registro de Anomalias" com ${anomalia}
    [Documentation]    Keyword responsável pelo preenchimento da seção "Registro de Anomalias"

    ${temp}    Get Text    xpath=//span[text()='Registro de Anomalias']/../..//button[contains(@class,'p-button')][@disabled]
    IF    '${temp}' == 'Não'
        Click        xpath=//button[@title='Sim']
        Clique no botão "Sim" do modal "Possui anomalia"
    END
    
    Type Text    css=#data_anomaliaBSER    ${anomalia}[data]
    Click        xpath=//span[text()='Registro de Anomalias']/../..//span[text()='Outro']
    Type Text    css=#descricaoNome_anomaliaBSER    ${anomalia}[descricao]

Verifique seção "Registro de Anomalias" usando ${anomalia}
    [Documentation]    Keyword responsável pela verificação da seção "Registro de Anomalias"

    Wait For Elements State    xpath=//span[text()='Registro de Anomalias']/../..//td[1] >> text=${anomalia}[data]
    Wait For Elements State    xpath=//span[text()='Registro de Anomalias']/../..//td[2] >> text=${anomalia}[descricao]

Inclua comentário na seção "${seção}" usando ${comentarios}
    [Documentation]    Keyword responsável por incluir comentário na seção "Registro de Anomalias"

    Click                      xpath=//span[text()='${seção}']/../..//button[@title='Comentários']
    Wait For Elements State    xpath=//div[@class='p-dialog-header']    visible    1
    
    Type Text                  css=#comentario    ${comentarios}[comentario]
    Click                      xpath=//div[@class='p-dialog-header']/..//button[@type='submit']
    Clique no botão "OK" do modal "Sucesso"

    Click                      xpath=//button[@aria-label='Close']

Verifique comentário na seção "${seção}" usando ${comentarios}
    [Documentation]    Keyword responsável por incluir comentário na seção "Registro de Anomalias"

    Click                      xpath=//span[text()='${seção}']/../..//button[@title='Comentários']
    Wait For Elements State    xpath=//div[@class='p-dialog-header']    visible    1
    
    Wait For Elements State    xpath=//div[@class='product-item'][contains(.,'${comentarios}[comentario]')]    visible    1

    Click                      xpath=//button[@aria-label='Close']

