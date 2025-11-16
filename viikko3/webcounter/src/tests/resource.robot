*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SERVER}    localhost:5001
${DELAY}     0.5 seconds
${HOME_URL}  http://${SERVER}
${HEADLESS}  false

*** Keywords ***
Open And Configure Browser
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${chrome_options}  add_argument  --headless=new
    Call Method  ${chrome_options}  add_argument  --no-sandbox
    Call Method  ${chrome_options}  add_argument  --disable-dev-shm-usage
    Call Method  ${chrome_options}  add_argument  --disable-gpu
    Call Method  ${chrome_options}  add_argument  --disable-extensions
    Call Method  ${chrome_options}  add_argument  --window-size=1920,1080
    Call Method  ${chrome_options}  add_argument  --remote-debugging-port=9222
    Open Browser  ${HOME_URL}  Chrome  options=${chrome_options}
    Set Selenium Speed  ${DELAY}
