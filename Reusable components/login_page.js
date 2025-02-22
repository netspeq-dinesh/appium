const find = require("appium-flutter-finder");

class LoginPage {
  constructor(driver) {
    this.driver = driver;
  }

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

  return find.byText("Guest"); // Find button by text

 }

 async clickGuestButton() {

  console.log("Waiting for Guest button...");

  await this.driver.execute("flutter:waitFor", this.guestButton);

  console.log("Clicking Guest button...");

  await this.driver.elementClick(this.guestButton);

 }

 

  get popUpButton() {
    return find.byText("Open Dialog Box");  // Find button by text
  }


  async clickDialogButton() {

    console.log("Waiting for Guest button...");
    await this.driver.execute("flutter:waitFor", this.popUpButton);
    console.log("Clicking Guest button...");
    await this.driver.elementClick(this.popUpButton);
    
  }




  async login(email, password) {

    try {


      // const allFields = await this.driver.execute("flutter:dumpTree");
      // console.log(allFields);


      console.log("Waiting for email field...");

      await this.driver.execute("flutter:waitFor", this.emailField); // Wait for element

      console.log("Entering email...");

      await this.driver.elementSendKeys(this.emailField, email);

      console.log("Entering password...");

      await this.driver.elementSendKeys(this.passwordField, password);




      console.log("Clicking login button...");


      await this.clickGuestButton();

      await  this.clickDialogButton()


     // await this.driver.elementClick(this.loginButton);


    //  await this.driver.waitUntil(() => this.driver.elementDisplayed(this.guestLogin));

    //  await this.driver.elementClick(this.guestLogin);

} 
    

    catch (error) {

      console.error("Login Error:", error);

    }
  }
}


module.exports = LoginPage;
