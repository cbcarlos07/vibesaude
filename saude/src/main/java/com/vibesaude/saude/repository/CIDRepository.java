package com.vibesaude.saude.repository;

import com.vibesaude.saude.domain.models.Cid;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CIDRepository extends JpaRepository<Cid, Long> {
}
