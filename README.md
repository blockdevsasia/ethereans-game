# Ethereans

Ethereans blockchain dapp/game on Ethereum blockchain

Env Notes:
 - Python 2.7 - latest 3+ version isnt supported by dependencies (at least on my machine). 
 - yml anaconda environment file is included in root if you cant get 'npm run start' working - 'conda env create -f ethereans_conda.yml' at root
 - index.js is the "main" file w ReactDOM.render
 - App.js has our "quickstart" layout w some sample css tinkering in the same file

 Truffle: (if not using Ganache)
- truffle develop (for truffle dev console)
- compile
- migrate

Web (at root):
- npm run start
- $(npm bin)/nodemon server.js (for preconfigured mongodb api server) - just in case we wanna use this? cloned this repo from one of my other projects so feel free to prune it :)

 Todo:
 - finalize and test Etherian and Altar objects/contracts

 npm run start error:
 - if you get an error that has something to do with readline module not being found in node-wit.interactive.js, then;
    - cd to this root/node_modules/node-wit
    - npm install readline

Mongoose - MongoDB server GET POST API routes:
- localhost:5000/api/users - user database (providers and recipients)
- localhost:5000/api/tx - tx database (txs betwween providers and recipients)
- localhost:5000/api/material - material goods db
- used http://www.getpostman.com/ for easy get post testing

 Resources:
 - routing based on https://medium.com/@pshrmn/a-simple-react-router-v4-tutorial-7f23ff27adf, https://codesandbox.io/s/21pm1lky7r 

 - uport
 https://developer.uport.me/guides.html#install-the-library/sdk
 https://github.com/uport-project/uport-js
 https://hackmd.io/s/HyCr_66_b

- mongodb server quick setup w mlab
https://github.com/bryantheastronaut/mernCommentBox

- additional truffle.js configs w infura
http://truffleframework.com/tutorials/using-infura-custom-provider

- could be useful for easy smart contract testing
http://www.masonforest.com/blockchain/ethereum/2017/11/13/how-to-deploy-an-erc20-token-in-20-minutes.html


 
