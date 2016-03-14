fn main() {

}

fn add(numbers: &str) -> i32 {
    let numbers_list: Vec<&str>;
    
    if numbers.starts_with("//") {

        let delimiter = numbers.chars().skip(2).next().unwrap();

        numbers_list = numbers.split(|c| c == delimiter || c == '\n').collect();

    } else {

        numbers_list = numbers.split(|c| c == ',' || c == '\n').collect();

    }

    sum_string_vector(&numbers_list)
}

fn sum_string_vector(numbers: &Vec<&str>) -> i32 {
    let mut sum: i32 = 0;
    for number in numbers {
        match number.parse::<i32>() {
            Ok(n) => sum += n,
            _ => continue
        }
    }
    sum
}

#[test]
fn add_function_exists() {
    add("abc");
}

#[test]
fn add_returns_0_if_empty_string() {
    assert_eq!(0, add(""));
}

#[test]
fn add_returns_5_when_passed_5() {
    assert_eq!(5, add("5"));
}

#[test]
fn add_returns_9_when_passed_9() {
    assert_eq!(9, add("9"));
}

#[test]
fn add_returns_sum_of_1_and_2() {
    assert_eq!(3, add("1,2"));
}

#[test]
fn add_returns_sum_of_4_and_nothing() {
    assert_eq!(4, add("4,"));
}

#[test]
fn add_returns_sum_of_nothing_and_3() {
    assert_eq!(3, add(",3"));
}

#[test]
fn add_returns_negative_single_number() {
    assert_eq!(-2, add("-2"));
}

#[test]
fn add_returns_sum_of_positive_and_negative_numbers() {
    assert_eq!(-1, add("-3,2"));
}

#[test]
fn add_returns_sum_of_3_numbers() {
    assert_eq!(12, add("5,4,3"));
}

#[test]
fn add_returns_sum_of_5_numbers() {
    assert_eq!(16, add("-3,5,-1,10,5"));
}

#[test]
fn add_returns_sum_with_newline_delimiter() {
    assert_eq!(6, add("1\n2,3"));
}

#[test]
fn add_returns_sum_with_custom_delimiter() {
    assert_eq!(3, add("//;\n1;2"));
}

#[test]
fn add_returns_sum_with_underscore_delimiter() {
    assert_eq!(6, add("//_\n3_2_1"));
}

// sum_string_vector tests

#[test]
fn sum_string_vector_returns_correctly() {
    let numbers: Vec<&str> = "3,5,6".split(',').collect();
    assert_eq!(14, sum_string_vector(&numbers));
}

