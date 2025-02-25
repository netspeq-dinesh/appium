const find = require("appium-flutter-finder");

module.exports = {
    /**
     * Click an element by its visible text (Button or Text).
     * @param {WebDriver} driver - Appium WebDriver instance.
     * @param {string} text - The text of the element to click.
     */
    async clickElementByText(driver, text) {
        try {
            console.log(`Waiting for element: ${text}...`);
            const element = find.byText(text);
            
            await driver.execute("flutter:waitFor", element);
            console.log(`Clicking element: ${text}...`);
            await driver.elementClick(element);
        } catch (error) {
            console.error(`Error clicking element: ${text}`, error);
        }
    },

   

};


//how to use 

// const actions = require("../utils/actions"); // Import reusable functions

 //await actions.clickElementByText(this.driver, "Guest");
