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
            
           // await driver.execute("flutter:waitFor", element);

          // await driver.execute("flutter:waitForAbsent", element);

            console.log(`Clicking element: ${text}...`);

            await driver.elementClick(element);
            

        } catch (error) {

            console.error(`Error clicking element: ${text}`, error);
        }
    },



async  clickElementById(driver, valueKey) {

  try {
    const element = find.byValueKey(valueKey); // Find element by ValueKey (ID)
    await driver.elementClick(element); // Click the element
    console.log(`✅ Clicked element with ID: ${valueKey}`);
  } catch (error) {
    console.error(`❌ Failed to click element with ID: ${valueKey}`, error);
  }
}



};
