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

  let _arg1 = arg1.parse::<u32>()?;
  let arg2 = arg2
    .split_ascii_whitespace()
    .map(|s| s.parse::<u32>().unwrap())
    .collect::<Vec<u32>>();

  println!("{}", jumping_on_clouds(arg2));

  Ok(())
}

fn jumping_on_clouds(c: Vec<u32>) -> u32 {
  let mut jumps = 0;
  let mut i = 0;
  while i < c.len() - 1 {
    if let Some(0) = c.get(i + 2) {
      i += 2;
    } else {
      i += 1;
    }
    jumps += 1;
  }
  jumps
}
