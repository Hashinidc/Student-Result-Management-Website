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

public class AddDegreeTest {

    @Test
    public void testAddDegree() throws InterruptedException {
        // Set EdgeOptions to run with a GUI (not headless)
        EdgeOptions options = new EdgeOptions();

        // Initialize the WebDriver
        WebDriver driver = new EdgeDriver(options);
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // Increased wait time

        try {
            // Navigate to the login page
            driver.get("http://localhost/result/Result-Mangement-System-main/login.html");
            Thread.sleep(1000); // Wait to observe the page

            // Enter username and password
            driver.findElement(By.id("username")).sendKeys("dulanga"); // replace with actual username
            driver.findElement(By.id("password")).sendKeys("0000"); // replace with actual password
            Thread.sleep(1000); // Wait to observe input

            // Click login
            driver.findElement(By.cssSelector("input[type='submit']")).click();

            // Wait until redirected to the teacher dashboard
            wait.until(ExpectedConditions.urlContains("teacher_dashboard.php"));
            Thread.sleep(1000); // Wait to observe the dashboard

            // Navigate to the degrees page
            driver.get("http://localhost/result/Result-Mangement-System-main/degrees.php");
            Thread.sleep(1000); // Wait to observe the degrees page

            // Open the Add Degree modal
            WebElement addDegreeButton = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//button[contains(text(), 'Add Degree')]")));
            addDegreeButton.click();
            Thread.sleep(1000); // Wait to observe the modal

            // Wait until the modal is visible
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("addDegreeModal")));

            // Fill out the form for adding a new degree
            WebElement degreeNameInput = driver.findElement(By.id("degree_name"));
            degreeNameInput.sendKeys("Bachelor of IT");
            Thread.sleep(1000); // Wait to observe the input

            // Submit the form
            WebElement submitButton = driver.findElement(By.xpath("//input[@type='submit']"));
            submitButton.click();

            // Verify redirection back to the degrees page and that the new degree is present
            wait.until(ExpectedConditions.urlContains("degrees.php"));
            Thread.sleep(1000); // Wait to observe the updated list

            WebElement degreesTable = wait.until(ExpectedConditions.visibilityOfElementLocated(By.tagName("table")));
            boolean degreeAdded = degreesTable.getText().contains("Bachelor of IT");

            // Assert that the degree was added
            assert degreeAdded : "Degree not added successfully.";

        } finally {
            // Close the browser
            driver.quit();
        }
    }
}
