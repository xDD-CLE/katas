package features.steps;

import com.codeborne.selenide.Selectors;
import com.codeborne.selenide.WebDriverRunner;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import org.openqa.selenium.chrome.ChromeDriver;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.open;

/**
 * Created by David on 10/4/2015.
 */
public class Example_Steps {
    @Given("^Home Page is open$")
    public void home_page_is_open() throws Throwable {
        open("http://localhost:9000");
    }

    @Then("^(.*) is displayed$")
    public void header_is_displayed() throws Throwable {
        $(Selectors.byText("Welcome to Play"));
    }

    @Given("^Using Chrome$")
    public void a_fresh_browser() throws Throwable {
        WebDriverRunner.setWebDriver(new ChromeDriver());
    }
}
