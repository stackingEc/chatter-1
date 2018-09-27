from django.test import TestCase
from selenium import webdriver


# Create your tests here.

class UploadValidators(TestCase):

    def setUp(self):
        self.browser = webdriver.Firefox()
        self.browser.get(self.live_server_url)

    def test_user_registration(self):
        self.browser.find_element_by_id("id-register").click()
        username = "andrews"
        self.browser.find_element_by_id("id_username").send_keys(username)
        self.browser.find_element_by_id("id_email").send_keys("rsilva2014@@live.com")
        self.browser.find_element_by_id("id_password1").send_keys("Psiph5sK")
        self.browser.find_element_by_id("id_password2").send_keys("Psiph5sK")

        self.browser.find_element_by_id("user-registration-submit").click()
        self.assertEqual(username, self.browser.find_element_by_id("username-text").text)
