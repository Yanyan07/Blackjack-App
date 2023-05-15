package com.blackjack.backend.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.blackjack.backend.entities.CardItem;
import com.blackjack.backend.repository.CardItemRepository;

@Service
public class DeckServiceImpl implements DeckService {
	@Autowired
	private CardItemRepository cardItemRepo;

	@Override
	public void initDeck() {
		List<CardItem> items = cardItemRepo.findAll();
		for(int i=0; i<items.size(); i++) {
			Optional<CardItem> itemOpt = cardItemRepo.findById(items.get(i).getId());
			if(itemOpt != null) {
				CardItem item = itemOpt.get();
				item.setIsAvailable(true);
				cardItemRepo.saveAndFlush(item);
			}
		}
	}
	
	@Override
	public List<CardItem> getAllCardItemsInDeck(){
		List<CardItem> res = new ArrayList<>();
		List<CardItem> items = cardItemRepo.findAll();
		for(int i=0; i<items.size(); i++) {
			if(items.get(i).getIsAvailable()) {
				res.add(items.get(i));
			}
		}
		return res;
	}
	
	@Override
	public List<CardItem> shuffle() {
		List<CardItem> items = getAllCardItemsInDeck();
		Collections.shuffle(items);
		return items;
	}
	
	@Override
	public CardItem dealCard(int cardItemId) {
		Optional<CardItem> existingItemOpt = cardItemRepo.findById(cardItemId);
		if(existingItemOpt.isPresent()) {
			CardItem existingItem = existingItemOpt.get();
			existingItem.setIsAvailable(false);
			cardItemRepo.saveAndFlush(existingItem);
			return existingItem;
		}
		return null;
	}
	
}
