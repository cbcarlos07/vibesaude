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
    private String descricao;
}
