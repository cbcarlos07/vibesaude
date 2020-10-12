package com.vibesaude.saude.domain.dto;

import com.vibesaude.saude.domain.models.Especialidade;
import com.vibesaude.saude.domain.models.Medico;
import com.vibesaude.saude.domain.models.Paciente;
import lombok.Data;
import org.modelmapper.ModelMapper;


import java.util.Date;

@Data
public class MedicoDTO {
    private Long id;
    private String nome;
    private String crm;
    private String sexo;
    private Date dtNascimento;
    private Especialidade especialidade;

    public static MedicoDTO create(Medico m) {
        ModelMapper modelMapper = new ModelMapper();
        return modelMapper.map(m, MedicoDTO.class);
    }

}
