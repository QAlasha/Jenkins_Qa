import allure
from selenium import webdriver
import allure


@allure.step('Открытие браузера')
def test_google_search():
    driver = webdriver.Remote(
        command_executor='http://selenium-hub:4444/wd/hub',
        options=webdriver.ChromeOptions()
    )
    driver.get("http://www.google.com")
    assert "Google" in driver.title
    driver.quit()


if __name__ == "__main__":
    test_google_search()
