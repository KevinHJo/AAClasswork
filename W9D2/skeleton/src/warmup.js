
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    if(Array.from(htmlElement.children).length > 0){
        htmlElement.removeChild(htmlElement.firstChild);
    }
    const ptag = document.createElement('p');
    const text = document.createTextNode(string);
    ptag.appendChild(text);
    htmlElement.appendChild(ptag);

};

htmlGenerator('Party Time.', partyHeader);