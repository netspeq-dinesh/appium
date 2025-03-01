const BaseTest = require("../pages/baseTest.js");
const SearchPage = require("../pages/02_searchPage.js");
const { expect } = require("chai");
const waitUtils = require("../utils/waitUtils");

describe("Search Feature Test", function () {
    let test, searchPage;

    this.timeout(30000); // Set timeout for the test

    before(async function () {
        test = new BaseTest();
        await test.init("android"); // Initialize Appium session
        searchPage = new SearchPage(test.driver);
    });

    it("should enter search text 'Dinesh' and verify input", async function () {
        await searchPage.search("Dinesh");

        // ✅ Ensure search field is present before verification
        await waitUtils.waitForElement(test.driver, searchPage.searchField);

        // ✅ Debugging: Capture a screenshot if stuck
        await test.driver.saveScreenshot("./debug_search_input.png");

        // ✅ Correct way to get text from a Flutter TextField
        const searchText = await test.driver.execute("flutter:getText", searchPage.searchField);
        expect(searchText).to.include("Dinesh");

        console.log("✅ Successfully entered and verified search text: Dinesh");
    });

    after(async function () {

        await test.tearDown();
        
    });
});
