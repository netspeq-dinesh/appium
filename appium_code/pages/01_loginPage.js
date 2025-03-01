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



 


  // get loginButton() {
  //   return find.byText("Login");
  // }



  // get guestButton() {
  //   return find.byText("Guest");
  // }



  // get popUpButton() {
  //   return find.byText("Open Dialog Box");
  // }


  // get submitButton() {
  //   return find.byText("Submit");
  // }




 // Login Function




  async login(email, password) {

    try {

  
      await waitUtils.waitForElement(this.driver, this.emailField);

      

      await this.driver.elementSendKeys(this.emailField, email);

      

      await this.driver.elementSendKeys(this.passwordField, password);

      

      await actions.clickElementByText(this.driver, "Guest");

    
      
      // await actions.clickElementByText(this.driver, "Open Dialog Box")



     // await waitUtils.delay();


     //  await actions.clickElementByText(this.driver, "Submit");


      // await waitUtils.delay();

      

      //   await actions.clickElementByText(this.driver, "Scroll up down");

    
      } 



    catch (error) {

     console.error("Login Error:", error);

}


  }

}

module.exports = LoginPage;

