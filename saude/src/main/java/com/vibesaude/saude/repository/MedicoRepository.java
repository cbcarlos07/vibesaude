package com.vibesaude.saude.repository;
import com.vibesaude.saude.domain.models.Medico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public interface MedicoRepository extends JpaRepository<Medico, Long> {


    List<Medico> findByNomeContaining(String nome);
}
