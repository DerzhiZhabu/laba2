use std::io;

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let inputs: Vec<&str> = input.trim().split_whitespace().collect();
    let n: usize = inputs[0].parse().expect("Invalid input");

    let mut count = 0;
    for i in 1..=n {
        let g: i32 = inputs[i].parse().expect("Invalid input");
        let mut number = g;
        while number > 0 {
            let h = number % 10;
            number /= 10;
            if h % 3 == 0 {
                count += h;
            }
        }
    }

    println!("{}", count);
}
