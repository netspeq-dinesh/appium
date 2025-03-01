const BaseTest = require("../pages/baseTest.js");
const LoginPage = require("../pages/01_loginPage.js");
const HomePage = require("../pages/homePage.js");
const loginData = require("../data/loginData.json");
const { expect } = require("chai");


const Mochawesome = require('mochawesome');



describe("Integration Test: Login Flow", function () {


  let test, loginPage, homePage;

  let isloginSuccess;

  this.timeout(30000);

  beforeEach(function () {
    console.clear();
});

  before(async function () {

    test = new BaseTest();

    await test.init("android");

    loginPage = new LoginPage(test.driver);

    homePage = new HomePage(test.driver);

   // logoutPage = new LogoutPage(test.driver);
   // redirectLoginPage = new RedirectLoginPage(test.driver); 
   console.clear();
   process.stdout.write("\x1Bc");


  });



  
  it("should login first successfully with valid credentials", async function () {


   // await driver.reset();

    await loginPage.login(loginData.validUser.email, loginData.validUser.password);

    const displayed = await homePage.isDisplayed();

    console.log("home page displayed",displayed);

    expect(displayed).to.be.true;

    
   });


  after(async function () {

    await test.tearDown();

  });
});