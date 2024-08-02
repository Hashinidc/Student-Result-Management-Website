package org.example;

import java.time.Duration;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

/**
 * Author: Sanoj Indrasinghe
 */
public class LogoutTest {

    private WebDriver driver;
    private WebDriverWait wait;

    @BeforeEach
    public void setUp() {
        // Initialize the WebDriver - using EdgeDriver here
        driver = new EdgeDriver();
        // Initialize WebDriverWait with a 10-second timeout
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        // Maximize the browser window
        driver.manage().window().maximize();
    }

    @AfterEach
    public void tearDown() {
        // Close the browser
        if (driver != null) {
            driver.quit();
        }
    }

    @Test
    public void testLogout() throws InterruptedException {
        // Navigate to the login page
        driver.get("http://localhost/result/Result-Mangement-System-main/login.html");

        // Perform login actions
        WebElement usernameField = driver.findElement(By.id("username"));
        WebElement passwordField = driver.findElement(By.id("password"));
        WebElement loginButton = driver.findElement(By.xpath("//input[@type='submit']")); // Updated XPath

        usernameField.sendKeys("dulanga");
        passwordField.sendKeys("0000");
        loginButton.click();

        // Wait until the dashboard page is loaded
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("a.logout-btn")));

        // Add delay to ensure the dashboard is fully loaded
        Thread.sleep(2000); // Wait for 2 seconds

        // Find and click the logout button
        WebElement logoutButton = driver.findElement(By.cssSelector("a.logout-btn")); // Using CSS Selector
        wait.until(ExpectedConditions.elementToBeClickable(logoutButton));
        logoutButton.click();

        // Add delay to ensure logout process is complete
        Thread.sleep(2000); // Wait for 2 seconds

        // Wait until the login page is loaded again
        wait.until(ExpectedConditions.urlToBe("http://localhost/result/Result-Mangement-System-main/login.html"));

        // Verify that the current URL is the login page URL
        String currentUrl = driver.getCurrentUrl();
        System.out.println("Current URL after logout: " + currentUrl); // Add logging for debugging
        assert currentUrl.equals("http://localhost/result/Result-Mangement-System-main/login.html") : "Logout failed, user is not redirected to login page.";

        // Verify that session is destroyed by checking if the dashboard element is not present
        boolean isDashboardPresent = driver.findElements(By.cssSelector("a.logout-btn")).size() > 0;
        assert !isDashboardPresent : "Logout failed, session is not destroyed.";
    }
}
