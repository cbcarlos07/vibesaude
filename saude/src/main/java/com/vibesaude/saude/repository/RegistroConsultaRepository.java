package com.vibesaude.saude.repository;

import com.vibesaude.saude.domain.models.RegistroConsulta;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RegistroConsultaRepository extends CrudRepository<RegistroConsulta, Long> {
}
