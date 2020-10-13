package com.vibesaude.saude.domain.dto;


import lombok.Data;
import java.util.Date;

@Data
public class HorarioOcupadoDTO {
    private long id;
    private Date data;
    private Date hora;
    private Object ocupado;

    public HorarioOcupadoDTO(long _id, Date _data, Date _hora, Object _ocupado){
        this.id      = _id;
        this.data    = _data;
        this.hora    = _hora;
        this.ocupado = _ocupado;
    }

}
