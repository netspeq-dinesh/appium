const find = require("appium-flutter-finder");
const waitUtils = require("../utils/waitUtils"); // Import wait utilities

class SearchPage {
    constructor(driver) {
        this.driver = driver;
        this.searchField = find.byValueKey("searchField");  // Store ValueKey Locator
        this.guestButton = find.byText("Guest");  // Locate the "Guest" button by text
    }

    async search(searchText) {
        try {
            // ✅ Ensure search field is present before interacting
            await this.driver.execute("flutter:waitFor", this.searchField);

            // ✅ Click on the search field
            await this.driver.elementClick(this.searchField);

            // ✅ Enter search text
            await this.driver.elementSendKeys(this.searchField, searchText);

            console.log(`✅ Successfully entered search text: ${searchText}`);

            // ✅ Click on the "Guest" button after entering search text
            await this.driver.execute("flutter:waitFor", this.guestButton);
            await this.driver.elementClick(this.guestButton);

            console.log("✅ Successfully clicked 'Guest' button");

        } catch (error) {
            console.error(`❌ Failed in search operation: ${error}`);
        }
    }
}

module.exports = SearchPage;
