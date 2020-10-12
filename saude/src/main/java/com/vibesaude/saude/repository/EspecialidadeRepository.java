package com.vibesaude.saude.repository;


import com.vibesaude.saude.domain.models.Especialidade;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EspecialidadeRepository extends CrudRepository<Especialidade, Long> {
}
