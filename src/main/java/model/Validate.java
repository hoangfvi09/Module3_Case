package model;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validate {
    public String[] error = {"Username is not blank !", "Password must have 6 character at least", "Re-pass is not same password  !", "Email must have format abc@gmail.com"};

    public final String NAME_USER_REGEX = "^\\S[(.*?)\\D\\s]+\\S$";
    public final String PASSWORD_REGEX = "^[a-z0-9]{6,}$";
    public final String EMAIL_REGEX = "^[a-z0-9]+@[a-z]+[.]{1}[a-z]+$";

    public boolean valid(String regex, String input) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }

    public boolean checkUserName(String regex_name, String input_name) {
        if (valid(regex_name, input_name)) {
            return true;
        }
        return false;
    }

    public boolean checkUserPass(String regex_pass, String input_pass) {
        if (valid(regex_pass, input_pass)) {
            return true;
        }
        return false;
    }

    public boolean checkAccessPass(String input_pass, String input_access) {
        if (input_access.equalsIgnoreCase(input_pass)) {
            return true;
        }
        return false;
    }

    public boolean checkUserEmail(String regex_email, String input_email) {
        if (valid(regex_email, input_email)) {
            return true;
        }
        return false;
    }
}