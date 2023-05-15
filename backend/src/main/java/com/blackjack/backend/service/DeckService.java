package com.blackjack.backend.service;

import java.util.List;
import com.blackjack.backend.entities.CardItem;

public interface DeckService {
	void initDeck();
	List<CardItem> shuffle();
	CardItem dealCard(int cardItemId);
	List<CardItem> getAllCardItemsInDeck();
}
