# Ethereans

Ethereans blockchain dapp/game on Ethereum blockchain

Stack:
 - MaterialUI ReactJS Framework
 - Web3.js
 - Solidity Smart Contracts

Steps to run:
 - clone this repo https://github.com/ctverceles/ethereans-game 
 - npm install
 - truffle compile
 - truffle migrate
 - npm run dev
 - feel free to message if something goes wrong :D

Env Notes:
 - Python 2.7 - latest 3+ version isnt supported by dependencies (at least on my machine). 
 - index.js is the "main" file w ReactDOM.render
 - App.js has our "quickstart" layout w some sample css tinkering in the same file

 Truffle: (if not using Ganache)
- truffle develop (for truffle dev console, if not using Ganache)
- compile
- migrate

run webapp (at project root):
- 'npm run start' (or 'npm run dev')

 npm run start error:
 - if you get an error that has something to do with readline module not being found in node-wit.interactive.js, then;
    - cd to this root/node_modules/node-wit
    - npm install readline

 #Resources:
 - started with
 https://goo.gl/4r3c2P

 - Front end framework:
 http://www.material-ui.com

 - smart contract based on tutorial
 https://cryptozombies.io 

 - React routing based on https://medium.com/@pshrmn/a-simple-react-router-v4-tutorial-7f23ff27adf, https://codesandbox.io/s/21pm1lky7r 

- based on truffle-react quickstart
http://truffleframework.com/tutorials/

- Solidity web IDE
http://remix.ethereum.org 

- could be useful for easy smart contract testing
http://www.masonforest.com/blockchain/ethereum/2017/11/13/how-to-deploy-an-erc20-token-in-20-minutes.html


#TODO:
- connect UI event handlers to EthereanFactory functions
- ERC721/827 for payloads?
- Altar object as crowdsale contract? see open-zeppelin

