package com.vibesaude.saude.repository;


import com.vibesaude.saude.domain.models.Especialidade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;



import java.util.List;

@Repository
public interface EspecialidadeRepository extends JpaRepository<Especialidade, Long> {
    List<Especialidade> findByDescricaoContaining(String nome);

}
