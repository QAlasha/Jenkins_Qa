from selenium import webdriver
from selenium.webdriver.chrome.options import Options


def test_one():
    URL = 'https://stage-web.pfm.team/'
    chrome_options = Options()
    chrome_options.add_argument("--headless")
    driver = webdriver.Remote(command_executor='http://localhost:4444/wd/hub', options=chrome_options)
    driver.implicitly_wait(time_to_wait=25)
    driver.get(URL)
    assert driver.current_url == URL, f'URL: {driver.current_url}'
    driver.quit()


