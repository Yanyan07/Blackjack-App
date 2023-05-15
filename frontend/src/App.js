import {useState} from 'react';
import './App.css';
import Deck from './components/deck/Deck';
import Player from './components/player/Player';
import axios from 'axios';

function App() {
  const [cardItems,setCardItems] = useState([]);
  const [isStart, setIsStart] = useState(true);

  const initDeck = ()=>{
    axios.get('http://localhost:8080/start').then(response => {
      axios.get('http://localhost:8080/shuffle').then(response => {
        setCardItems(response.data);
        setIsStart(false);
      });
    });
  }

  const getStart = ()=>{
    setIsStart(true);
  }

  return (
    <div className="App">
      <div className="bgc">BLACK JACK</div>
      {
        isStart ? <Deck onInit={initDeck}/> : <Player items={cardItems} onStart={getStart} />
      } 
    </div>
  );
}

export default App;
