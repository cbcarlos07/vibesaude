import React, { useState } from 'react';
import { useHistory } from 'react-router-dom'
import './assets/css/bootstrap.css'
import './App.css'
const App = () => {
	const history = useHistory();
	const [formData, setFormData] = useState({
        texto: '',
	})

	function handleInputChange(event){
        const { name, value } = event.target
        setFormData({...formData, [name]: value})
	}

	function handleSubmit(rota) {
		const param = formData.texto == '' ? '-' : formData.texto
		history.push(`/${rota}/${param}`)
		
	}
	
	return (
		<div className="container">

			<div className="form">
			<p className="inf">Informe o Médico ou a Especialidade</p>
			<div className="container text-center col-md-6">
			
			<input 
				className="form-control"
				placeholder="Sua pesquisa"
				name="texto"
				id="texto"
				onChange={handleInputChange}
				value={formData.texto}
			/>
			</div>
			<button 
				className="btn btn-primary"
				onClick={() => handleSubmit("medico")}
				>
				Médico
			</button>&nbsp;
			<button 
				className="btn btn-success"
				onClick={() => handleSubmit("especialidade")}
			>Especialidade</button>
			</div>
		</div>
		);
	}
	
	export default App;
	