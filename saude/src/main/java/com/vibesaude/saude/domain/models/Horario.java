package com.vibesaude.saude.domain.models;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity(name = "horarios")
public class Horario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private Date data;
    private Date hora;
    @OneToOne(cascade=CascadeType.ALL)
    @JoinColumn(name = "medico_id",nullable=false)
    private Medico medico;
}
