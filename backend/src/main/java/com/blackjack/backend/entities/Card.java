package com.blackjack.backend.entities;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Card {
	@Id
	@GeneratedValue
	private Integer id;
	
	private String suit;
	@Column(name = "rank_val")
	private String rank;
	
	@OneToMany(mappedBy="card")
	private List<CardItem> cardItems;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "deck_id")
	private Deck deck;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSuit() {
		return suit;
	}
	public void setSuit(String suit) {
		this.suit = suit;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public List<CardItem> getCardItems() {
		return cardItems;
	}
	public void setCardItems(List<CardItem> cardItems) {
		this.cardItems = cardItems;
	}
	public Deck getDeck() {
		return deck;
	}
	public void setDeck(Deck deck) {
		this.deck = deck;
	}
}
