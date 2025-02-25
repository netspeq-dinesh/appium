module.exports = {
    /**
     * Wait for an element to be visible before interacting with it.
     * @param {WebDriver} driver - Appium WebDriver instance.
     * @param {Element} element - The element to wait for.
     * @param {number} timeout - Max wait time in milliseconds (default: 5000ms).
     */
    async waitForElement(driver, element, timeout = 5000) {
        try {
            console.log(`Waiting for element for ${timeout}ms...`);
            await driver.execute("flutter:waitFor", element, { timeout });
        } catch (error) {
            console.error("Error waiting for element:", error);
        }
    },

    /**
     * Pause execution for a specified duration.
     * @param {number} ms - The duration to wait in milliseconds (default: 3000ms).
     */
    async delay(ms = 3000) {
        console.log(`Delaying for ${ms}ms...`);
        return new Promise(resolve => setTimeout(resolve, ms));
    }
};
