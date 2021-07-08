
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

const dogList = document.querySelector('.drop-down-dog-list')

const dogLinkCreator = () => {
  const dogLinks = []
  
  for (let dog in dogs) {
    const atag = document.createElement('a');
    atag.setAttribute('href', `${dogs[dog]}`);
    atag.setAttribute('target', `_blank`);
    atag.innerHTML = dog;
    const litag = document.createElement('li');
    litag.classList.add('dog-link');
    litag.appendChild(atag);

    dogLinks.push(litag);
  }

  return dogLinks
}

export const attachDogLinks = () => {
  const dogLinks = dogLinkCreator()

  dogLinks.forEach(dogLink => {
    dogList.appendChild(dogLink);
  });
}

const handleEnter = (e) => {
  console.dir(e.target)
  e.target.children[1].style.display = 'block';
};

const handleLeave = (e) => {
  e.target.children[1].style.display = 'none';
};

attachDogLinks();

const dogsNav = document.querySelector('.drop-down-dog-nav')
dogsNav.addEventListener('mouseenter', handleEnter);
dogsNav.addEventListener('mouseleave', handleLeave);

