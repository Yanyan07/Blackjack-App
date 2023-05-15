package com.blackjack.backend.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.blackjack.backend.entities.CardItem;
import com.blackjack.backend.repository.CardItemRepository;

@Service
public class CardItemServiceImpl implements CardItemService {
	@Autowired
	private CardItemRepository cardItemRepo;

	@Override
	public List<CardItem> getAllCardItems() {
		return cardItemRepo.findAll();
	}
	
	@Override
	public List<CardItem> getCardItemsByCardId(int id){
		return cardItemRepo.findByCardId(id);
	}

}

