import React from 'react'
import { Route, BrowserRouter } from 'react-router-dom'
import App from './App'
import Medico from './medico'
import Especialidade from './especialidade'
import Horarios from './horarios'
import Profissionais from './profissionais'
import Prestador from './prestador'
import ProntuarioEletronico from './pep'

import './index.css'



const Routes = () =>{
    return (
        <BrowserRouter>
            <Route component={App} path="/" exact />
            <Route component={Medico} path="/medico/:nome"/>
            <Route component={Especialidade} path="/especialidade/:descricao"/>
            <Route component={Horarios} path="/horarios/:dados" />
            <Route component={Profissionais} path="/profissionais/:dados" />
            <Route component={Prestador} path="/prestador" />
            <Route component={ProntuarioEletronico} path="/pep/:dados" />
        </BrowserRouter>
    )
}

export default Routes