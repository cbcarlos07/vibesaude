package com.vibesaude.saude.domain.dto;

import com.vibesaude.saude.domain.models.Paciente;
import lombok.Data;
import org.modelmapper.ModelMapper;

import java.util.Date;

@Data
public class PacienteDTO {
    private long id;
    private String nome;
    private Date dtNascimento;
    private String sexo;
    private String cpf;

    public static PacienteDTO create(Paciente paciente) {
        ModelMapper modelMapper = new ModelMapper();
        return modelMapper.map(paciente, PacienteDTO.class);
    }
}
