package com.vibesaude.saude.domain.models;

import lombok.Data;

import javax.persistence.*;
import java.sql.Date;

@Entity(name = "registro_consulta")
@Data
public class RegistroConsulta {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private Date data;
    private String descricao;
    @OneToOne()
    @JoinColumn(name = "cid_id",nullable=false)
    private Cid cid;
    @OneToOne()
    @JoinColumn(name = "hoag_id",nullable=false)
    private HorarioAgendado agendado;
}
