package steps;

import com.codeborne.selenide.Condition;
import com.codeborne.selenide.Selectors;
import com.codeborne.selenide.WebDriverRunner;
import com.codeborne.selenide.impl.Navigator;
import com.codeborne.selenide.impl.WebDriverContainer;
import cucumber.api.java.After;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.open;
import static com.codeborne.selenide.WebDriverRunner.url;

/**
 * Created by David on 10/4/2015.
 */
public class DummySteps {
    @Given("^Using Chrome$")
    public void using_chrome() {
        System.setProperty("webdriver.chrome.driver", "D:\\Utilities\\ChromeDriver\\chromedriver.exe");
        WebDriverRunner.setWebDriver(new ChromeDriver());
    }

    @When("^I open the app$")
    public void i_open_the_app() {
        open("http://localhost:8080");
    }

    @Then("^I see (.*)$")
    public void i_see(String text) throws Exception {
        $(Selectors.byText(text)).shouldBe(Condition.visible);
    }

    @And("^I name myself (.*)$")
    public void i_name_myself(String name) throws Exception {
        open("http://localhost:8080/?name="+name);
    }

    @After
    public void after() {
        WebDriverRunner.closeWebDriver(); //shouldn't have to call this, but oh well
    }
}
