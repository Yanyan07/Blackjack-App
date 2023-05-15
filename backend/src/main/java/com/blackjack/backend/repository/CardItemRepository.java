package com.blackjack.backend.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.blackjack.backend.entities.CardItem;

public interface CardItemRepository extends JpaRepository<CardItem,Integer> {

	List<CardItem> findByCardId(int id);

}

