const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question("", (input) => {
    const inputs = input.split(' ');
    const n = parseInt(inputs[0]);
    let count = 0;

    for (let i = 1; i <= n; i++) {
        const g = parseInt(inputs[i]);
        let number = g;
        while (number > 0) {
            const h = number % 10;
            number = Math.floor(number / 10);
            if (h % 3 === 0) {
                count += h;
            }
        }
    }

    console.log(count);
    rl.close();
});