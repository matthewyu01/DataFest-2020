const fetch = require('node-fetch');

const jsdom = require('jsdom');
const {JSDOM} = jsdom;

if (process.argv.length != 3) {
  console.log(`Usage: ${process.argv[1]} index.js <website>`);
  process.exit(2);
}

const website = process.argv[2];

fetch(`https://www.alexa.com/siteinfo/${website}`)
    .then(res => res.text())
    .then((text) => {
      const {document} = (new JSDOM(text)).window;
      const data = JSON.parse(document.querySelector('#rankData').textContent);
      process.stdout.write('Date,Rank\n');
      Object.getOwnPropertyNames(data['3mrank']).forEach(date => {
        const year = date.substring(0, 4);
        const month = date.substring(4, 6);
        const day = date.substring(6, 8);
        const dateString = `${year}-${month}-${day}`;
        process.stdout.write(`${dateString},${data['3mrank'][date]}\n`);
      })
    });