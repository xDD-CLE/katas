fn main() {

}

fn add(numbers: &str) -> i32 {
    0
}

#[test]
fn add_function_exists() {
    add("abc");
}

#[test]
fn add_returns_0_if_empty_string() {
    assert_eq!(0, add(""));
}
