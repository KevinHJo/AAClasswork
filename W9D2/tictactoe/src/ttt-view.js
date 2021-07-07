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
    this.boundHandleClick = this.handleClick.bind(this)
    this.cells.addEventListener('click', this.boundHandleClick);
  }

  handleClick(e) {
    let pos = e.target.dataset.position.split(",")
    pos = pos.map( ele => parseInt(ele) );
    
    if (e.target.classList.contains('marked')) {
      alert('This is not a valid move')
    } else {
      this.makeMove(e.target);
    }

    const mark = document.createTextNode(this.game.currentPlayer.toUpperCase());
    this.game.playMove(pos);
    e.target.appendChild(mark);

    if (this.game.winner()) {
      const div = document.querySelector('#game');
      const winMessage = document.createElement('p');
      const message = document.createTextNode(`Congratulations ${this.game.winner()}`);
      winMessage.appendChild(message);
      div.appendChild(winMessage);

      this.cells.removeEventListener('click', this.boundHandleClick)
    }
  }

  makeMove(square) {
    square.classList.toggle("marked");
  }
  

}



module.exports = View;
