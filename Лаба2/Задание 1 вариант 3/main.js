function checkP(x) {
    let b = 0;
    let z;
    for (let i = x; i > 1; i--) {
        z = 1;
        for (let j = 2; j <= Math.sqrt(i); j++) {
            if (i % j === 0) {
                z = 0;
                break;
            }
        }
        if (z === 1) {
            b = i;
            break;
        }
    }
    for (let i = x; i > 0; i++) {
        z = 1;
        for (let j = 2; j <= Math.sqrt(i); j++) {
            if (i % j === 0) {
                z = 0;
                break;
            }
        }
        if (z === 1) {
            if (x - b > i - x) {
                b = i;
            }
            break;
        }
    }
    return b;
}

function main() {
    const readline = require('readline');
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    rl.question('Enter a number: ', (x) => {
        x = parseInt(x);
        console.log(Math.abs(x - checkP(x)));
        rl.close();
    });
}

main();