package com.blackjack.backend.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.blackjack.backend.entities.Card;
import com.blackjack.backend.entities.CardItem;
import com.blackjack.backend.repository.CardItemRepository;

@Service
public class PlayerServiceImpl implements PlayerService {
	@Autowired
	private CardItemRepository cardItemRepo;

	@Override
	public List<Card> getCardsFromItems(List<CardItem> items) {
		List<Card> cards = new ArrayList<>();
		for(int i=0; i<items.size(); i++) {
			Optional<CardItem> itemOpt = cardItemRepo.findById(items.get(i).getId());
			if(itemOpt.isPresent()) {
				CardItem item = itemOpt.get();
				cards.add(item.getCard());				
			}
		}
		return cards;
	}
	
	@Override
	public Integer getCardsValue(List<CardItem> items) {
		if(items==null || items.size()==0) {
			return 0;
		}
		Map<String,Integer> map = new HashMap<>();
		map.put("2", 2);
		map.put("3", 3);
		map.put("4", 4);
		map.put("5", 5);
		map.put("6", 6);
		map.put("7", 7);
		map.put("8", 8);
		map.put("9", 9);
		map.put("10", 10);
		map.put("J", 10);
		map.put("Q", 10);
		map.put("K", 10);
		map.put("A", 1);
		
		List<Card> cards = getCardsFromItems(items);
		int sum = 0;
		int countA = 0;
		for(int i=0; i<cards.size(); i++) {
			String key = cards.get(i).getRank();
			sum += map.get(key);
			if(cards.get(i).getRank().equals("A")) {
				countA++;				
			}
		}
		for(int i=0; i<countA; i++) {
			if(sum+10 <= 21) {
				sum += 10;
			}
		}		
		return sum;
	}
	
	@Override
	public Integer getCardValue(CardItem item) {
		if(item==null) {
			return 0;
		}
		Map<String,Integer> map = new HashMap<>();
		map.put("2", 2);
		map.put("3", 3);
		map.put("4", 4);
		map.put("5", 5);
		map.put("6", 6);
		map.put("7", 7);
		map.put("8", 8);
		map.put("9", 9);
		map.put("10", 10);
		map.put("J", 10);
		map.put("Q", 10);
		map.put("K", 10);
		map.put("A", 1);
		
		int sum = 0;
		Optional<CardItem> itemOpt = cardItemRepo.findById(item.getId());
		if(itemOpt.isPresent()) {
			CardItem itemObj = itemOpt.get();			
			String key = itemObj.getCard().getRank();
			sum += map.get(key);
			if(key.equals("A")) {
				sum += 10;
			}	
		}
		return sum;
	}

	@Override
	public Boolean isBlackjack(List<CardItem> items) {
		if(items==null || items.size()<2 || items.size()>2) {
			return false;
		}
		List<Card> cards = getCardsFromItems(items);
		Card card1 = cards.get(0);
		Card card2 = cards.get(1);
		int sum = getCardsValue(items);
		
		if((card1.getRank().equals("A")||card2.getRank().equals("A")) && sum==21) {
			return true;
		}	
		return false;
	}
	
	@Override
	public Boolean isBusted(List<CardItem> items) {
		if(items==null || items.size()<=2) {
			return false;
		}	
		return getCardsValue(items) > 21;
	}
	
	
	
}

