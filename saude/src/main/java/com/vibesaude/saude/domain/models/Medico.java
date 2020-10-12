package com.vibesaude.saude.domain.models;

import com.vibesaude.saude.domain.dto.MedicoDTO;
import com.vibesaude.saude.domain.dto.PacienteDTO;
import lombok.Data;
import org.modelmapper.ModelMapper;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity(name = "medico")
public class Medico {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String nome;
    private String crm;
    private String sexo;
    @Column(name = "dt_nascimento")
    private Date dtNascimento;
    @OneToOne(cascade=CascadeType.ALL)
    @JoinColumn(name = "especialidade_id",nullable=false)
    private Especialidade especialidade;

}
