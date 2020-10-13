package com.vibesaude.saude.domain.dto;

import com.vibesaude.saude.domain.models.Especialidade;
import lombok.Data;
import org.modelmapper.ModelMapper;

@Data
public class EspecialidadeDTO {
    private long id;
    private String descricao;

    public static EspecialidadeDTO create(Especialidade e) {
        ModelMapper modelMapper = new ModelMapper();
        return modelMapper.map(e, EspecialidadeDTO.class);
    }
}
