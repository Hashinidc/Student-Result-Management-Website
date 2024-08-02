package org.example;

import java.time.Duration;

import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.edge.EdgeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class ViewResultsTest {

    @Test
    public void testViewResults() {
        // Set EdgeOptions to run in headless mode (remove for visual debugging)
        EdgeOptions options = new EdgeOptions();
        // options.addArguments("--headless"); // Comment this line to run in non-headless mode

        // Initialize the WebDriver with headless option
        WebDriver driver = new EdgeDriver(options);
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5)); // Reduced wait time

        try {
            // Navigate to the login page
            driver.get("http://localhost/result/Result-Mangement-System-main/login.html");

            // Enter username and password
            driver.findElement(By.id("username")).sendKeys("hash"); // replace with actual username
            driver.findElement(By.id("password")).sendKeys("0000"); // replace with actual password
            driver.findElement(By.cssSelector("input[type='submit']")).click();

            // Wait until redirected to the student dashboard
            wait.until(ExpectedConditions.urlContains("student_dashboard.php"));

            // Navigate to the "View Results" page
            WebElement viewResultsButton = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//button[contains(text(), 'View Results')]")));
            viewResultsButton.click();

            // Wait until the results page is visible
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.tagName("h2")));

            // Verify that the cumulative GPA and results are displayed
            WebElement cumulativeGPA = driver.findElement(By.xpath("//h3[contains(text(), 'Cumulative GPA:')]"));
            System.out.println("Cumulative GPA Displayed: " + cumulativeGPA.isDisplayed());

            WebElement resultsTable = driver.findElement(By.xpath("//div[@class='container']"));
            System.out.println("Results Table Displayed: " + resultsTable.isDisplayed());

            // Additional verifications can be added here based on specific requirements

        } catch (Exception e) {
            // Print out the exception for debugging
            System.out.println("An error occurred: " + e.getMessage());
        } finally {
            // Close the browser
            driver.quit();
        }
    }
}
