import './Deck.css';
import React from 'react';

export default function Deck(props){
  const startDeck = ()=>{
    props.onInit();
  }

  return (
    <div className="deck">  
      <button className="start btn" onClick={startDeck}>Start</button>
    </div>
  )
}



