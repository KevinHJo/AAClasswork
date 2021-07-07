const View = require('./ttt-view') // require appropriate file
const Game = require('../ttt_node/game')// require appropriate file

document.addEventListener("DOMContentLoaded", () => {
  const el = document.getElementById("game");
  const game = new Game();
  const view = new View(game, el);
});
