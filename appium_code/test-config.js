// test-config.js
// test-config.js
module.exports ={
    logLevel: 'error',
    androidCaps:{
        platformName: 'android',
      'appium:deviceName': 'emulator-5554',
      'appium:platformVersion': '15',
      'appium:automationName':'Flutter',
      'appium:app': "C:/Users/netsp/OneDrive/Desktop/Appium_Demo/appium_one/build/app/outputs/flutter-apk/app-debug.apk", 
      'appium:noReset': true,
      "appium:newCommandTimeout": 1200 
      // accessibilityIdEnabled: true
    },
    iosCaps:{
        platformName: 'iOS',
      'appium:platformVersion': '12.2',
      'appium:deviceName': 'iPhone X',
      'appium:noReset': true,
      'appium:app': 'Runner.zip',
      'appium:automationName':'Flutter',
    }
}