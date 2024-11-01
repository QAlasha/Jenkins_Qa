from selenium import webdriver
import pytest


def test_one():
    URL = 'https://stage-web.pfm.team/'
    driver = webdriver.Chrome()
    driver.implicitly_wait(time_to_wait=25)
    driver.get(URL)
    assert driver.current_url == URL, f'URL: {driver.current_url}'
    driver.quit()