import React, { useState, useEffect } from 'react'
import { useHistory, Link } from 'react-router-dom'
import api from '../services/api'
import env from '../environments'
import { Base64 } from 'js-base64'

const Profissionais = ({match}) => {
    const [ medicos, setMedicos ] = useState([])
    const dados = match.params.dados || ""
    const [especialidade, setEspecialidade] = useState({})
    const history = useHistory()
    useEffect(()=>{
        const objEspecialidade = JSON.parse( Base64.decode( dados ) )
        setEspecialidade( objEspecialidade )
        api.get(`${env.endpoint}/medico/especialidade/${objEspecialidade.id}`)
           .then( response => {
                setMedicos( response.data )
           }) 
    },[])

    const click = medico => {
        const mB64 = Base64.encode( JSON.stringify( medico ) )
        history.push( `/horarios/${mB64}` )
    }

    return (
        <>
            <div className="container">
                <h1 className="text-center">Lista de Médicos</h1>
                <label>Especialidade:</label> {especialidade.descricao}
                <div className="row" />
                {
                    medicos.length > 0 ?
                    medicos.map( m =>(
                        <Link 
                            to="#" 
                            onClick={() => click(m)} 
                            key={m.id}>
                                <div className="col-md-4 col-xs-12" >

                                    <div className="panel panel-primary">
                                        <div className="panel-heading">
                                            Nome: <strong>{m.nome}</strong>
                                        </div>
                                        <div className="panel-body">
                                            Especialidade: <strong>{m.especialidade.descricao}</strong>
                                        </div>
                                    </div>

                                </div>
                        </Link>
                    ))
                    : ''
                }



            </div>
        </>
    )
}

export default Profissionais