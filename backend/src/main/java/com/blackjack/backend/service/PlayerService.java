package com.blackjack.backend.service;

import java.util.List;
import com.blackjack.backend.entities.Card;
import com.blackjack.backend.entities.CardItem;

public interface PlayerService {
	List<Card> getCardsFromItems(List<CardItem> items);
	Integer getCardsValue(List<CardItem> items);
	Integer getCardValue(CardItem item);
	Boolean isBlackjack(List<CardItem> items);
	Boolean isBusted(List<CardItem> items);
}

