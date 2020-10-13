# Desfaio VibeSaúde

## [Introdução](#intro)
## [Rotas do Backend](#rotab)
## [Rotas do Front](#rotaf)


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

## <a id="rotaf"> Rotas do Frontend

A seguir serão apresentadas algumas rotas principais

Para simular que o paciente já está logado

é preciso inserir o código manual no arquivo `.env.development` antes de executar o projeto

    REACT_APP_HOST=http://localhost:8080
    REACT_APP_PACIENTE=1
    REACT_APP_MEDICO=5

A página incial é pesquisa do sistema    
    



