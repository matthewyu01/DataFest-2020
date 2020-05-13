const fetch = require('node-fetch');

fetch(
    'https://www.cdc.gov/coronavirus/2019-ncov/cases-updates/new_cases_by_day.json'
)
    .then((res) => res.text())
    .then((text) => {
        const data = JSON.parse(text);
        data.data.columns[0][0] = 'Date';
        data.data.columns[1][0] = 'Cases';
        let result = '';
        for (let i = 0; i < data.data.columns[0].length; i++) {
            result += `${data.data.columns[0][i]},${data.data.columns[1][i]}\n`;
        }
        process.stdout.write(result);
    });
