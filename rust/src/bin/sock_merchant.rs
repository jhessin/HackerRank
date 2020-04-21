use std::collections::HashMap;
use std::io::{stdin, stdout, Write};

fn trim(s: &mut String) {
  if let Some('\n') = s.chars().next_back() {
    s.pop();
  }
  if let Some('\r') = s.chars().next_back() {
    s.pop();
  }
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
  let mut arg1 = String::new();
  let mut arg2 = String::new();
  stdout().flush();
  stdin().read_line(&mut arg1).unwrap();
  trim(&mut arg1);
  stdout().flush();
  stdin().read_line(&mut arg2).unwrap();
  trim(&mut arg2);

  let arg1 = arg1.parse::<u32>()?;
  let arg2 = arg2
    .split_ascii_whitespace()
    .map(|s| s.parse::<u32>().unwrap())
    .collect::<Vec<u32>>();

  println!("{}", sockMerchant(arg1, arg2));

  Ok(())
}

fn sockMerchant(_: u32, ar: Vec<u32>) -> u32 {
  let mut socks = HashMap::<u32, u32>::new();

  for color in ar {
    let sock = socks.entry(color).or_insert(0);
    *sock += 1;
  }
  // println!("{:?}", socks);

  let mut total_pairs = 0;
  for (_, count) in socks {
    total_pairs += if count % 2 == 0 { count / 2 } else { (count - 1) / 2 };
  }

  total_pairs
}
