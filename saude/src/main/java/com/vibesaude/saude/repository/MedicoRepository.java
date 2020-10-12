package com.vibesaude.saude.repository;
import com.vibesaude.saude.domain.dto.MedicoEspecialidadeDTO;
import com.vibesaude.saude.domain.models.Medico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public interface MedicoRepository extends JpaRepository<Medico, Long> {


    List<Medico> findByNomeContaining(String nome);

    @Query(value = "select new com.vibesaude.saude.domain.dto.MedicoEspecialidadeDTO(m.id, m.nome, m.crm, e.descricao) " +
            "from com.vibesaude.saude.domain.models.Medico m " +
            "inner join m.especialidade e")
    List<MedicoEspecialidadeDTO> findByMedicoEspecialidade();
}
