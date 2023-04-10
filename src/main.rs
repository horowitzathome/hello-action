use std::{thread, time};

fn main() {
    loop {
        println!("Hello Action");
        let ten_millis = time::Duration::from_millis(1000);
        thread::sleep(ten_millis);
    }
}

#[cfg(test)]
mod tests {

    #[test]
    fn test() {
        println!("Test");
    }
}
