package com.blackjack.backend.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import com.blackjack.backend.entities.CardItem;
import com.blackjack.backend.service.DeckService;

@RestController
@CrossOrigin("*")
public class DeckController {
	@Autowired
	private DeckService deckSvc;
	
	@GetMapping("start")
	public void startDeck() {
		deckSvc.initDeck();
	}
	
	@GetMapping("items")
	public List<CardItem> getAllCardItemsInDeck(HttpServletResponse res){
		List<CardItem> items = deckSvc.getAllCardItemsInDeck();
		if(items != null) {
			res.setStatus(200);
		}else {
			res.setStatus(404);
		}
		return items;
	}
	
	@GetMapping("shuffle")
	public List<CardItem> getShuffle(HttpServletResponse res) {
		List<CardItem> items = deckSvc.shuffle();
		if(items != null) {
			res.setStatus(200);
		}else {
			res.setStatus(404);
		}
		return items;
	}

	@PostMapping("deal/{cardItemId}")
	public CardItem dealCard(HttpServletResponse res, @PathVariable int cardItemId) {
		CardItem cardItem = deckSvc.dealCard(cardItemId);
		if(cardItem != null) {
			res.setStatus(200);
		}else {
			res.setStatus(404);
		}
		return cardItem;
	}

}

