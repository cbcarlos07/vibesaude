import React, { useEffect, useState } from 'react'
import { Base64 } from 'js-base64'
import { useHistory } from 'react-router-dom'
import api from '../services/api'
import env from '../environments'
import mountDate from '../utils/date'

const ProntuarioEletronico = ({match}) => {
    const dados = match.params.dados || ''
    const [cids, setCids] = useState([])
    const [paciente, setPaciente] = useState({
        id: 0,
        paciente: {},
        horario: {},
        status: {},
        confirmado: 0
    })
    const [formData, setFormData] = useState({
        data: '', descricao: '', cid: '', hoag_id: 0
	})
    const history = useHistory()
    const [formValid, setFormValid] = useState(true)

	function handleInputChange(event){
        const { name, value } = event.target        
        setFormData({...formData, [name]: value})
     
    }
    


	function handleSubmit(e) {
        e.preventDefault()
        if( formData.cid == '0' || formData.descricao == '' ){
            alert('Preencha todos os campos')
            return
        }
        console.log('form', formData);
        const obj = {
            data: formData.data,
            descricao: formData.descricao,
            cid: {
                id: formData.cid
            },
            agendado: {
                id: formData.hoag_id
            }
        }

        api.post(`${env.endpoint}/registro`, obj)
           .then( response =>{
               api.get( `${env.endpoint}/agenda/${paciente.id}` )
                  .then( _response => {
                    console.log('agenda',_response.data);
                    let agenda = _response.data
                    let id = agenda.id
                    let obj = {
                        
                        paciente: {
                            id: paciente.paciente.id
                        },
                        horario: {
                            id: agenda.horario.id
                        },
                        status: {
                            id: 3
                        },
                        confirmado: agenda.confirmado
                    }

                    api.put( `${env.endpoint}/agenda/${id}`, obj )
                       .then( __response =>{

                           alert('Salvo com sucesso')
                           history.push('/prestador')
                       })
                    
                    
                  })
           }) 
        
		
	}
	
    useEffect(()=>{
        const objDados = JSON.parse( Base64.decode( dados ) )
        console.log(objDados);
        let curDate = mountDate( new Date() )
        const form = 
            {
                data: curDate, descricao: '', cid: '', hoag_id: objDados.id
            }
        setFormData( form )
        
        setPaciente( objDados )

        api.get( `${env.endpoint}/cid` )
           .then( response =>{
               setCids( response.data )
           }) 

    },[])



    return (
        <>
            <div className="container">
            <h1 className="text-center">Prontuário Eletrônico do Paciente</h1>
            <dl>
                <dt>Paciente</dt>
                <dd>{paciente.paciente.nome}</dd>
            </dl>
                <form onSubmit={handleSubmit}>
                    <div className="col-md-12">
                        <div className="col-md-12">
                            <label>Descrição</label>
                            <textarea
                                className="form-control"
                                rows="10"
                                cols="20"
                                name="descricao"
                                id="descricao"
                                onKeyUp={handleInputChange}
                            >
                                {formData.descricao}
                            </textarea>
                        </div>
                        <div className="col-md-12">
                            <label>CID</label>
                            <select 
                                className="form-control"
                                name="cid"
                                id="cid"
                                onChange={handleInputChange}
                                
                            >
                                <option value="0">SELECIONE UM CID</option>
                                {
                                    cids.length > 0
                                    ?
                                        cids.map( c =>(
                                            <option key={c.id} value={c.id}>
                                                { c.descricao }
                                            </option>
                                        ))
                                    :
                                    ''
                                }
                            </select>

                        </div>
                        <br />
                        <div className="col-md-12">
                            <div className="col-md-5">
                                <button type="submit" className="btn btn-primary" >
                                    SALVAR
                                </button>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </>
    )
}

export default ProntuarioEletronico