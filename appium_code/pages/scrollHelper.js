// const { remote } = require("webdriverio");
// const { expect } = require("chai");

// describe("Enter Text in Search Field", function () {
//   this.timeout(30000);
//   let driver;

//   before(async function () {
//     driver = await remote(require("../test-config"));
//   });

//   it("should enter 'Item 20' in the search box", async function () {
//     console.log("🔹 Checking if search box exists...");
//     const searchField = await driver.$("flutter:key=searchField");
//     await searchField.waitForExist({ timeout: 5000 });

//     console.log("✅ Search box found. Entering 'Item 20'...");
//     await searchField.setValue("Item 20");

//     const enteredText = await searchField.getText();
//     console.log(`🔹 Entered text: ${enteredText}`);

//     expect(enteredText).to.equal("Item 20");
//   });

//   after(async function () {
//     if (driver) {
//       await driver.deleteSession();
//     }
//   });
// });
