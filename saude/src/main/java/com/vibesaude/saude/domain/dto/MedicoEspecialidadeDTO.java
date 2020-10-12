package com.vibesaude.saude.domain.dto;

import com.vibesaude.saude.domain.models.Medico;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MedicoEspecialidadeDTO {
    private Long id;
    private String nome;
    private String crm;
    private String especialidade;

    public MedicoEspecialidadeDTO(Medico m){
        this.id = m.getId();
        this.nome = m.getNome();
        this.crm = m.getCrm();
        this.especialidade = m.getEspecialidade().getDescricao();
    }

}
