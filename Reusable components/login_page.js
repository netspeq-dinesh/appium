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

    return find.byText("Open Dialog Box"); 
     
  }



  async clickDialogButton() {

    console.log("Waiting for Guest button...");
    await this.driver.execute("flutter:waitFor", this.popUpButton);
    console.log("Clicking Guest button...");
    await this.driver.elementClick(this.popUpButton);
    
  }

  


  get submitButton() {

    return find.byText("Submit"); 
     
  }

  async clickSubmitButton()
  {

    console.log("Waiting for Guest button...");
    await this.driver.execute("flutter:waitFor", this.popUpButton);
    console.log("Clicking Guest button...");
    await this.driver.elementClick(this.submitButton);

  }



// async goBack() {
//     try {
//       console.log("Navigating back...");
//       const platform = await this.driver.capabilities.platformName;
//       if (platform === "Android") {
//         await this.driver.pressKeyCode(4); // Android back button
//       } else if (platform === "iOS") {
//         await this.driver.execute("mobile: swipe", { direction: "right" }); // iOS back gesture
//       } else {
//         await this.driver.back(); // Fallback to generic back method
//       }
//     } catch (error) {
//       console.error("Back Navigation Error:", error);
//     }
//   }



  async login(email, password) {
    try {

      console.log("Waiting for email field...");

      await this.driver.execute("flutter:waitFor", this.emailField);
      
      console.log("Entering email...");

      await this.driver.elementSendKeys(this.emailField, email);
  
      console.log("Entering password...");

      await this.driver.elementSendKeys(this.passwordField, password);
  
      console.log("Clicking login button...");


      await this.clickGuestButton();

  
      await this.clickDialogButton();

      console.log("Waiting before clicking Submit...");

      await new Promise(resolve => setTimeout(resolve, 3000));  // 3 seconds delay

      await  this.clickSubmitButton();
  
      //  await this.driver.elementClick(find.pageBack);


      //  await this.driver.elementClick(find.pageBack);
} 


    
    catch (error) {
      
      console.error("Login Error:", error);
    }

  }

  }



module.exports = LoginPage;
