import React, { useState, useEffect } from 'react'
import { useHistory, Link } from 'react-router-dom'
import api from '../services/api'
import env from '../environments'
import { Base64 } from 'js-base64'

const Especialidade = ({match}) => {

    const [ especialidade, setEspecialidade ] = useState([])
    const descricao = match.params.descricao || "%"
    const history = useHistory()
    useEffect(()=>{
        const param = descricao == '-' ? '' : descricao
        api.get(`${env.endpoint}/especialidade/${param}`)
           .then( response => {
                setEspecialidade( response.data )
           }) 
    },[])

    const click = esp => {
        const mB64 = Base64.encode( JSON.stringify( esp ) )
        history.push( `/profissionais/${mB64}` )
    }

    return (
        <>
            <div className="container">
                <h1 className="text-center">Lista de Especialidades</h1>
                {
                    especialidade.length > 0 ?
                    especialidade.map( m =>(
                        <Link 
                            to="#" 
                            onClick={() => click(m)} 
                            key={m.id}>
                                <div className="col-md-4 col-xs-12" >

                                    <div className="panel panel-primary">
                                        <div className="panel-heading">
                                            
                                        </div>
                                        <div className="panel-body">
                                            Especialidade: <strong>{m.descricao}</strong>
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

export default Especialidade