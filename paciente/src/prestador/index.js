import React, { useEffect, useState } from 'react'
import mountDate from '../utils/date'
import env from '../environments'
import { useHistory } from 'react-router-dom'
import api from '../services/api'
import { Base64 } from 'js-base64'

const Prestador = () => {
    const [data, setData] = useState()
    const [pacientes, setPaciente] =  useState([])
    const [formData, setFormData] = useState({
        nome: '',
        data1: '',
        data2: '',
        status: 1,
        id: env.medico
    })
    const history = useHistory()

	function handleInputChange(event){
        
        const { name, value } = event.target
        setFormData({...formData, [name]: value})
	}

	function handleSubmit(e) {
        e.preventDefault()
        console.log(formData);        
        
        const url = `id=${formData.id}&status=${formData.status}&nome=${formData.nome}`+
                    `&data1=${formData.data1}&data2=${formData.data2}`
        api.get( `${env.endpoint}/agenda/busca?${url}` )
           .then( response =>{
               console.log(response.data);
               
               setPaciente(response.data)
           } ) 
	}
    useEffect(()=>{
        const curDate = new Date()
        const strDate = mountDate(curDate)
        const data1 = strDate
        const data2 = strDate
        const obj = {
            id: env.medico,
            data1,
            data2,
            nome: '',
            status: 1
        }
        setFormData( obj )
        setData( strDate )
    },[])

    const atender = dados =>{
        const mB64 = Base64.encode( JSON.stringify( dados ) )
        history.push( `/pep/${mB64}` )
    }

    const falta = dados =>{
        
        let id = dados.id
        let obj = {
            
            paciente: {
                id: dados.paciente.id
            },
            horario: {
                id: dados.horario.id
            },
            status: {
                id: 4
            },
            confirmado: dados.confirmado
            
        }
        api.put(`${env.endpoint}/agenda/${id}`, obj)
               .then( response =>{
                           
                   if( response ){
                        alert('Informado com sucesso!')
                        setPaciente([])
                        
                   }
               } )
        
    }

    const renderSwitch = param => {
        switch (param.status.id) {
            case 1:
                    if( param.confirmado == 1 ){
                        return (
                            <button className="btn btn-success btn-xs" onClick={ () => atender(param)}>
                                Atender
                            </button>
                        )
                    }else{
                        return (
                            <button className="btn btn-warning btn-xs" onClick={ () => falta(param)}>
                                Informar falta
                            </button>
                        )
                    }
                break;
            case 2:
                return (
                    <button className="btn btn-danger btn-xs" disabled={true}>
                        Cancelado
                    </button>
                )
                break
                case 3:
                    return (
                        <button className="btn btn-primary btn-xs" disabled={true}>
                            Atendido
                        </button>
                    )
                    break        
                case 4:
                     return (
                        <button className="btn btn-danger btn-xs" disabled={true}>
                            Faltou
                        </button>
                        )    
            default:
                break;
        }
    }    
    return (
        <>
            <div className="container">

                <div className="col-md-12">
                    <div className="col-md-12">
                        <input 
                        className="form-control"
                        placeholder="Pesquisa por nome"
                        name="nome"
                        id="nome"
                        value={formData.nome}
                        onChange={handleInputChange}
                        />
                    </div>
                </div> 
                <div className="col-md-12">
                    <label className="col-md-12">Pesquisa por Data</label>

                    <div className="col-md-6">   
                        <input 
                        className="form-control"
                        placeholder="Pesquisa por Data 1"
                        name="data1"
                        id="data1"
                        type="date"
                        value={formData.data1}
                        onChange={handleInputChange}
                        />
                    </div>
                    <div className="col-md-6">   
                        <input 
                        className="form-control"
                        placeholder="Pesquisa por Data 2"
                        name="data2"
                        id="data2"
                        type="date"
                        value={formData.data2}
                        onChange={handleInputChange}
                        />
                    </div>
                </div>
                <div className="col-md-12">
                    <div className="col-md-6">
                        <label>Status</label>
                        <select
                        className="form-control"
                        placeholder="Pesquisa por Data 2"
                        name="status"
                        id="status"
                        type="date"
                        
                        onChange={handleInputChange}
                        >
                            <option value="1">Agendado</option>
                            <option value="2">Cancelado</option>
                            <option value="3">Consulta Realizada</option>
                            <option value="4">Falta</option>                            
                        </select>    
                    </div>
                    <div className="col-md-6">
                        
                        <button className="btn btn-success" onClick={handleSubmit}>Buscar</button>
                    </div>
                </div>
                <div className="row"></div>
                <div className="col-md-12">
                    <h3>Lista de Pacientes</h3>
                    <table className="table table-hover">
                        <thead>
                            <th>NOME</th>
                            <th></th>
                        </thead>
                        <tbody>
                            {
                                pacientes.length > 0
                                ?
                                pacientes.map( p =>(
                                    <tr key={p.id}>
                                        <td>{p.paciente.nome}</td>
                                        <td>
                                            {
                                                renderSwitch(p)
                                            }
                                        </td>
                                    </tr>
                                ))
                                :
                                ''
                            }

                        </tbody>
                    </table>
                </div>

            </div>
        </>
    )

}

export default Prestador