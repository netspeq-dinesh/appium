const find = require("appium-flutter-finder");
const actions = require("../utils/actions"); // Import reusable functions
const waitUtils = require("../utils/waitUtils"); // Import wait utilities

class LoginPage {
  constructor(driver) {
    this.driver = driver;
  }

  // Locators
  get emailField() {

  return find.byValueKey("emailField");

 }

  get passwordField() {

    return find.ancestor({
      of: find.byText("Password"),
      matching: find.byType("TextFormField"),
    });

 }


  get loginButton() {
    return find.byText("Login");
  }

  get guestButton() {
    return find.byText("Guest");
  }

  get popUpButton() {
    return find.byText("Open Dialog Box");
  }

  get submitButton() {
    return find.byText("Submit");
  }




  // Login Function



  async login(email, password) {

    try {

      console.log("Waiting for email field...");

      await waitUtils.waitForElement(this.driver, this.emailField);

      console.log("Entering email...");

      await this.driver.elementSendKeys(this.emailField, email);

      console.log("Entering password...");

      await this.driver.elementSendKeys(this.passwordField, password);

      console.log("Clicking 'Guest' button...");

      await actions.clickElementByText(this.driver, "Guest");

      console.log("Clicking 'Open Dialog Box' button...");

       await actions.clickElementByText(this.driver, "Open Dialog Box");

      console.log("Waiting before clicking 'Submit'...");

      await waitUtils.delay(); // Default 3 seconds

      console.log("Clicking 'Submit' button...");

       await actions.clickElementByText(this.driver, "Submit");



      console.log("Login process completed successfully."); 


         await waitUtils.delay();

         await this.driver.elementClick(find.pageBack());

       
      } 


    
    catch (error) {

     console.error("Login Error:", error);

}

  }

}

module.exports = LoginPage;

