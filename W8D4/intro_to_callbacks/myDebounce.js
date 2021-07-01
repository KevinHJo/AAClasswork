class SearchBar {
    constructor() {
      this.query = "";
  
      this.type = this.type.bind(this);
      this.search = this.search.bind(this);
    }
  
    type(letter) {
      this.query += letter;
      this.search();
    }
  
    search() {
      console.log(`searching for ${this.query}`);
    }
  }

Function.prototype.myDebounce = function(interval) {
    let timeout;
    // return a function that takes an arbitrary number of arguments
    return (...args) => {
    // declare a function that sets timeout to null and invokes this with args
        const fnCall = () => {
            timeout = null;
            this(...args);
        }
    // each time this function is called, it will clear the previous timeout
    // and create a new one that invokes fnCall after the interval has passed
    // since the timeout is reset every time the function is invoked, 
    // fnCall will only be called once the interval has passed without any new 
    // invocations
        clearTimeout(timeout);
        timeout = setTimeout(fnCall, interval);
    }
}

const searchBar = new SearchBar();

searchBar.search = searchBar.search.myDebounce(500);

const queryForHelloWorld = () => {
  searchBar.type("h");
  searchBar.type("e");
  searchBar.type("l");
  searchBar.type("l");
  searchBar.type("o");
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
};

queryForHelloWorld()