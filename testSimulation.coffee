c = require('./cards')
gameState = require('./gameState')
basicAI = require('./basicAI')

this['game is initialized correctly'] = (test) ->
  st = new gameState.State().initialize([null, null], gameState.kingdoms.moneyOnly)
  test.equal st.players.length, 2 
  test.equal st.current.getVP(), 3
  test.equal st.current.hand.length, 5
  test.equal st.current.draw.length, 5
  test.equal st.current.discard.length, 0
  test.equal st.current.getDeck().length, 10
  test.equal st.phase, 'start'
  test.equal st.gameIsOver(), false
  test.done()

this['game runs without crashing'] = (test) ->
  ai1 = new basicAI.BasicAI()
  ai2 = new basicAI.SillyAI()
  st = new gameState.State().initialize([ai1, ai2], gameState.kingdoms.allDefined)
  st.doPlay(); test.equal st.phase, 'action'
  st.doPlay(); test.equal st.phase, 'treasure'
  st.doPlay(); test.equal st.phase, 'buy'
  st.doPlay(); test.equal st.phase, 'cleanup'
  st.doPlay(); test.equal st.phase, 'start'
  st.doPlay(); test.equal st.phase, 'action'
  st.doPlay(); test.equal st.phase, 'treasure'
  st.doPlay(); test.equal st.phase, 'buy'
  st.doPlay(); test.equal st.phase, 'cleanup'
  st.doPlay(); test.equal st.phase, 'start'
  st.doPlay(); test.equal st.phase, 'action'
  st.doPlay(); test.equal st.phase, 'treasure'
  st.doPlay(); test.equal st.phase, 'buy'
  st.doPlay(); test.equal st.phase, 'cleanup'
  until st.gameIsOver()
    st.doPlay()
  console.log([player.ai.toString(), player.getVP(st), player.turnsTaken] for player in st.players)
  test.done()
