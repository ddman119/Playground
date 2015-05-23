extern crate rand;

use std::io::prelude::*;
use std::io;
use rand::Rng;

fn main() {
    println!("Guess the number!");
    print!("Please enter a guess: ");

    io::stdout().flush()
        .ok()
        .expect("Could not flush stdout");

    let random_number = rand::thread_rng().gen_range(1, 101);
    let mut guess = String::new();

    io::stdin().read_line(&mut guess)
        .ok()
        .expect("Failed to read your guess.");

    print!("You guessed {}", guess);
    println!("The secret number was {}", random_number);
}
