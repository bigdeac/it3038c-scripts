#Problem 1
from datetime import datetime

def calculate_age_in_seconds(birthday):
    current_date = datetime.now()
    age = current_date - birthday
    age_in_seconds = age.total_seconds()
    return int(age_in_seconds)

def get_birthday_from_user():
    while True:
        try:
            birthday_str = input("Enter your birthday (YYYY-MM-DD): ")
            birthday = datetime.strptime(birthday_str, '%Y-%m-%d')
            return birthday
        except ValueError:
            print("Invalid input. Please enter a valid date in the format YYYY-MM-DD.")

if __name__ == "__main__":
    user_birthday = get_birthday_from_user()
    age_in_seconds = calculate_age_in_seconds(user_birthday)
    print(f"You are approximately {age_in_seconds} seconds old.")
