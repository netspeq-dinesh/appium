// What is the Page Object Model (POM)?
// The Page Object Model (POM) is a design pattern used in test automation to separate test logic from UI elements and actions. This makes test scripts more readable, maintainable, and reusable.

// Why use POM?
// Separation of Concerns → Keeps test logic separate from UI locators.
// Reusability → One page object can be used across multiple test cases.
// Maintainability → If a UI element changes, update only the Page Object instead of modifying every test.
// Readability → Makes test cases cleaner and more understandable.
// Example of POM in Appium Flutter Testing with JavaScript
// Let’s assume we are testing a Login Page of a Flutter app.


// 1️⃣ Page Object for Login Page (loginPage.js)

//loginPage.js



const { byValueKey } = require('appium-flutter-finder');

class LoginPage {
    constructor(driver) {
        this.driver = driver;
        this.usernameField = byValueKey('username_field');
        this.passwordField = byValueKey('password_field');
        this.loginButton = byValueKey('login_button');
    }

    async enterUsername(username) {
        await this.driver.element(this.usernameField).setValue(username);
    }

    async enterPassword(password) {
        await this.driver.element(this.passwordField).setValue(password);
    }

    async tapLoginButton() {
        await this.driver.element(this.loginButton).click();
    }
}

module.exports = LoginPage;



// 👉 This file contains only the elements and actions related to the Login Page.

// 2️⃣ Test Case Using Page Object (login.test.js)



//login.test.js

const { remote } = require('webdriverio');
const LoginPage = require('../pageObjects/loginPage');
const { expect } = require('chai');

describe('Login Test', function () {
    let driver, loginPage;

    before(async function () {
        driver = await remote(require('../config/test-config'));
        loginPage = new LoginPage(driver);
    });

    it('should login successfully with valid credentials', async function () {
        await loginPage.enterUsername('testuser');
        await loginPage.enterPassword('password123');
        await loginPage.tapLoginButton();

        // Add assertion for successful login
        const homeScreen = await driver.element(byValueKey('home_screen'));
        expect(await homeScreen.isDisplayed()).to.be.true;
    });

    after(async function () {
        await driver.deleteSession();
    });
});


👉 Test logic is clean because UI interactions are in the LoginPage class.

Key Takeaways:
✔ Page Objects contain UI locators and functions for interacting with the app.
✔ Test cases use Page Objects to perform actions, making them easy to read and maintain.
✔ If the UI changes, update only the Page Object file, not every test case.

Would you like a full example with multiple pages? 🚀
