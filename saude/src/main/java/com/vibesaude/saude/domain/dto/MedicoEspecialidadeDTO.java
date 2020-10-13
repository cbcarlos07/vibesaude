package com.vibesaude.saude.domain.dto;

import com.vibesaude.saude.domain.models.Medico;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class MedicoEspecialidadeDTO {
    private Long id;
    private String nome;
    private String crm;
    private String especialidade;
    public MedicoEspecialidadeDTO(Long id, String nome, String crm, String descricao){
        this.id = id;
        this.nome = nome;
        this.crm = crm;
        this.especialidade = descricao;
    }
}
