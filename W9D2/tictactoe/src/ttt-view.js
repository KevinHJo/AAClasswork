class View {
  constructor(game, el) {
    this.game = game;
    this.setupBoard(el);
  }

  setupBoard(el) {
    const gameGrid = document.createElement('ul');
    el.appendChild(gameGrid);

    for (let i=0; i < 3; i++) {
      for (let j=0; j < 3; j++) {
        let cell = document.createElement('li');
        cell.dataset.position = [i, j];
        gameGrid.appendChild(cell);
      }
    }
  };
  
  bindEvents() {}

  handleClick(e) {}

  makeMove(square) {}

}

module.exports = View;
