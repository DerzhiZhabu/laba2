const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let wh = new Map();
let keys = [];
let col = { 'R': 0, 'W': 1, 'B': 2 };

rl.question('', (a) => {
  for (let i = 0; i < a.length / 2; i++) {
    let colc = parseInt(a[i * 2 + 1]);
    if (wh.has(colc)) {
      wh.get(colc)[col[a[i * 2]]] = 1;
    } else {
      wh.set(colc, [0, 0, 0]);
      wh.get(colc)[col[a[i * 2]]] = 1;
      keys.push(colc);
    }
  }
  let count = 0;
  for (let i = 0; i < keys.length; i++) {
    let b = wh.get(keys[i]);
    if (b[0] + b[1] + b[2] === 3) {
      count++;
    }
  }
  console.log(count);
  
  rl.close();
});