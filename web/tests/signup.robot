*** Settings ***
Documentation        Cenários de testes de pré cadastro de clientes

Resource        ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Create Dictionary
    ...    name=João Teste
    ...    email=joao.teste@gmail.com
    ...    cpf=06097411871

    Delete Account By Email    ${account}[email]

    Submit signup form    ${account}
    Verify welcome message


# Campo nome DEVE ser obrigatório
#     [Tags]    required

#     ${account}        Create Dictionary
#     ...    name=${EMPTY}
#     ...    email=validacaoObrigatorios@teste.com
#     ...    cpf=44917952077

#     Submit signup form    ${account}
#     Notice should be    Por favor informe o seu nome completo


# Campo e-mail DEVE ser obrigatório
#     [Tags]    required

#     ${account}        Create Dictionary
#     ...    name=Validando Campo Obrigatório
#     ...    email=${EMPTY}
#     ...    cpf=44917952077

#     Submit signup form    ${account}
#     Notice should be    Por favor, informe o seu melhor e-mail


# Campo CPF DEVE ser obrigatório
#     [Tags]    required

#     ${account}        Create Dictionary
#     ...    name=Validando Campo Obrigatório
#     ...    email=validacaoObrigatorios@teste.com
#     ...    cpf=${EMPTY}

#     Submit signup form    ${account}
#     Notice should be    Por favor, informe o seu CPF


# E-mail no formato inválido
#     [Tags]    inv

#     ${account}        Create Dictionary
#     ...    name=Validando Email Inválido
#     ...    email=emailInvalido*teste.com
#     ...    cpf=44917952077

#     Submit signup form    ${account}
#     Notice should be    Oops! O email informado é inválido


# CPF no formato inválido
#     [Tags]    inv

#     ${account}        Create Dictionary
#     ...    name=Validando Email Inválido
#     ...    email=emailInvalido@teste.com
#     ...    cpf=12345678900

#     Submit signup form    ${account}
#     Notice should be    Oops! O CPF informado é inválido


Tentativa de pré-cadastro
    [Template]    Attempt signup
    ${EMPTY}                       validacaoObrigatorios@teste.com    44917952077        Por favor informe o seu nome completo
    Validando Campo Obrigatório    ${EMPTY}                           44917952077        Por favor, informe o seu melhor e-mail
    Validando Campo Obrigatório    validacaoObrigatorios@teste.com    ${EMPTY}           Por favor, informe o seu CPF
    Validando Email Inválido       emailInvalido*teste.com            44917952077        Oops! O email informado é inválido
    Validando Email Inválido       www.teste.com.br                   44917952077        Oops! O email informado é inválido
    Validando Email Inválido       ABCDEFGHIJ                         44917952077        Oops! O email informado é inválido
    Validando CPF Inválido         cpfInvalido@teste.com              12345678900        Oops! O CPF informado é inválido
    Validando CPF Inválido         cpfInvalido@teste.com              123456789AB        Oops! O CPF informado é inválido
    Validando CPF Inválido         cpfInvalido@teste.com              123456789          Oops! O CPF informado é inválido

*** Keywords ***
Attempt signup
    [Arguments]        
    ...    ${name}
    ...    ${email}
    ...    ${cpf}
    ...    ${output_message}
    

    ${account}        Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}

    Submit signup form    ${account}
    Notice should be    ${output_message}