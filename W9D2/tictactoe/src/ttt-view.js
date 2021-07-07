class View {
  constructor(game, el) {
    this.game = game;
    this.setupBoard(el);
    this.cells = document.querySelector('#game ul');
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
  
  
  bindEvents() {
    this.cells.addEventListener('click',this.handleClick.bind(this));
  }

  handleClick(e) {
    console.log(this);
    let pos = e.target.dataset.position.split(",")
    pos = pos.map( ele => parseInt(ele) );
    this.game.playMove(pos);
    const mark = document.createTextNode(this.game.currentPlayer.toUpperCase());
    e.target.appendChild(mark);
    this.makeMove(e.target);

    
  }

  makeMove(square) {
    square.classList.toggle("marked");
  }
  

}



module.exports = View;
