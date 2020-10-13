package com.vibesaude.saude.repository;

import com.vibesaude.saude.domain.models.HorarioAgendado;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.websocket.server.PathParam;
import java.sql.Date;
import java.util.List;

@Repository
public interface HorarioAgendadoRepository extends CrudRepository<HorarioAgendado, Long> {
    @Query(value = " select ha from com.vibesaude.saude.domain.models.HorarioAgendado ha "+
            " inner join ha.horario h "+
            " inner join h.medico m "+
            " inner join ha.status s "+
            " inner join ha.paciente p "+
            " where m.id = :id"
            +" and h.data between :data1 and :data2"
            +" and s.id = :status"
            +" and p.nome like :nome"
    )
    List<HorarioAgendado> agendados(@PathParam("id") Long id,
                                   @PathParam("status") long status,
                                   @PathParam("nome") String nome,
                                   @PathParam("data1") Date data1,
                                   @PathParam("data2") Date data2
                                   );
}
