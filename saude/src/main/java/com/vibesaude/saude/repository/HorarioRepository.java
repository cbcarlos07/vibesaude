package com.vibesaude.saude.repository;

import com.vibesaude.saude.domain.models.Horario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.websocket.server.PathParam;
import java.sql.Date;
import java.util.List;

@Repository
public interface HorarioRepository extends JpaRepository<Horario, Long> {
    List<Horario> findByData(Date date);

    @Query(value = "select h from com.vibesaude.saude.domain.models.Horario h where h.medico.id = :id and h.data >= date(now())")
    List<Horario> findByDoctor(@PathParam("id") Long id);
}
