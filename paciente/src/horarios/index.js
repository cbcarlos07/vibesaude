import React, { useState, useEffect } from 'react'
import DatePicker,{ registerLocale } from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import ptBR from 'date-fns/locale/pt-BR';
import { Base64 } from 'js-base64'
import './style.css'
import api from '../services/api';
import env from '../environments';
import { useHistory } from 'react-router-dom';
import mountDate from '../utils/date';

registerLocale('ptBR', ptBR)

const Horarios = ({match}) => {

    const [date, setDate] = useState(new Date());
    const dados = match.params.dados || null
    const [horarios, setHorarios] = useState([])
    const [datas, setDatas] = useState([])
    const [dates, setDates] = useState([])
    const [dataStr, setDataStr] = useState([])
    const [agendados, setAgendados] = useState([])
    const [medico, setMedico] = useState({
        id: 0,
        nome: '',
        crm: '',
        sexo: '',
        dtNascimento: '',
        especialidade: {
            id: 0,
            descricao: ''
        }
    })

    const history = useHistory()
    
    useEffect(()=>{        
        init()
    },[])

    const init = async () => {
        const objMedico = JSON.parse( Base64.decode( dados ) )
        setMedico( objMedico )        
        await buscarHorarios( objMedico.id )
        await buscarOcupados( objMedico.id )
    }

    const buscarHorarios = id => {
        return new Promise((resolve)=>{

            api.get(`${env.endpoint}/horario/doctor/${id}`)
               .then( response => {
                    const dataHora    = []
                    const dataHoraStr = []
                    const datas_ = response.data.map( h =>{
                        const str   = h.data.split('T')
                        const strH  = h.hora.split('T')
                        const strH1 = strH[1].split('.')
                        const date = new Date( str[0] )
                        if( date >= new Date() ){
                            dataHora.push( {data: date, hora: strH1[0]} )
                            dataHoraStr.push( {id: h.id, data: str[0], hora: strH1[0] } )                        
                            return date
                        }
                    } ).filter( e => e != undefined )              
                    setDates( dataHora )
                    setDataStr( dataHoraStr )
                    setDatas(datas_)
                    resolve()
               })
        })
    }

    const buscarOcupados = id => {
        return new Promise((resolve)=>{
            api.get(`${env.endpoint}/horario/busy/${id}`)
               .then( response => {
                
                    const datas_ = response.data.map( h =>{
                        if( h ){
                            
                            const str   = h.horario.data.split('T')
                            const strH  = h.horario.hora.split('T')
                            const strH1 = strH[1].split('.')
                            
                            
                            return {id: h.id, data: str[0], hora: strH1[0], paciente: h.paciente.id }
                        }
                        
                    } ).filter( e => e != undefined )              
                    setAgendados( datas_ )
    
                    resolve()
    
               })
        })
    }



    const onChange = param => {
        const _dataStr = mountDate( param )
        const horas = dataStr.filter( e =>e.data === _dataStr )
        
        let _horarios = horas.map( h => {
            let ocupado = agendados.findIndex( e => e.data === h.data && e.hora === h.hora)
            
            let meusAgendmentos = agendados.filter( e => e.data === _dataStr && e.paciente === Number(env.paciente)  )
            
            

            let tempo = new Date( `${h.data} ${h.hora}`).getTime() - new Date( ).getTime() 
            let hora =  Math.floor(tempo/1000/60/60);
            let botao = 'btn-primary'
            let disabled = 0
            let textBotao = "Agendar"
            
            let index = meusAgendmentos.findIndex( f => f.data === h.data && f.hora === h.hora )
            
            let agendado = meusAgendmentos[ index ] ? meusAgendmentos[ index ].id : 0
            let botaoConfirmar = (<button 
                                        className="btn btn-default btn-block" 
                                        disabled=""
                                        >&nbsp;
                                     </button>)
            if( index > -1 ){
                let obj = {
                    agendado,
                    paciente: {
                        id: env.paciente
                    },
                    horario: {
                        id: h.id
                    },
                    status: {
                        id: 1
                    },
                    confirmado: 1
                }
                if( hora < 24 ) {
                    textBotao = "Agendado"
                    botao = 'btn-danger'
                    disabled = 1
                    botaoConfirmar = (<button className="btn btn-block btn-success"
                                                onClick={() => confirmar(obj)}
                                            >
                                        Confirmar
                                      </button>)
                }else{
                    textBotao = "Cancelar"
                    botao = 'btn-warning'
                    disabled = 0
                    botaoConfirmar = (<button className="btn btn-block btn-success"
                                                onClick={() => confirmar(obj)}
                                            >
                                        Confirmar
                                      </button>)
                }
            }else{
                if( ocupado > -1 ){
                    textBotao = "Agendado"
                    botao = 'btn-warning'
                }
            }
                        
            let obj = { ...h, ocupado, disabled, botao, textBotao, agendado, botaoConfirmar }
            
            
            return obj
            
        })
        
        setHorarios( _horarios )    
    };


    const confirmar = agenda => {        
        let id = agenda.agendado
        delete agenda.agendado
        api.put(`${env.endpoint}/agenda/${id}`, agenda)
            .then( response =>{
                        
                if( response ){
                    alert('Confirmado com sucesso!')
                    setHorarios([])
                    buscarHorarios( medico.id )
                    buscarOcupados( medico.id )
                    voltar()
                }
            } )
    }

    const voltar = ( ) => {
        history.push('/')
    }



    const agendar = (agenda) => {
        
        console.log(agenda);
        
        const paciente = Number( env.paciente )        
        const dados = {
            paciente: {
                id: paciente
            },
            horario: {
                id: agenda.id
            },
            status: {
                id: 1
            }
            
        }
        
        if( agenda.agendado == 0){

            api.post(`${env.endpoint}/agenda`, dados)
               .then( response =>{
                           
                   if( response ){
                        alert('Agendado com sucesso!')
                        setHorarios([])
                        buscarHorarios( medico.id )
                        buscarOcupados( medico.id )
                        voltar()
                   }
               } )
        }else{
            dados.status.id = 2
            let id = agenda.agendado
            api.put(`${env.endpoint}/agenda/${id}`, dados)
               .then( response =>{
                           
                   if( response ){
                        alert('Cancelado com sucesso!')
                        setHorarios([])
                        buscarHorarios( medico.id )
                        buscarOcupados( medico.id )
                        voltar()
                   }
               } )
        }
        
        
    }

    return (
        <>
            <div className="container">
                <button className="btn btn-voltar btn-primary" onClick={voltar}>
                    <i className="fa fa-reply"></i>
                    Voltar
                </button>
                <h1>Escolha uma data </h1>
                <div>
                    <div>
                        <label >Médico:</label>
                        <span >{medico.nome}</span>
                    </div>
                    <div>
                        <label >Especialidade:</label>
                        <span >{medico.especialidade.descricao}</span>
                    </div>
                </div>
                <div className="row"/>
                <div className="calendar">

                    <div className="react-datepicker-wrapper">
                        <DatePicker
                            locale="ptBR"                
                            selected={date}
                            onChange={date => onChange(date)}
                            minDate={new Date()}
                            highlightDates={datas}
                            inline
                        />
                    </div>
                </div>

                <div>
                    <h2>Horarios</h2>
                    {
                        horarios.length > 0 
                        ?
                        horarios.map( h =>(
                            <div className="col-md-4 col-xs-12" key={h.id}>

                                <div className="panel panel-success">
                                    <div className="panel-heading">
                                        <button 
                                            className={`btn btn-block ${h.botao}` }
                                            disabled={h.disabled === 1}
                                            onClick={() => agendar(h)}
                                            >
                                                { 
                                                    h.textBotao 
                                                }
                                        </button>
                                    </div>
                                    <div className="panel-body">
                                        <h3 className="text-center">{ h.hora }</h3>
                                    </div>
                                    <div className="panel-footer">
                                        { h.botaoConfirmar }
                                    </div>
                                </div>

                            </div>
                        ))

                        : ''
                    }

                </div>
            </div>
        </>
    )

}

export default Horarios