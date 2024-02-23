import {useState,useEffect} from 'react';
import './Player.css';
import axios from 'axios';

export default function Player(props){
  const [cardItems,setCardItems] = useState([]);
  const [dealerCards,setDealerCards] = useState([]);
  const [playerCards,setPlayerCards] = useState([]);
  const [dealerItems,setDealerItems] = useState([]);
  const [playerItems,setPlayerItems] = useState([]);
  const [dealerValue,setDealerValue] = useState(0);
  const [dealer2ndValue,setDealer2ndValue] = useState(0);
  const [playerValue,setPlayerValue] = useState(0);
  const [dealerResult,setDealerResult] = useState('');
  const [playerResult,setPlayerResult] = useState('');
  const [dealResult,setDealResult] = useState('');
  const [isDeal,setIsDeal] = useState(true);
  const [isEnd,setIsEnd] = useState(false);
  const [isFlip,setIsFlip] = useState(false);
  const [count,setCount] = useState(0);
  const [isBtnDisabled,setIsBtnDisables] = useState(false);
  const [suitObj, setSuitObj] = useState({
    "hearts": "hearts.png",
    "spades": "spades.png",
    "clubs": "clubs.png",
    "diamonds": "diamonds.png",
    "J": "J.png",
    "Q": "Q.png",
    "K": "K.png"
  });
  const [color, setColor] = useState({
    "hearts": "rgb(204, 0, 0)",
    "diamonds": "rgb(204, 0, 0)",
    "spades": "rgb(51, 51, 51)",
    "clubs": "rgb(51, 51, 51)"
  })

  useEffect(()=>{
    setCardItems(props.items);
  }, []);

  useEffect(()=>{
    if(count%5 === 0){
      axios.get('http://localhost:8080/shuffle').then(response => {
        setCardItems(response.data);
      });
    }
  },[count])

  useEffect(()=>{ //update cards and value according to items
    axios.post('http://localhost:8080/player/cards', dealerItems).then(response => {
      setDealerCards(response.data);
    });
    axios.post('http://localhost:8080/player/cards', playerItems).then(response => {
      setPlayerCards(response.data);
    });
    axios.post('http://localhost:8080/player/value', dealerItems).then(response => {
      setDealerValue(response.data);
    });
    if(dealerItems && dealerItems.length>0){
      axios.post('http://localhost:8080/player/singlevalue', dealerItems[1]).then(response => {
        setDealer2ndValue(response.data);
      });
    }
    axios.post('http://localhost:8080/player/value', playerItems).then(response => {
      setPlayerValue(response.data);
    });
  },[dealerItems, playerItems])

  useEffect(()=>{
    if(isFlip && dealerValue<=16){
      if(playerResult!=='Player Bust' && playerResult!=='Player Blackjack'){
        setTimeout(()=>{
          const item = cardItems.pop();
          if(item){
            setDealerItems([...dealerItems, item]);
            axios.post(`http://localhost:8080/deal/${item.id}`);         
          }else{
            reStart();
          }
        },500)
      }
    }
    if(isFlip && (dealerValue>=17||playerResult==='Player Bust'||playerResult==='Player Blackjack')){
      calcValue();
      setCount(count+1);
    }
  },[isFlip,dealerValue,dealerResult,playerResult])

  useEffect(()=>{ //show result if anyone bust or blackjack
    if(dealerItems.length>0 && dealerValue>21){
      setDealerResult('Dealer Bust');
    }
    if(playerItems.length>0 && playerValue>21){
      setPlayerResult('Player Bust');
      setTimeout(()=>{
        setIsFlip(true);
      },500)
    }
    axios.post('http://localhost:8080/player/blackjack', dealerItems).then(response => {
      if(response.data){
        setDealerResult('Dealer Blackjack');
      }
    })
    axios.post('http://localhost:8080/player/blackjack', playerItems).then(response => {
      if(response.data){
        setPlayerResult('Player Blackjack');
        setTimeout(()=>{
          setIsFlip(true);
        },500)
      }
    })   
  },[dealerValue,playerValue,dealerItems,playerItems]);

  useEffect(()=>{ //deal is end, show deal again and reset state
    if(isEnd){
      setIsBtnDisables(true);
      setTimeout(()=>{
        setDealerCards([]);
        setPlayerCards([]);
        setDealerItems([]);
        setPlayerItems([]);
        setDealerValue(0);
        setDealer2ndValue(0);
        setPlayerValue(0);
        setDealerResult('');
        setPlayerResult('');
        setDealResult('');
        setIsDeal(true);
        setIsFlip(false);
        setIsEnd(false);
      },4000)
    }
  },[isEnd])

  const calcValue  = ()=>{
    if(playerResult === 'Player Bust'){
      setDealResult('Dealer Win!');
    }else if(dealerResult === 'Dealer Bust'){
      setDealResult('You Win!');
    }else if(dealerResult==='Dealer Blackjack' && playerResult==='Player Blackjack'){
      setDealResult('Push!');
    }else if(dealerResult==='Dealer Blackjack' && playerResult!=='Player Blackjack'){
      setDealResult('Dealer Win!');
    }else if(dealerResult!=='Dealer Blackjack' && playerResult==='Player Blackjack'){
      setDealResult('You Win!');
    }else if(dealerValue > playerValue){
      setDealResult('Dealer Win!');
    }else if(dealerValue === playerValue){
      setDealResult('Push!');
    }else if(dealerValue < playerValue){
      setDealResult('You Win!');
    }  
    setIsEnd(true);
  }

  const dealCards = ()=>{
    setIsDeal(false);
    setIsBtnDisables(false);
    const dItems = [];
    const pItems = [];
    for(let i=0; i<4; i++){
      const item = cardItems.pop();
      if(item){
        i%2===0 ? dItems.push(item) : pItems.push(item);
        axios.post(`http://localhost:8080/deal/${item.id}`);
      }else{
        reStart();
      }
    }
    setDealerItems(dItems);
    setPlayerItems(pItems);
  }

  const hit = ()=>{
    if(!isEnd){
      const item = cardItems.pop();
      if(item) {
        setPlayerItems([...playerItems, item]);
        axios.post(`http://localhost:8080/deal/${item.id}`);
      }else {
        reStart();
      }
    }
  }

  const stand = ()=>{
    setTimeout(()=>{
      setIsFlip(true);
    },500)
    setIsEnd(true);
  }

  const reStart = ()=>{
    props.onStart();
  }

  return (
    <div className="player">
      {
        count%5===0&&isDeal && <div className="result shuffle">Shuffling...</div>
      }
      
      <button className="exit btn" onClick={reStart} >Exit</button>
      {
        isDeal ? <button className="deal btn" onClick={dealCards}>Deal</button> :
        <div>
          {
            isFlip ? 
            <div className="dealer-show score"><span>{dealerValue}</span>Dealer</div> :
            <div className="dealer-show score"><span>{dealer2ndValue}</span>Dealer</div>
          }
          <div className="player-show score"><span>{playerValue}</span>Player</div>
          <button className="hit btn" onClick={hit} disabled={isBtnDisabled}>Hit</button>
          <button className="stand btn" onClick={stand} disabled={isBtnDisabled}>Stand</button>
          <div className="dealer-cards cards">
            {
              dealerCards.map((card,index) => {
                if(!isFlip && index===0){
                 return <li key={index}>
                          <img className="bgc-img" src={require('../../images/cardback.png')} alt='bgc'/>    
                        </li>
                }else{
                  return <li key={index}> 
                    <div style={{color: color[card.suit]}} >{card.rank}</div>
                    <img className="img1" src={require(`../../images/${suitObj[card.suit]}`)} alt="pic" />
                    {
                      card.rank==="J"||card.rank==="Q"||card.rank==="K" ? 
                      <img className="img2" src={require(`../../images/${suitObj[card.rank]}`)} alt="pic" /> : 
                      <img className="img2" src={require(`../../images/${suitObj[card.suit]}`)} alt="pic" />
                    }
                  </li> 
                }
              })
            }
          </div>
          <div className="player-cards cards">
            {
              playerCards.map((card,index) => 
                <li key={index}>
                  <div style={{color: color[card.suit]}}>{card.rank}</div>
                  <img className="img1" src={require(`../../images/${suitObj[card.suit]}`)} alt="pic" />
                  {
                    card.rank==="J"||card.rank==="Q"||card.rank==="K" ? 
                    <img className="img2" src={require(`../../images/${suitObj[card.rank]}`)} alt="pic" /> : 
                    <img className="img2" src={require(`../../images/${suitObj[card.suit]}`)} alt="pic" />
                  }
                </li>
              )
            }
          </div>
            {
              isEnd &&
              <div>
                {
                  dealerResult && 
                  <div className="dealer-result result">
                    {dealerResult}
                  </div>
                }
                {
                  playerResult &&
                  <div className="player-result result">
                    {playerResult}
                  </div>
                }
                {
                  dealResult && 
                  <div className="final-result result">
                    {dealResult}
                  </div>
                }
              </div> 
            }    
        </div>
      }
    </div>
  )
}

//8*1 7*2