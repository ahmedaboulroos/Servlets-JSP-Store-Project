package eg.gov.iti.jets.config.filter;

import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.service.UserService;

import javax.persistence.NoResultException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/registration")
public class RegistrationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        if (request.getMethod().equalsIgnoreCase("post")) {

            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String birthDate = request.getParameter("birthdate");

            String country = request.getParameter("country");
            String state = request.getParameter("state");
            String city = request.getParameter("city");
            String street = request.getParameter("street");
            String zipCode = request.getParameter("zipcode");
            System.out.println(firstName + " > " + lastName + " > " + email + " > " + password + " > " + phone
                    + " > " + birthDate + " > " + country + " > " + state + " > " + city + " > " + street + " > " + zipCode);
            System.out.println("validateString(firstName)" + validateString(firstName));
            System.out.println("validateString(lastName)" + validateString(lastName));
            System.out.println("validateEmail(email, request.getServletContext()" + validateEmail(email, request.getServletContext()));
            System.out.println("validatePassword(password)" + validatePassword(password));
            System.out.println("validatePhone(phone)" + validatePhone(phone));
            System.out.println("validateBirthDate(birthDate)" + validateBirthDate(birthDate));
            System.out.println("validateString(country)" + validateString(country));
            System.out.println("validateString(state)" + validateString(state));
            System.out.println("validateString(city)" + validateString(city));
            System.out.println("validateString(street)" + validateString(street));
            System.out.println("validateZipCode(zipCode)" + validateZipCode(zipCode));

            if (!validateString(firstName) || !validateString(lastName) || !validateEmail(email, request.getServletContext())
                    || !validatePassword(password) || !validatePhone(phone) || !validateBirthDate(birthDate)
                    || !validateString(country) || !validateString(state) || !validateString(city)
                    || !validateString(street) || !validateZipCode(zipCode)) {

                ((HttpServletResponse) servletResponse).sendRedirect("registration?invalid=true");
                return;
            }
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }


    private boolean validate(String string, String regex) {
        return string.trim().matches(regex);
    }

    private boolean validateString(String name) {
        return validate(name, "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
    }

    private boolean validateEmail(String email, ServletContext context) {
        boolean validate = validate(email, "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
        return (validate && checkIfEmailIsUnique(email, context));
    }

    private boolean checkIfEmailIsUnique(String email, ServletContext context) {
        UserService userService = (UserService) context.getAttribute("userService");
        User user = null;
        try {
            user = userService.findByEmail(email);
        } catch (NoResultException e) {
            e.printStackTrace();
        }
        return (user == null);
    }

    private boolean validatePhone(String phone) {
        return validate(phone, "^(?:\\+?2)?01[0125]{1}[0-9]{8}$");
    }

    private boolean validatePassword(String password) {
        // complex regex
        return validate(password, "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}$");
    }

    private boolean validateBirthDate(String birthDate) {
        return validate(birthDate, "([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))");
    }

    private boolean validateZipCode(String zipCode) {

        return validate(zipCode, "^\\d{5}(?:[-\\s]\\d{4})?$");
    }
}