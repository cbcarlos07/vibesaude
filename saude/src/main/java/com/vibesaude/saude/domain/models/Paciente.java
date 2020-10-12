package com.vibesaude.saude.domain.models;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity(name="paciente")
@Data
public class Paciente {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String nome;
    @Column(name = "dt_nascimento")
    private Date dtNascimento;
    private String sexo;
    private String cpf;
}
