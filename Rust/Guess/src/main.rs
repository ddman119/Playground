extern crate rand;

use std::io::prelude::*;
use std::io;
use std::cmp::Ordering;
use rand::Rng;

fn main() {
    let random_number = rand::thread_rng().gen_range(1, 101);

    loop {
        println!("Guess the number!");
        print!("Please enter a guess: ");

        io::stdout().flush()
            .ok()
            .expect("Could not flush stdout");

        let mut guess = String::new();

        io::stdin().read_line(&mut guess)
            .ok()
            .expect("Failed to read your guess.");

        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        println!("You guessed {}", guess);

        match guess.cmp(&random_number) {
            Ordering::Less => println!("Too low!"),
            Ordering::Greater => println!("Too high!"),
            Ordering::Equal => {
                println!("You win!");
                break;
            }
        }
    }
}
