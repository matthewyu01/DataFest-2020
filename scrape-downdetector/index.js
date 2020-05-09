const fetch = require('node-fetch');
const fs = require('fs');
const path = require('path');

const jsdom = require('jsdom');
const {JSDOM} = jsdom;

if (process.argv.length != 6) {
  console.log(`Usage: ${
      process.argv[1]} index.js <output-directory> <company> <year> <month>`);
  process.exit(2);
}

const company = process.argv[3];
const year = process.argv[4];
const month = process.argv[5];

fetch(`https://downdetector.com/status/${company}/archive/${year}/${month}`)
    .then(res => res.text())
    .then((data) => {
      const {document} = (new JSDOM(data)).window;
      let i = 0;
      const dates = [];
      const times = [];
      document.querySelectorAll('.date').forEach((a) => {
        const text = a.textContent.trim();
        if (i++ % 2 == 0) {
          dates.push(text);
        } else {
          times.push(text);
        }
      });

      const obj = {
        company: company,
        year: year,
        month: month,
        dates: dates,
        times: times,
      };
      let string = 'Company,Date,Time\n';
      for (let i = 0; i < obj.dates.length; i++) {
        string += `${company},${dates[i]},${times[i]}\n`;
      }

      const output_path =
          path.join(process.argv[2], `${company}-${month}-${year}.csv`);
      fs.writeFileSync(output_path, string);
      console.log(`Sucessfully wrote to \`${output_path}'`);
    });