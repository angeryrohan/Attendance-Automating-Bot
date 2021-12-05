#Import Libraries
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
import time
import datetime
#-----------------------

chrome_options = Options()
chrome_options.add_argument("--use-fake-ui-for-media-stream")
chrome_options.add_argument("start-maximized")

#Web Automation
driver = webdriver.Chrome(ChromeDriverManager().install(), chrome_options=chrome_options)
driver.get('https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize?response_type=id_token&scope=openid%20profile&client_id=5e3ce6c0-2b1f-4285-8d4b-75ee78787346&redirect_uri=https%3A%2F%2Fteams.microsoft.com%2Fgo&state=eyJpZCI6ImU1ODZjZDkyLTFhZGUtNDhjOS1hMWRkLTA1NzNhNmJmNDc2YSIsInRzIjoxNjMzMzY1ODYyLCJtZXRob2QiOiJyZWRpcmVjdEludGVyYWN0aW9uIn0%3D&nonce=ea9af1a6-c30b-4f9f-b242-5efa5c5250b5&client_info=1&x-client-SKU=MSAL.JS&x-client-Ver=1.3.4&client-request-id=53224bef-9108-4951-9183-c8d8d2ee8fe3&response_mode=fragment&sso_reload=true')
emailBox = driver.find_element_by_xpath('//*[@id="i0116"]')
time.sleep(1)
emailBox.send_keys('MY EMAIL')
nextButton = driver.find_element_by_xpath('//*[@id="idSIButton9"]')
nextButton.click()
time.sleep(2)
passBox = driver.find_element_by_xpath('//*[@id="i0118"]')
passBox.send_keys('MY PASS')
time.sleep(1)
driver.find_element_by_xpath('//*[@id="idSIButton9"]').click()
time.sleep(2)
driver.find_element_by_xpath('//*[@id="idSIButton9"]').click()
time.sleep(3)
driver.find_element_by_xpath('//*[@id="tilesHolder"]/div[1]/div/div').click()
time.sleep(25)
driver.find_elements_by_class_name('team-card')[8].click()
time.sleep(4)
driver.find_elements_by_class_name('icons-call-jump-in')[0].click()
time.sleep(2)
driver.find_element_by_xpath('//*[@id="page-content-wrapper"]/div[1]/div/calling-pre-join-screen/div/div/div[2]/div[1]/div[2]/div/div/section/div[2]/toggle-button[1]/div/button').click()
time.sleep(2)
driver.find_element_by_xpath('//*[@id="preJoinAudioButton"]/div/button')
time.sleep(2)
driver.find_element_by_xpath('//*[@id="page-content-wrapper"]/div[1]/div/calling-pre-join-screen/div/div/div[2]/div[1]/div[2]/div/div/section/div[1]/div/div/button').click()
time.sleep(3300) # waits for 55 minutes (Theory Class = 50 mins)
driver.find_element_by_id('hangup-button').click()
driver.close()
#------------------


