use std::io;

fn check_p(x: i32) -> i32 {
    let mut b = 0;
    let mut z;
    for i in (2..=x).rev() {
        z = 1;
        for j in 2..=((i as f64).sqrt() as i32) {
            if i % j == 0 {
                z = 0;
                break;
            }
        }
        if z == 1 {
            b = i;
            break;
        }
    }
    for i in x.. {
        z = 1;
        for j in 2..=((i as f64).sqrt() as i32) {
            if i % j == 0 {
                z = 0;
                break;
            }
        }
        if z == 1 {
            if x - b > i - x {
                b = i;
            }
            break;
        }
    }
    b
}

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let x: i32 = input.trim().parse().expect("Please enter a valid number");
    println!("{}", (x - check_p(x)).abs());
}