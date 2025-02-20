const find = require("appium-flutter-finder");

class LoginPage {
  constructor(driver) {
    this.driver = driver;
  }

  get emailField() {
    return find.byValueKey("emailField"); 
  }

  get passwordField() {
    return find.byValueKey("passwordField"); 
  }

  get loginButton() {
    return find.byValueKey("loginButton"); 
  }

  async login(email, password) {
    try {
      console.log("Waiting for email field...");
      await this.driver.execute("flutter:waitFor", this.emailField); // Wait for element

      console.log("Entering email...");
      await this.driver.elementSendKeys(this.emailField, email);

      console.log("Entering password...");
      await this.driver.elementSendKeys(this.passwordField, password);

      console.log("Clicking login button...");
      await this.driver.elementClick(this.loginButton);
      
    } catch (error) {
      console.error("Login Error:", error);
    }
  }
}

module.exports = LoginPage;
