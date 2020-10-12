package com.vibesaude.saude.repository;

import com.vibesaude.saude.domain.dto.PacienteDTO;
import com.vibesaude.saude.domain.models.Paciente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface PacienteRepository extends JpaRepository<Paciente, Long> {

    List<Paciente> findByNomeContaining(String nome);
}
