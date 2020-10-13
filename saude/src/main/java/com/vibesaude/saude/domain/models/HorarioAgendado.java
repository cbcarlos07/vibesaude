package com.vibesaude.saude.domain.models;

import lombok.Data;

import javax.persistence.*;

@Entity(name = "horario_agendado")
@Data
public class HorarioAgendado {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @OneToOne()
    @JoinColumn(name = "paciente_id",nullable=false)
    private Paciente paciente;
    @ManyToOne(optional = true)
    @JoinColumn(name = "horarios_id",nullable=false)
    private Horario horario;
    @OneToOne()
    @JoinColumn(name = "status_id",nullable=false)
    private Status status;
    private int confirmado;
}
