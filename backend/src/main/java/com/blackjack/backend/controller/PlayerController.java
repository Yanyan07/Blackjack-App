package com.blackjack.backend.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.blackjack.backend.entities.Card;
import com.blackjack.backend.entities.CardItem;
import com.blackjack.backend.service.PlayerService;

@RestController
@CrossOrigin("*")
public class PlayerController {
	@Autowired
	private PlayerService playerService;
	
	@PostMapping("player/cards")
	public List<Card> getCardsFromItems(HttpServletResponse res, @RequestBody List<CardItem> items) {
		List<Card> cards = playerService.getCardsFromItems(items);
		if(cards != null) {
			res.setStatus(200);
			return cards;
		}else {
			res.setStatus(404);
			return null;
		}
	}
	
	@PostMapping("player/value")
	public Integer getCardsValue(@RequestBody List<CardItem> items) {
		return playerService.getCardsValue(items);
	}
	
	@PostMapping("player/singlevalue")
	public Integer getCardValue(@RequestBody CardItem item) {	
		return playerService.getCardValue(item);
	}
	
	@PostMapping("player/blackjack")
	public Boolean isBlackjack(@RequestBody List<CardItem> items) {
		return playerService.isBlackjack(items);
	}
	
	@PostMapping("player/bust")
	public Boolean isBusted(@RequestBody List<CardItem> items) {
		return playerService.isBusted(items);
	}
	
}

