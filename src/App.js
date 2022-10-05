import React, {useState} from 'react'
import logo from './logo.svg';
import './App.css';
import { Navbar } from './components/Navbar';

function App() {
  const [isLogin, setIsLogin] = useState(false)
  return isLogin ? <Navbar/> : (<> <div className="App">
    <header className="App-header">
    <h1>Hi, Hello World</h1>
    </header>
  </div>
  </>)
}

export default App;
