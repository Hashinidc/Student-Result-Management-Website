package org.example;

import java.time.Duration;

import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class LoginTest {

    @Test
    public void testLogin() {

        // Initialize the WebDriver
        WebDriver driver = new EdgeDriver();

        // Set up WebDriverWait with a longer timeout
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20));

        try {
            // Maximize the window
            driver.manage().window().maximize();

            // Navigate to the login page
            driver.get("http://localhost/result/Result-Mangement-System-main/login.html");

            // Locate and fill the username field
            WebElement usernameField = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("username")));
            usernameField.sendKeys("dulanga"); // Replace with actual test username

            // Locate and fill the password field
            WebElement passwordField = driver.findElement(By.id("password"));
            passwordField.sendKeys("0000"); // Replace with actual test password

            // Locate and click the login button
            WebElement loginButton = driver.findElement(By.xpath("//input[@type='submit']"));
            loginButton.click();

            // Wait for redirection to the appropriate dashboard
            wait.until(ExpectedConditions.or(
                ExpectedConditions.urlToBe("http://localhost/result/Result-Mangement-System-main/teacher_dashboard.php"),
                ExpectedConditions.urlToBe("http://localhost/result/Result-Mangement-System-main/student_dashboard.php")
            ));

            // Log the current URL and verify successful login
            String currentUrl = driver.getCurrentUrl();
            System.out.println("Current URL: " + currentUrl);
            if (currentUrl.contains("teacher_dashboard.php")) {
                System.out.println("Successfully logged in as a teacher.");
            } else if (currentUrl.contains("student_dashboard.php")) {
                System.out.println("Successfully logged in as a student.");
            } else {
                System.out.println("Login failed or redirected to an unexpected page.");
            }
        } finally {
            // Close the browser
            driver.quit();
        }
    }
}
