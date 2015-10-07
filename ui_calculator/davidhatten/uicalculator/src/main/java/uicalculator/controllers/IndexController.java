package uicalculator.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by David on 10/4/2015.
 */
@Controller
public class IndexController {

    @RequestMapping("/")
    String index(@RequestParam(value="name", required=false, defaultValue="Stranger") String name, Model model){
        model.addAttribute("nameText", String.format("Hello %s!", name));
        return "index";
    }
}
