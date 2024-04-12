*** Settings *** 
Documentation               Verificação se o site está funcional

Library                    Browser
Resource                   ../resources/base.resource

*** Test Cases ***
Verifica se o sistema PetroDigital está online
    
    Abre navegador
    # Checkpoint
    Get Title          equal     PetroReconcavo
    Get Text           h2    contains    Ambiente de desenvolvimento e homologação