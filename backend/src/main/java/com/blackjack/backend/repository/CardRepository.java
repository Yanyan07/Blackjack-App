package com.blackjack.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.blackjack.backend.entities.Card;

public interface CardRepository extends JpaRepository<Card,Integer> {
	
}

