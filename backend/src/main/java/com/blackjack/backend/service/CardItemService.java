package com.blackjack.backend.service;

import java.util.List;
import com.blackjack.backend.entities.CardItem;

public interface CardItemService {
	List<CardItem> getAllCardItems();
	List<CardItem> getCardItemsByCardId(int id);
}

