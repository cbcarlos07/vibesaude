# <a id="begin">Desafio VibeSaúde

## [Introdução](#intro)
## [Rotas do Backend](#rotab)
## [Rotas do Front](#rotaf)
## [Banco de dados](#db)


## <a id="intro">Introdução

Este projeto foi desenvolvido utilizando a lib ReactJS com backend SpringBoot

## <a id="rotab"> Rotas do backend

A seguir serão apresentadas algumas rotas principais

O prefixo da rota ficou em `http://localhost:8080/api/v1` 

* CID
    
Traz tudo

    GET
    cid 

* AGENDA

Salva os dados
    POST
    agenda

Atualiza dados

    PUT
    agenda/:id

Busca dados 

    GET
    busca?id=5&status=1&nome=&data1=2020-10-13&data2=2020-10-16

Buscar por Id

    GET
    agenda/:id

* HORARIOS

Traz horarios da data
    GET
    horario/:data

Traz horários do médico

    GET
    horario/doctor/:id

[Voltar ao inicio](#begin)

## <a id="rotaf"> Rotas do Frontend

A seguir serão apresentadas algumas rotas principais

Para simular que o paciente já está logado

é preciso inserir o código manual no arquivo `.env.development` antes de executar o projeto

    REACT_APP_HOST=http://localhost:8080
    REACT_APP_PACIENTE=1
    REACT_APP_MEDICO=5

A página incial é a pesquisa do sistema    
    
![alt text](https://github.com/cbcarlos07/vibesaude/blob/master/imagens/inicial.png)

* Lista de Médicos

 Após digitar e clicar no botao `Médico` o sistema irá a busca dos prestadores com contenham aquele nome, acionando a seguinte rota do backend
 
    http://localhost:8080/api/v1/medico/:nome

![alt text](https://github.com/cbcarlos07/vibesaude/blob/master/imagens/listamedicos.png)

* Agenda

 Após clicar em um dos médicos o sistema irá redirecionar para a tela de agenda. Onde os horários só irão aparecer ao clicar na data selecionada
 
![alt text](https://github.com/cbcarlos07/vibesaude/blob/master/imagens/agenda.png)

* Lista de Pacintes

Para o médico é preciso acessar a url

        http://localhost:3000/prestador

 Após preencher os parâmetros para pesquisa irá carregar tabela com os dados dos pacientes
 
![alt text](https://github.com/cbcarlos07/vibesaude/blob/master/imagens/listapacientes.png)

[Voltar ao inicio](#begin)

## <a id="db">Banco de Dados

O banco de dados usado foi o MySQL 8.0

Na pasta [db](https://github.com/cbcarlos07/vibesaude/tree/master/db) deste projeto encontram-se o MER (Modelo Entidade Relacionamento) e o arquivo sql.sql com inserts já realizados

[Voltar ao inicio](#begin)


