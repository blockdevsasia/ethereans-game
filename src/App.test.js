import React from 'react'
import ReactDOM from 'react-dom'
import App from './App'
import GoogleApiWrapper from './googlemap'
import Header from './Header'
import Home from './Home'

it('App component renders without crashing', () => {
  const div = document.createElement('div')
  ReactDOM.render(<App />, div)
})

it('GoogleApiWrapper renders without crashing', () => {
  const div = document.createElement('div')
  ReactDOM.render(<GoogleApiWrapper />, div)
})

it('Header renders without crashing', () => {
  const div = document.createElement('div')
  ReactDOM.render(<Header />, div)
})

it('Home renders without crashing', () => {
  const div = document.createElement('div')
  ReactDOM.render(<Home />, div)
})
