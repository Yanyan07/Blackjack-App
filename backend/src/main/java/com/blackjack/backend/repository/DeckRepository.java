package com.blackjack.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.blackjack.backend.entities.Deck;

public interface DeckRepository extends JpaRepository<Deck,Integer> {

}

