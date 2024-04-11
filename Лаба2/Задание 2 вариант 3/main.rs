use std::io;

fn main() {
    let mut wh: std::collections::HashMap<i32, Vec<i32>> = std::collections::HashMap::new();
    let mut keys: Vec<i32> = Vec::new();
    let col: std::collections::HashMap<char, usize> = [('R', 0), ('W', 1), ('B', 2)].iter().cloned().collect();
    let mut a = String::new();
    io::stdin().read_line(&mut a).expect("Failed to read line");

    for i in 0..a.len()/2 {
        let colc = a.chars().nth(i * 2 + 1).unwrap().to_digit(10).unwrap() as i32;
        if wh.contains_key(&colc) {
            if let Some(vec) = wh.get_mut(&colc) {
                vec[col[&a.chars().nth(i * 2).unwrap()]] = 1;
            }
        } else {
            let mut colors = vec![0; 3];
            colors[col[&a.chars().nth(i * 2).unwrap()]] = 1;
            wh.insert(colc, colors);
            keys.push(colc);
        }
    }

    let mut count = 0;
    for &key in &keys {
        if let Some(b) = wh.get(&key) {
            if b.iter().sum::<i32>() == 3 {
                count += 1;
            }
        }
    }

    println!("{}", count);
}
