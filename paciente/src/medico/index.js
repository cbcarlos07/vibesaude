import React, { useEffect, useState } from 'react'
import api from '../services/api'
import env from '../environments'
import { Link, useHistory } from 'react-router-dom'
import { Base64 } from 'js-base64';

const Medico = ({match}) => {
    const [ medicos, setMedicos ] = useState([])
    const nome = match.params.nome || ""
    const history = useHistory()
    useEffect(()=>{
        const param = nome == '-' ? '' : nome
        api.get(`${env.endpoint}/medico/${param}`)
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


export default Medico