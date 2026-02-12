package controller;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import model.LoggedCustomer;
import model.RegisteredCustomer;
import model.CustomerDAO;

import java.io.IOException;

@WebServlet(name = "RegistrationServlet",value = "/registration_servlet")
public class RegistrationServlet extends HttpServlet {
    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            // reading parameters from request
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String dateOfBirth = request.getParameter("dateOfBirth");
                String emailAddress = request.getParameter("emailAddress");
                String emailAddressConfirmation = request.getParameter("emailAddressConfirmation");
                String password = request.getParameter("password");
                String passwordConfirmation = request.getParameter("confirmationPassword");
                String phoneNumber = request.getParameter("phoneNumber");

            // RegistrationCustomer bean instatiation to be given to doSave as input

                RegisteredCustomer customer = new RegisteredCustomer();

                if(isFirstNameValid(firstName) && isLastNameValid(lastName) && isDateOfBirthValid(dateOfBirth) && isEmailAddressValid(emailAddress) && isEmailAddressConfirmationValid(emailAddress, emailAddressConfirmation) && isPasswordVaild(password) && isPasswordConfirmationValid(password,passwordConfirmation)
                && isPhoneNumberValid(phoneNumber)) {

                    customer.setFirstName(firstName);
                    customer.setLastName(lastName);
                    customer.setDateOfBirth(dateOfBirth);
                    customer.setEmailAddress(emailAddress);
                    customer.setConfirmationEmailAddress(emailAddressConfirmation);
                    customer.setPassword(password);
                    customer.setConfirmationPassword(passwordConfirmation);
                    customer.setPhoneNumber(phoneNumber);

                    // instantiating a Model class to interact with the db
                    CustomerDAO service = new CustomerDAO();

                    // invoking the Model service to store the "customer" in the db
                    service.createAccount(customer);


                    //storing the javabean in the "request" object

                    request.setAttribute("customer",customer);


                    Cookie isRegistered = new Cookie("isRegistered","true");
                    response.addCookie(isRegistered);
                    LoggedCustomer loggedCustomer = new LoggedCustomer();
                    loggedCustomer.setFirstName(firstName);
                    loggedCustomer.setLastName(lastName);
                    loggedCustomer.setEmailAddress(emailAddress);
                    loggedCustomer.setPassword(password);
                    request.getSession(false).setAttribute("loggedCustomer",loggedCustomer);

                    RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/results/db-insert-success.jsp?");
                    dispatcher.forward(request, response);
                }




     }

     public boolean isFirstNameValid(String firstName) {
            if(firstName == null || firstName.isEmpty() || !firstName.matches("^[A-Z][a-zA-Z'’\\- ]{1,}$"))
                return false;
            else
                return true;
     }



     public boolean isLastNameValid(String lastName) {
         if(lastName == null || lastName.isEmpty() || !lastName.matches("^[A-Z][a-zA-Z'’\\- ]{1,}$"))
             return false;
         else
             return true;
    }




     public boolean isEmailAddressValid(String emailAddress) {
         if(emailAddress == null || emailAddress.isEmpty() || !emailAddress.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
                return false;
         }
         return true;
     }

     public boolean isEmailAddressConfirmationValid(String emailAddress, String emailAddressConfirmation) {
        return emailAddress.equals(emailAddressConfirmation);
     }

    public boolean isPasswordVaild(String password) {
        if(password == null || password.isEmpty() || !password.matches("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=.*[a-zA-Z0-9]).{8,}"))
            return false;
        else
            return true;
    }


    public boolean isPasswordConfirmationValid(String password, String passwordConfirmation) {
        return password.equals(passwordConfirmation);
    }


     public boolean isDateOfBirthValid(String dateOfBirth) {
        if (dateOfBirth == null || dateOfBirth.isEmpty() || !dateOfBirth.matches("^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/([0-9]{4})$"))
                return false;
        else
            return true;
     }


     public boolean isPhoneNumberValid(String phoneNumber) {
        if (phoneNumber == null || phoneNumber.isEmpty() || !phoneNumber.matches("^\\d{10}$"))
            return false;
        else
            return true;
     }

}
